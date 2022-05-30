///@function convertArrayToString(array, maxDepth, currentDepth)
///@description Convert array values to string (recursive)
///@param {Object[]} array
///@param {Integer} [maxDepth=1]
///@param {Integer} [currentDepth]
///@return {String} arrayString
function convertArrayToString() {

		if (argument_count < 1) {
			logger("convertArrayToString must have at least 1 argument provided", LogType.ERROR);
			return "";
		}
	
		var array = argument[0];
		var maxDepth = argument_count > 1 ? argument[1] : 1;
		var currentDepth = argument_count > 2 ? argument[2] : 0;
	
		var stringArray = "";
		var prefix = "";
		repeat(currentDepth) {
			prefix += "\t";
		}
	
		if (isArray(array)) {
			stringArray += prefix + "[\n";
			var arrayLength = getArrayLength(array);
			for (var index = 0; index < arrayLength; index++) {
				var element = array[index];
				var isLastElement = ((index + 1) == arrayLength);
				if (isArray(element)) {
					if (maxDepth - 1 > 0) {
						stringArray += convertArrayToString(element, maxDepth - 1, currentDepth + 1) + (isLastElement ? "\n" : ",\n");	
					} else {
						stringArray += prefix + "\t\"{...nested array, length: " + string(getArrayLength(element)) + "}\"" + (isLastElement ? "\n" : ",\n");
					}
				} else {
				
					stringArray += prefix + "\t" + (is_real(element) ? string(element) : "\"" + string(element) + "\"") + (isLastElement ? "\n" : ",\n");
				}
			}
			stringArray += prefix + "]";
			return stringArray;
		} else {
			return "";
		}
	



}
