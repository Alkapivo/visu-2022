///@function createPlaygroundRenderer(layerId)
///@description Constructor.
///@param {Layer} [layerId]
///@return {PlaygroundRenderer} playgroundRenderer
function createPlaygroundRenderer() {

	var class = PlaygroundRenderer;
	var instanceLayer = argument_count > 0 ? argument[0] : getSystemLayer();
	
	var instance = defaultContextInstanceConstructor(class, "PlaygroundRenderer", instanceLayer);
	
	return instance;
}

///@return {Optional<PlaygroundRenderer>} 
function getPlaygroundRenderer() {
	
	return global.playgroundRendererContext;
}

