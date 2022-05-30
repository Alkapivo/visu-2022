///@function storeFactManagerHandler(factManager)
///@description storeHandler implementation for FactManager.
///@param {FactManager} factManager
///@return {WorldInstanceState<FactManagerState>} worldInstanceState
///@throws {InvalidEntityException}
function storeFactManagerHandler(argument0) {

		var factManager = argument0;
	
		var factRepository = getFactRepository(factManager);
		var facts = getRepositoryData(factRepository);
	
		var factIntentsList = createList();
		for (var factId = mapFirst(facts); iteratorFinish(factId); factId = mapNext(facts, factId)) {
		
			var fact = facts[? factId];
			if (isEntity(fact, Fact)) {
			
				var factName = getFactName(fact);
				if (factId != factName) {
					logger("Found missmaching fact. { \"factId\": \"{0}\", \"factName\": \"{1}\" }",
						LogType.ERROR, factId, factName);
				}
			
				var factValue = getFactValue(fact);
				var factIntent = createFactIntent(factId, factValue);
				addToList(factIntentsList, factIntent);
			} else {
			
				throwException(
					createException(
						FactManagerException,
						stringParams(
							"Fact must be a type of Fact. { \"factId\": \"{0}\", \"rawFact\": \"{1}\" }",
							factId, fact
						)
					)
				);
			}
		}
	
		var factIntents = convertListToArray(factIntentsList);
		destroyDataStructure(factIntentsList, List);
	
		var factManagerState = createFactManagerState(factIntents);

		var worldInstanceState = createWorldInstanceState("FactManagerState", factManagerState);
		return worldInstanceState;
	
	


}
