///@function createException(name, message, handler)
///@description Create Exception entity.
///@param {String} name
///@param {String} message
///@param {Optional<AssetScript>} [handler]
///@return {Exception} exception 
///@generated {2020-02-23T13:17:25.524Z}
///@override
function createException() {
	
		///checkArgumentCount(2, argument_count, createException)

		var exception = createArray(3);

		setExceptionName(exception, argument[0]);
		setExceptionMessage(exception, argument[1]);
		setExceptionHandler(exception, argument_count > 2 ? argument[2] : createEmptyOptional());

		return exception;
	



}
