///@function runRestoreHandler(storableInstance, worldInstanceState)
///@description Run T~StorableInstance::restoreHandler.
///@param {T~StorableInstance} storableInstance
///@param {WorldInstanceState<S>} worldInstanceState
///@throws {Exception} inherit exception from T~StorableInstance::restoreHandler
function runRestoreHandler(argument0, argument1) {

		var storableInstance = argument0;
		var worldInstanceState = argument1;
	
		runScript(
			getStorableInstanceRestoreHandler(storableInstance),
			storableInstance,
			worldInstanceState
		);
	



}
