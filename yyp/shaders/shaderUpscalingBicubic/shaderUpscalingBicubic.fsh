///@shader shaderUpscalingBicubic
///@description Fragment shader.
///@uniform {vec2(width, height)} resolution
///@uniform {float} brightness
///@uniform {float} contrast

	varying vec4 inputColor;
	varying vec2 inputTexture;
	
	uniform vec2 resolution;
	uniform float brightness;
	uniform float contrast;
	

	vec4 cubic(float v) {
		vec4 n = vec4(1.0, 2.0, 3.0, 4.0) - v;
		vec4 s = n * n * n;
		float x = s.x;
		float y = s.y - 4.0 * s.x;
		float z = s.z - 4.0 * s.y + 6.0 * s.x;
		float w = 6.0 - x - y - z;
		return vec4(x, y, z, w);
	}

	void main() {
		vec2 parsedResolution = vec2(1.0 / resolution.x, 1.0 / resolution.y);
	
		vec2 coord = inputTexture / parsedResolution - 0.5;
		vec2 f = fract(coord);
		coord -= f;

		vec4 x_cubic = cubic(f.x);
		vec4 y_cubic = cubic(f.y);

		vec4 c = vec4(coord - 0.5, coord + 1.5);
		vec4 s = vec4(x_cubic.x + x_cubic.y, y_cubic.x + y_cubic.y, x_cubic.z + x_cubic.w, y_cubic.z + y_cubic.w);
		vec4 offset = c + vec4(x_cubic.y, y_cubic.y, x_cubic.w, y_cubic.w) / s;

		vec4 sample_0 = texture2D(gm_BaseTexture, offset.xy * parsedResolution);
		vec4 sample_1 = texture2D(gm_BaseTexture, offset.zy * parsedResolution);
		vec4 sample_2 = texture2D(gm_BaseTexture, offset.xw * parsedResolution);
		vec4 sample_3 = texture2D(gm_BaseTexture, offset.zw * parsedResolution);

		float t = s.x / (s.x + s.z);
		vec4 outputPixel = inputColor * mix(mix(sample_3, sample_2, t), mix(sample_1, sample_0, t), s.y / (s.y + s.w));
	
		/// Pass pixel to renderer
		gl_FragColor = vec4(
			((outputPixel.rgb + brightness) * (1.0 + contrast) / 1.0), 
			outputPixel.a);
	}
	
