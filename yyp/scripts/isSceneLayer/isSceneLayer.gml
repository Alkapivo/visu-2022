///@function isSceneLayer(sceneLayer)
///@description Validator.
///@param {SceneLayer} sceneLayer
///@return {Boolean} isValid
function isSceneLayer(argument0) {

		var sceneLayer = argument0;
	
		return isNumber(sceneLayer) && layer_exists(sceneLayer);
	



}
