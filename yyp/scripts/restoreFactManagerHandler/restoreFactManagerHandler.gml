///@function restoreFactRepositoryHandler(factManager, worldInstanceState)
///@description restoreHandler implementation for FactManager.
///@param {FactManager} factManager
///@param {Optional<WorldInstanceState<FactManagerState>>} worldInstanceState
function restoreFactManagerHandler(argument0, argument1) {

		var factManager = argument0;
		var worldInstanceState = argument1;
	
		if (isWorldInstanceState(worldInstanceState, FactManagerState)) {
		
			///@safeCast {FactManagerState}
			var factManagerState = getWorldInstanceStateData(worldInstanceState);
		
			var factIntents = getFactManagerStateFactIntents(factManagerState);
			updateFacts(factIntents);
		}
	



}
