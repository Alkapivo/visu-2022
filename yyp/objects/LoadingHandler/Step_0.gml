///@description update()

	switch (state) {
		
		case LoadingHandlerState.INITIALIZE:
		
			loadingHandlerInitialize(this);
			state = LoadingHandlerState.EXECUTE;
			break;
			
		case LoadingHandlerState.EXECUTE:
		
			loadingHandlerExecute(this);
			break;
			
		case LoadingHandlerState.FINISH:
		
			loadingHandlerFinish(this);
			break;
	}
	
