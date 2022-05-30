///@description cleanUp()

	super();
	
	deregisterSceneController();
	
	this.midiMatrixController.cleanUp(this.midiMatrixController);
	
	global.isGameplayStarted = false;
