///@function destroyFactManagerState(factManagerState)
///@description Destroy FactManagerState entity.
///@param {FactManagerState} factManagerState
///@throws {Exception}
///@generated {2021-05-01T23:43:36.109Z}

function destroyFactManagerState(factManagerState) {


	
	var factIntents = getFactManagerStateFactIntents(factManagerState);
	
	for (var index = 0; index < getArrayLength(factIntents); index++) {
		var entity = factIntents[@ index];
		destroyFactIntent(entity);
	}
	setFactManagerStateFactIntents(factManagerState, null);
	

	
}
