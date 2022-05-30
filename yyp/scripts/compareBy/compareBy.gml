///@function compareBy(left, right, compareMethod)
///@description Return compare result.
///@param {Object} left
///@param {Object} right
///@param {CompareMethod} compareMethod
function compareBy(argument0, argument1, argument2) {

		var left = argument0;
		var right = argument1;
		var compareMethod = argument2;
	
		switch (compareMethod) {
			case CompareMethod.EQUAL:
				return left == right;
				break;
			case CompareMethod.NOT_EQUAL:
				return left != right;
				break;
		}


}
