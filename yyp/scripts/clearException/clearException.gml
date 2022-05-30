///@function clearException()
///@description Clear global.throwedException.
function clearException() {

		if (isOptionalPresent(global.throwedException)) {
			destroyException(global.throwedException);
			global.throwedException = null;	
		}
	



}
