///@shader shaderUpscalingHQ4X
///@description Vertex shader.
///@uniform {vec2} resolution

	attribute vec3 in_Position;
	attribute vec4 in_Colour;
	attribute vec2 in_TextureCoord;

	varying vec4 inputColor;
	varying vec4 inputTexture[7];

	uniform vec2 resolution;
	

	void main() {
		
	    vec4 objectSpacePosition = vec4(
			in_Position.x,
			in_Position.y,
			in_Position.z,
			1.0);
	    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * objectSpacePosition;
		
		float x = 1.0 * (1.0 / resolution.x);
		float y = 1.0 * (1.0 / resolution.y);
		vec2 dg1 = vec2(x, y);
		vec2 dg2 = vec2(-x, y);
		vec2 sd1 = dg1 * 0.5;
		vec2 sd2 = dg2 * 0.5;
    
		/// Pass varying to fragment shader
	    inputColor = in_Colour;
		inputTexture[0].xy = in_TextureCoord;		//Current tx.
		inputTexture[1].xy = inputTexture[0].xy - sd1; //Current tx -0.25,-0.25.
		inputTexture[2].xy = inputTexture[0].xy - sd2; //Current tx  0.25,-0.25.
		inputTexture[3].xy = inputTexture[0].xy + sd1; //Current tx  0.25, 0.25.
		inputTexture[4].xy = inputTexture[0].xy + sd2; //Current tx -0.25, 0.25.
		inputTexture[5].xy = inputTexture[0].xy - dg1; //Current tx -0.50,-0.50.
		inputTexture[6].xy = inputTexture[0].xy + dg1; //Current tx  0.50, 0.50.
		inputTexture[5].zw = inputTexture[0].xy - dg2; //Current tx  0.50,-0.50.
		inputTexture[6].zw = inputTexture[0].xy + dg2; //Current tx -0.50, 0.50.
	}
	
