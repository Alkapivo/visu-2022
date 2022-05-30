///@function createFactManager(layerId)
///@description Constructor.
///@param {Layer} [layerId]
///@return {FactManager} factManager
function createFactManager() {

		var class = FactManager;
		var instanceLayer = argument_count > 0 ? argument[0] : getSystemLayer();
	
		var instance = defaultContextInstanceConstructor(class, "FactManager", instanceLayer);
	
		return instance;
	



}
