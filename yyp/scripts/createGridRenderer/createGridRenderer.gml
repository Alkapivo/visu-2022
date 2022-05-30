///@function createGridRenderer(layerId)
///@description Constructor.
///@param {Layer} [layerId]
///@return {GridRenderer} gridRenderer
function createGridRenderer() {

		var class = GridRenderer;
		var instanceLayer = argument_count > 0 ? argument[0] : getSystemLayer();
	
		var instance = defaultContextInstanceConstructor(class, "GridRenderer", instanceLayer);
	
		return instance;
	



}
