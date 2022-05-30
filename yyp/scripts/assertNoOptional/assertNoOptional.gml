///@function assertNoOptional(object, message)
///@description Check if asserted value isn't optional.
///@param {Object} object
///@param {String} [message]
///@return {Object} object
///@throws {Exception.UndefinedException}
function assertNoOptional() {

		///checkArgumentCount(1, argument_count, assertNoOptional);

		var object = argument[0];
		var message = argument_count > 1 ? argument[1] : "Trying to assert non present optional to non optional field";
	
		if (isOptionalPresent(object)) {
			return object;
		} else {
			throwException(createException(RuntimeException, message, runtimeExceptionHandler));
		}
	



}
