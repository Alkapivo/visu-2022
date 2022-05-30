///@function runStoreHandler(storableInstance)
///@description Run T~StorableInstance::storeHandler.
///@param {T~StorableInstance} storableInstance
///@return {WorldInstanceState<T~StorableInstance>} worldInstanceState
///@throws {Exception} inherit exception from T~StorableInstance::storeHandler
function runStoreHandler(argument0) {

		var storableInstance = argument0;
	
		var worldInstanceState = runScript(
			getStorableInstanceStoreHandler(storableInstance),
			storableInstance
		);
	
		return worldInstanceState;
	



}
