///@export loadingHandlerExecuteHandler(T~LoadingHandler)
///@export loadingHandlerFinishHandler(T~LoadingHandler)
///@export loadingHandlerInitializeHandler(T~LoadingHandler)
///@export incrementLoadingStageCurrentValue(LoadingStage)
///@export loadingHandlerExecute(T~LoadingHandler)
///@export loadingHandlerFinish(T~LoadingHandler)
///@export loadingHandlerInitialize(T~LoadingHandler)
///@export resolveDispatchStoreException(AssetScript)
///@export runLoadingHandler(T~LoadingHandler)
///@export sanitizeLoadingStageWeight(Tuple<String, Integer>[], String): Tuple<String, Integer>[])

///@param {T~LoadingHandler} loadingHandler
function loadingHandlerExecuteHandler(loadingHandler) {
	
}

///@param {T~LoadingHandler} loadingHandler
function loadingHandlerFinishHandler(loadingHandler) {

}

///@param {T~LoadingHandler} loadingHandler
function loadingHandlerInitializeHandler(loadingHandler) {
	
}

///@description Set LoadingStage.currentValue++ if not bigger than LoadingStage.maxValue
///@param {LoadingStage} loadingStage
function incrementLoadingStageCurrentValue(loadingStage) {

	var currentValue = getLoadingStageCurrentValue(loadingStage);
	var maxValue = getLoadingStageMaxValue(loadingStage);
	
	if (currentValue >= maxValue) {
		logger("Loading stage try to increment currentValue above maxValue ({0})", LogType.WARNING, maxValue);
	} else {
		currentValue++;
		setLoadingStageCurrentValue(loadingStage, currentValue);
	}
}

///@param {T~LoadingHandler}
function loadingHandlerExecute(loadingHandler) {

	var assetScript = loadingHandler.executeHandler;
	runScript(assetScript, this);
}

///@param {T~LoadingHandler}
function loadingHandlerFinish(loadingHandler) {

	var assetScript = loadingHandler.finishHandler;
	runScript(assetScript, this);
}

///@param {T~LoadingHandler}
function loadingHandlerInitialize(loadingHandler) {

	var assetScript = loadingHandler.initializeHandler;
	runScript(assetScript, this);
}

///@description Construct & resolve DispatchStoreException.
///@param {AssetScript~Dispatcher} dispatcher
function resolveDispatchStoreException(dispatcher) {
	
	var exception = catchException();
	if (isOptionalPresent(exception)) {
		throwException(
			createException(
				DispatchStoreException,
				stringParams(
					"[{0}] {1}", 
					getAssetName(dispatcher, AssetScript),
					getExceptionMessage(exception)
				)
			)
		);
	}
}

///@description Enable execution of LoadingHandler state machine
///@param {T~LoadingHandler} loadingHandler
function runLoadingHandler(loadingHandler) {

	if (isParent(loadingHandler, LoadingHandler)) {
		
		if (loadingHandler.state == LoadingHandlerState.IDLE) {
			
			loadingHandler.state = LoadingHandlerState.INITIALIZE;
		} else {
			
			logger("LoadingHandler {0} is already running", LogType.WARNING);
		}
	}
}

///@description Check if weight in array of tuples<String, Integer> weight are equal 1.0.
///@param {Tuple<String, Integer>[]} loadingStages
///@param {String} loadingHandlerName
///@return {Tuple<String, Integer>[]} loadingStages
function sanitizeLoadingStageWeight(sourceLoadingStages, loadingHandlerName) {

	var length = getArrayLength(sourceLoadingStages);
	var loadingStages = createArray(length, null);
	array_copy(loadingStages, 0, sourceLoadingStages, 0, length);
	
	var weightSum = 0.0;
	for (var index = 0; index < length; index++) {
		
		var loadingStageTuplet = loadingStages[index]
		var weight = getTupleValue(loadingStageTuplet);
		weightSum += weight
	}
	
	if ((weightSum < 0.9999) || (weightSum > 1.0001)) {
		logger("Weights for {0} are not equal. Sum was equal to {1}", LogType.WARNING, loadingHandlerName, weightSum);
		var equalWeight = 1.0 / length;
		for (var index = 0; index < length; index++) {
			var loadingStageTuplet = loadingStages[@ index]
			setTupleValue(loadingStageTuplet, equalWeight);
		}	
	}
	
	return loadingStages;
}
