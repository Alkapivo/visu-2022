///@shader shaderTransparentMask.fsh
///@description Fragment shader.

	varying vec4 inputColor;
	varying vec2 inputTexture;
	

	void main() {
		
		vec4 outputPixel = inputColor * texture2D(gm_BaseTexture, inputTexture);
	
		/// Pass pixel to renderer
		gl_FragColor = vec4(outputPixel.a, outputPixel.a, outputPixel.a, outputPixel.a);
	}
	
