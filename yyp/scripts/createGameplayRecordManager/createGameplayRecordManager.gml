///@function createGameplayRecordManager(layerId)
///@description Constructor.
///@param {Layer} [layerId]
///@return {GameplayRecordManager} gameplayRecordManager
function createGameplayRecordManager() {

		var class = GameplayRecordManager;
		var instanceLayer = argument_count > 0 ? argument[0] : getSystemLayer();
	
		var instance = defaultContextInstanceConstructor(class, "GameplayRecordManager", instanceLayer);
	
		return instance;
	



}
