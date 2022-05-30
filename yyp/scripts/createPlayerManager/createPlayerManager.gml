///@function createPlayerManager(layerId)
///@description Constructor.
///@param {Layer} [layerId]
///@return {PlayerManager} playerManager
function createPlayerManager() {

		var class = PlayerManager;
		var instanceLayer = argument_count > 0 ? argument[0] : getSystemLayer();
	
		var instance = defaultContextInstanceConstructor(class, "PlayerManager", instanceLayer);
	
		return instance;
	



}
