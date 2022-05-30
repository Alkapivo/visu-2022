///@function splitTextToArray(text, delimiter)
///@description Split text into array by delimiter
///@param {String} text
///@param {String} delimiter
///@return {String[]} array
function splitStringToArray(argument0, argument1) {

		var text = argument0;
		var delimiter = argument1;
	
		var size = string_count(delimiter, text) + 1;
		var array = createArray(size, "");
		var delimiterLength = string_length(delimiter);
	
		for (var index = 0; index < size; index++) {
			var pointer = string_pos(delimiter, text) - 1;
			if (pointer == -1) {
				array[index] = text;
			} else {
				array[index] = string_copy(text, 1, pointer);
				text = string_delete(text, 1, pointer + delimiterLength);	
			}
		}
	
		return array;
	


}
