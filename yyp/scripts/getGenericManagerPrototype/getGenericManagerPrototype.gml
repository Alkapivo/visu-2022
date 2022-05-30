///@function getGenericManagerPrototype(genericManager)
///@description Safe getter.
///@param {T?GenericManager} genericManager
///@return {Optional<ManagerPrototype>} managerPrototype
function getGenericManagerPrototype(argument0) {

		var genericManager = argument0;
	
		var managerPrototype = getInstanceVariable(genericManager, FieldGenericManager_managerPrototype);
	
		return managerPrototype;
	



}
