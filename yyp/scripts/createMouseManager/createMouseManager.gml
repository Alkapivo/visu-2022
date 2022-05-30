///@function createMouseManager(layerId)
///@description Constructor.
///@param {Layer} [layerId]
///@return {MouseManager} mouseManager
function createMouseManager() {

		var class = MouseManager;
		var instanceLayer = argument_count > 0 ? argument[0] : getSystemLayer();
	
		var instance = defaultContextInstanceConstructor(class, "MouseManager", instanceLayer);
	
		return instance;
	



}
