///@function checkArgumentCount(minArgumentCount, argumentCount, handler)
///@description Use in function with optional params
///@param {Integer} minArgumentCount
///@param {Integer} argumentCount
///@param {AssetScript} handler
///@return {Boolean} isValid
///@throws {Exception.RuntimeException}
function checkArgumentCount() {

		if (argument_count < 3) {
			throwException(createException(RuntimeException,
				"checkArgumentCount must have at least 3 arguments provided",
				runtimeExceptionHandler));
		}

		var minArgumentCount = argument[0];
		var argumentCount = argument[1];
		var handler = argument[2];
		var isValid = true;
	
		if (argumentCount < minArgumentCount) {
			isValid = false;
			var message = stringParams("{0} must have at least {1} argument{2} provided", getAssetName(handler, AssetScript), minArgumentCount, (argumentCount > 1 ? "s" : ""));
			throwException(createException(RuntimeException, message, runtimeExceptionHandler));
			exit;
		}
	
		return isValid;
	



}
