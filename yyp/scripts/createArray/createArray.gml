///@function createArray(length, [defaultValue])
///@description Wrapper for array_create.
///@param {Integer} length
///@param {Object} [defaultValue]
function createArray() {

		if (argument_count < 1) {
			logger("createArray must have at least 1 argument provided", LogType.ERROR);
			return array_create(0);
		}

		return argument_count == 1 ? array_create(argument[0]) : array_create(argument[0], argument[1]);
	



}
