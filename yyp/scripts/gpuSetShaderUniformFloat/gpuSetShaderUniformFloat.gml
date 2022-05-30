///@function gpuSetShaderUniformFloat(uniform, float...)
///@description Wrapper for shader_set_uniform_f.
///@param {Uniform} uniform
///@param {Number} float...
function gpuSetShaderUniformFloat() {

		if (argument_count < 2) {
			logger("gpuSetShaderUniformFloat must have at least 2 arguments provided", LogType.ERROR);	
		}
	
		var uniform = argument[0];
	
		// TODO Refactor after GML update (spread operator are broken in this version...)
		// Only 4 because max is vec4
		switch (argument_count) {
			case 2:
				shader_set_uniform_f(uniform, argument[1]);
				break;
			case 3:
				shader_set_uniform_f(uniform, argument[1], argument[2]);
				break;
			case 4:
				shader_set_uniform_f(uniform, argument[1], argument[2], argument[3]);
				break;
			case 5:
				shader_set_uniform_f(uniform, argument[1], argument[2], argument[3], argument[4]);
				break;
			case 6:
				shader_set_uniform_f(uniform, argument[1], argument[2], argument[3], argument[4], argument[5]);
				break;
		}


}
