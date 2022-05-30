///@function catchException(clear)
///@description Getter.
///@return {Optional<Exception>}
function catchException() {

		var exception = global.throwedException;
	
		if (isOptionalPresent(exception)) {
			if (getExceptionName(exception) != RuntimeException) {
				clearException();	
			}
		}
		return exception;
	



}
