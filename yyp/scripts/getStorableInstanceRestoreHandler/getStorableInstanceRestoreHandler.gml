///@function getStorableInstanceRestoreHandler(instance)
///@description Getter.
///@param {T~StorableInstance} instance
///@return {Optional<AssetScript>} restoreHandler
function getStorableInstanceRestoreHandler(argument0) {

		var instance = argument0;
	
		return getInstanceVariable(instance, "restoreHandler");
	



}
