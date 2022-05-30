///@description create()

	#region Fields
	
///@public:

	///@type {AssetScript}
	executeHandler = loadingHandlerExecuteHandler;
	
	///@type {AssetScript}
	finishHandler = loadingHandlerFinishHandler;
	
	///@type {AssetScript}
	initializeHandler = loadingHandlerInitializeHandler;
	
///@private:
	
	///@type {LoadingHandlerState}
	state = LoadingHandlerState.IDLE;
	
	///@type {Optional<Map<any::any>>} @todo determine types
	parameters = createEmptyOptional();
	
	///@type {Map<any::any>} @todo determine types
	loadingStages = createMap(); 
	
	///@type {Optional<Integer>}
	loadingStagePointer = createEmptyOptional();
	
	#endregion
	
