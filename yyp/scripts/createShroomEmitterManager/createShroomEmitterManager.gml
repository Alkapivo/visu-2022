///@function createShroomEmitterManager(layerId)
///@description Constructor.
///@param {Layer} [layerId]
///@return {ShroomManager} shroomEmitterManager
function createShroomEmitterManager() {

		var class = ShroomEmitterManager;
		var instanceLayer = argument_count > 0 ? argument[0] : getSystemLayer();
	
		var instance = defaultContextInstanceConstructor(class, "ShroomEmitterManager", instanceLayer);
	
		return instance;
	



}
