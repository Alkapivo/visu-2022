///@function getFactRepository(factManager)
///@description Getter.
///@param {FactManager} [factManager=getFactManager()]
///@return {Repository<Fact>} factRepository
function getFactRepository() {

		var factManager = argument_count > 0 ? argument[0] : getFactManager();
	
		return getInstanceVariable(factManager, FieldFactManager_factRepository);
	



}
