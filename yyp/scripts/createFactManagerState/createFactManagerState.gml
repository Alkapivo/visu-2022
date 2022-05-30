///@function createFactManagerState(factIntents)
///@description Constructor for FactManagerState entity.
///@param {FactIntent[]} factIntents
///@return {FactManagerState} factManagerState 
///@throws {Exception}
///@generated {2021-05-01T23:43:36.109Z}

function createFactManagerState(factIntents) {

	var factManagerState = createEntity(FactManagerState);

	setFactManagerStateFactIntents(factManagerState, assertNoOptional(factIntents));

	return factManagerState;
	
}
