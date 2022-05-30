///@description

	super();
	
	#region Fields
///@public:
	
	///@description Index is player number
	///@type {List<Player>}
	players = createList();
	
///@private:

	///@type {Position}
	currentPlayerPosition = createPosition(0.0, 0.0);
	
	mousePosition = createPosition(0, 0);
	debugMouseSpeed = 0.1;
	#endregion
	
	#region Spawn Player
	if (isHandheld()) {
		var inputHandler = getSceneControllerInputHandler();
		if ((isOptionalPresent(inputHandler)) && 
			(instanceOf(inputHandler, TouchInputHandler))) {
			
			///@spaace-todo
			spawnSpaacePlayer("main", inputHandler);
		} else {
			
			throwException(
				createException(
					RuntimeException,
					"InputHandler should be type of TouchInputHandler in handheldMode",
					runtimeExceptionHandler
				)
			);
		}
	} else {
		
		///@spaace-todo
		spawnSpaacePlayer("main", createInputHandler(KeyboardInputHandler));
	}
	#endregion
