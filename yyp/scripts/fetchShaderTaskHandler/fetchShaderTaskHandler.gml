///@function fetchShaderTaskHandler(shader)
///@description Return handler script for shader.
///@param {AssetShader} shader
///@return {Optional<AssetScript>} script return null if handler wasn't found
function fetchShaderTaskHandler(argument0) {

		var shader = argument0;
		var shaderHandlers = getGameRendererShaderHandlers();
	
		var handler = shaderHandlers[? shader];
		if (isUndefined(handler)) {
			logger("Cannot find shader handler for shader \"{0}\"", LogType.WARNING,
				getAssetName(shader, AssetShader));
			handler = null;
		}
	
		return handler;
	
	


}
