///@function getFact(factId)
///@descripiton Getter. Check if isEntity.
///@param {String} factId
///@return {Fact} fact if fact wasn't found then it will create and return fact with passed factId and DEFAULT_FACT_VALUE.
function getFact(argument0) {

		var factId = argument0;
	
		var fact = findInRepositoryById(getFactRepository(), factId);
	
		if (!isEntity(fact, Fact)) {
		
			fact = createFact(factId, DEFAULT_FACT_VALUE, createEmptyOptional());
			saveInRepository(getFactRepository(), factId, fact);
		}
	
		return fact;
	



}
