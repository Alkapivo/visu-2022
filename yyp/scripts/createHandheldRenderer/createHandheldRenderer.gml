///@function createHandheldRenderer(layerId)
///@description Constructor.
///@param {Layer} [layerId]
///@return {HandheldRenderer} handheldRenderer
function createHandheldRenderer() {

		var class = HandheldRenderer;
		var instanceLayer = argument_count > 0 ? argument[0] : getSystemLayer();
	
		var instance = defaultContextInstanceConstructor(class, "HandheldRenderer", instanceLayer);
	
		return instance;
	



}
