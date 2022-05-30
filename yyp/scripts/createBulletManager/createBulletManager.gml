///@function createBulletManager(layerId)
///@description Constructor.
///@param {Layer} [layerId]
///@return {BulletManager} bulletManager
function createBulletManager() {

		var class = BulletManager;
		var instanceLayer = argument_count > 0 ? argument[0] : getSystemLayer();
	
		var instance = defaultContextInstanceConstructor(class, "BulletManager", instanceLayer);
	
		return instance;
	



}
