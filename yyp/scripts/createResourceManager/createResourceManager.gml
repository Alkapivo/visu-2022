///@function createResourceManager(layerId)
///@description Constructor.
///@param {Layer} [layerId]
///@return {ResourceManager} resourceManager
function createResourceManager() {

		var class = ResourceManager;
		var instanceLayer = argument_count > 0 ? argument[0] : getSystemLayer();
	
		var instance = defaultContextInstanceConstructor(class, "ResourceManager", instanceLayer);
	
		return instance;
	



}
