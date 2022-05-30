///@function matchAny(target, object)
///@description Check if target is equal to any of passed objects.
///@param {Object} target
///@param {...Object} object
///@return {Boolean} isMatch
function matchAny() {

		///checkArgumentCount(1, argument_count, matchAny);
	
		var target = argument[0];
	
		var isMatch = false;
		for (var index = 1; index < argument_count; index++) {
			var object = argument[index];
			if (target == object) {
				isMatch = true;
				break;
			}
		}
	
		return isMatch;
	



}
