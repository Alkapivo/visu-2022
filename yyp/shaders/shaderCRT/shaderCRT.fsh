///@shader shaderDefault
///@description Fragment shader.
///@uniform {float} uni_use_scanlines
///@uniform {vec4(width, height, crtWidth, crtHeight)} uni_crt_sizes
///@uniform {float} uni_radial_distortion_amount
///@uniform {float} uni_border_corner_size
///@uniform {float} uni_border_corner_smoothness
///@uniform {float} uni_brightness
///@uniform {float} uni_noise_strength
///@uniform {float} uni_timer

	varying vec4 inputColor;
	varying vec2 inputTexture;
	
	uniform vec4  uni_crt_sizes;
	uniform float uni_radial_distortion_amount;
	float uni_use_radial_distortion = 1.0;
	float uni_use_border = 1.0;
	float uni_use_RGB_separation = 1.0;
	uniform float uni_use_scanlines;
	float uni_use_noise = 1.0;
	uniform float uni_border_corner_size;
	uniform float uni_border_corner_smoothness;
	uniform float uni_brightness;
	uniform float uni_noise_strength;
	uniform float uni_timer;
	

	vec2 aspect = uni_crt_sizes.xy / uni_crt_sizes.x;

	vec4 scanline_weights(float dist, vec4 col) {
		vec4 width = 2.0 + 2.0 * pow(col, vec4(4.0));
		vec4 weights = vec4(dist * 3.333333);                
		return 0.51 * exp(-pow(abs(weights * sqrt(2.0 / width)), width)) / (0.18 + 0.06 * width);
	}
    
	float border_corners(vec2 UV) {
		UV = UV - 0.5 + 0.5;
		UV = min(UV, 1.0 - UV) * aspect;
		vec2 centre_distance = vec2(uni_border_corner_size);
		UV = (centre_distance - min(UV, centre_distance));
		float dist = sqrt(dot(UV, UV));
		return clamp((centre_distance.x - dist) * uni_border_corner_smoothness, 0.01, 0.99);
	}

	vec2 radial_distortion(vec2 UV) {
		vec2 UV_centre = UV - 0.5;
		float dist = dot(UV_centre, UV_centre) * uni_radial_distortion_amount;
		return (UV + UV_centre * (1.0 + dist) * dist);
	}

	float random(vec2 UV) {
		return fract(sin(dot(UV, vec2(15.5151, 42.2561))) * 12341.14122 * sin(uni_timer * 0.03));   
	}

	float noise(vec2 UV) {
		vec2 i = floor(UV);
		vec2 f = fract(UV);    
		float a = random(i);
		float b = random(i + vec2(1.0, 0.0));
		float c = random(i + vec2(0.0, 1.0));
		float d = random(i + vec2(1.0));    
		vec2 u = smoothstep(0.0, 1.0, f);
		return mix(a,b, u.x) + (c - a) * u.y * (1. - u.x) + (d - b) * u.x * u.y; 
	}
	
	vec3 applyHue(vec3 color, float hue)
	{
	    float angle = radians(hue);
	    vec3 K = vec3(0.57735, 0.57735, 0.57735);
	    float cosAngle = cos(angle);
		
	    /// Rodrigues' rotation formula
	    return color * cosAngle + cross(K, color) * sin(angle) + K * dot(K, color) * (1.0 - cosAngle);
	}


	void main() {
		vec2 one_pixel = 1.0 / uni_crt_sizes.xy;
		vec2 radial_distored_UVs = inputTexture; 
  
		//Apply radial distortion if enabled
		if (uni_use_radial_distortion > 0.0) { 
			radial_distored_UVs = radial_distortion(inputTexture);
		}
		vec2 radial_distored_aspect_ratio = fract(radial_distored_UVs * uni_crt_sizes.xy) - 0.5;
  
		//Set each pixel rows color
		vec4 col  = texture2D(gm_BaseTexture, radial_distored_UVs);
		vec4 col2 = texture2D(gm_BaseTexture, radial_distored_UVs + vec2(0.0, one_pixel.y));
		vec3 output_color = col.xyz;
  
		//Apply Scanlines if enabled
		if (uni_use_scanlines > 0.0) {
			vec4 weights = scanline_weights(radial_distored_aspect_ratio.y, col);
			vec4 weights2 = scanline_weights(1.0 - radial_distored_aspect_ratio.y, col2);
			output_color = (col * weights + col2 * weights2).rgb;
		}
  
		//Apply RGB separation if enabled
		if (uni_use_RGB_separation > 0.0) {
		float mod_factor = inputTexture.x * uni_crt_sizes.z;
		vec3 dotMaskWeights = mix(
			vec3(1.0, 0.7, 1.0),
			vec3(0.7, 1.0, 0.7),
			floor(mod(mod_factor, 2.0)));
		output_color *= dotMaskWeights;
		}
  
		//Apply random noise if enabled
		if (uni_use_noise > 0.0) {
			output_color = mix(output_color, vec3(noise(radial_distored_UVs * uni_crt_sizes.w)), uni_noise_strength);
		}

		//Apply border if enabled
		if (uni_use_border > 0.0) { 
			output_color *= border_corners(radial_distored_UVs);
		}
  	
		vec4 outputPixel = vec4(output_color * uni_brightness, 1.0);
		//outputPixel.r = outputPixel.r + clamp(outputPixel.g - 0.0132, 0.0, 0.15) * 0.028;
		//outputPixel.b = outputPixel.g - clamp(outputPixel.b - 0.0127, 0.0, 0.03) * 0.008;
		//outputPixel.g = mix(outputPixel.g, 144.0 / 255.0, 0.125);
		outputPixel.rgb = applyHue(outputPixel.rgb, 0.5);
	
		/// Pass pixel to renderer
		gl_FragColor = outputPixel;
	}
	