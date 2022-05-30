///@function destroyLoadingStage(loadingStage)
///@description Destroy LoadingStage entity.
///@param {LoadingStage} loadingStage
///@throws {Exception}
///@generated {2020-09-28T21:11:55.029Z}
function destroyLoadingStage(argument0) {

		var loadingStage = argument0;
	
		var currentValue = getLoadingStageCurrentValue(loadingStage);
		var maxValue = getLoadingStageMaxValue(loadingStage);
		var state = getLoadingStageState(loadingStage);
	
		destroyDataStructure(state, Map, "Unable to destroy Map state in LoadingStage");
		setLoadingStageState(loadingStage, null);
	

	



}
