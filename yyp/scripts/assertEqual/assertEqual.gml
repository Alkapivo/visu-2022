///@function assertCondition(testName, expected, found)
///@description Simple assert for simple unit test tool
///@param {String} testName
///@param {Object} expected
///@param {Object} found
///@return {Boolean} assertCondition
function assertEqual(argument0, argument1, argument2) {

		var testName = string(argument0);
		var expected = string(argument1);
		var found = string(argument2);
	
		if (expected != found) {
			logger("[{0}] Assertion error - expected: {1}, found: {2}", LogType.ERROR,
				testName, expected, found);
			return false;
		}	
		return true;


}
