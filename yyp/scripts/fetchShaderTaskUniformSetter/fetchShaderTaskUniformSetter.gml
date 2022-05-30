///@function fetchShaderTaskUniformSetter(shader)
///@description Return uniform setter script for shader.
///@param {AssetShader} shader
///@return {Optional<AssetScript>} script return null if handler wasn't found
function fetchShaderTaskUniformSetter(argument0) {

		var shader = argument0;
		var shaderUniformSetters = getGameRendererShaderUniformSetters();
	
		var handler = shaderUniformSetters[? shader];
		if (isUndefined(handler)) {
			logger("Cannot find shader uniform setter for shader \"{0}\"", LogType.WARNING,
				getAssetName(shader, AssetShader));
			handler = null;
		}
	
		return handler;
	
	


}
