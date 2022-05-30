///@shader shaderBlendModeAdd
///@description Fragment shader.
///@uniform {sampler2D} textureSource

	varying vec4 inputColor;
	varying vec2 inputTexture;
	
	uniform sampler2D textureSource;
	
	void main() {
		
		vec4 source = texture2D(textureSource, inputTexture);
		vec4 dest = texture2D(gm_BaseTexture, inputTexture);
		
		vec4 result = clamp(
			vec4(
				source.r + dest.r, 
				source.g + dest.g, 
				source.b + dest.b, 
				source.a + dest.a), 
			0.0, 
			1.0);

		vec4 outputPixel = mix(dest, result, inputColor.a);
	
		/// Pass pixel to renderer
		gl_FragColor = outputPixel;
	}
	