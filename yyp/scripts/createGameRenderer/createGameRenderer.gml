///@function createGameRenderer(layerId)
///@description Constructor.
///@param {Layer} [layerId]
///@return {GameRenderer} gameRenderer
function createGameRenderer() {

		var class = GameRenderer;
		var instanceLayer = argument_count > 0 ? argument[0] : getSystemLayer();
	
		var instance = defaultContextInstanceConstructor(class, "GameRenderer", instanceLayer);
	
		return instance;
	



}
