///@function createBossManager(layerId)
///@description Constructor.
///@param {Layer} [layerId]
///@return {BossManager} bossManager
function createBossManager() {

		var class = BossManager;
		var instanceLayer = argument_count > 0 ? argument[0] : getSystemLayer();
	
		var instance = defaultContextInstanceConstructor(class, "BossManager", instanceLayer);
	
		return instance;
	



}
