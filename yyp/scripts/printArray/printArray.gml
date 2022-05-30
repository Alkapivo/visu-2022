///@function printArray(array, message, maxDepth)
///@description Debug, print array to console output.
///@param {Object[]} array
///@param {String} [message]
///@param {Integer} [maxDepth]
function printArray() {

		if (argument_count < 1) {
			logger("printArray must have at least 1 argument provided", LogType.ERROR);	
		}

		var array = argument[0];
		var message = argument_count > 1 ? argument[1] : "printArray";
		var maxDepth = argument_count > 2 ? argument[2] : 0;
	
		if (isArray(array)) {
			var arrayString = convertArrayToString(array, maxDepth);
			logger("{0}: \n{1}", LogType.DEBUG, message, arrayString);
		}


}
