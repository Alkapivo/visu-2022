///@function createShroomManager(layerId)
///@description Constructor.
///@param {Layer} [layerId]
///@return {ShroomManager} shroomManager
function createShroomManager() {

		var class = ShroomManager;
		var instanceLayer = argument_count > 0 ? argument[0] : getSystemLayer();
	
		var instance = defaultContextInstanceConstructor(class, "ShroomManager", instanceLayer);
	
		return instance;
	



}
