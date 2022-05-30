///@function invalidWorldStateExceptionHandler()
///@description ExceptionHandler.
function invalidWorldStateExceptionHandler() {
	
		room_goto(SceneRuntimeException);
	
		global.consoleTrace = [];
	
		throwException(
			createException(
				TJsonException,
				"Save file is corrupted"
			)
		);	



}
