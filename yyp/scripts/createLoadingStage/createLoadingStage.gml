///@function createLoadingStage(currentValue, maxValue, state)
///@description Constructor for LoadingStage entity.
///@param {Integer} currentValue
///@param {Integer} maxValue
///@param {Map<String::any>} state
///@return {LoadingStage} loadingStage 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.028Z}
function createLoadingStage(argument0, argument1, argument2) {

		var currentValue = argument0;
		var maxValue = argument1;
		var state = argument2;
	
		var loadingStage = createEntity(LoadingStage);

		setLoadingStageCurrentValue(loadingStage, assertNoOptional(currentValue));
		setLoadingStageMaxValue(loadingStage, assertNoOptional(maxValue));
		setLoadingStageState(loadingStage, assertNoOptional(state));

		return loadingStage;
	



}
