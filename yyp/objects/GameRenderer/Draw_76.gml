///@description 

	var midiMatrixController = getInstanceVariable(getGameController(), "midiMatrixController");
	var wtf = getStructVariable(midiMatrixController, "preRender");
	if (isOptionalPresent(wtf)) {

		midiMatrixController.preRender(midiMatrixController);
	}
	
