///@function convertFixedDelimiterStringToArray(data, offset, delimiter)
///@description Example: converts string "0001,0002,3001" into array [1, 2, 3001]
///@param {String} data
///@param {Integer} offset
///@param {String} delimiter
function convertFixedDelimiterStringToArray(argument0, argument1, argument2) {

		var data = argument0;
		var offset = argument1;
		var delimiter = argument2;
	
		var delimiterSize = string_length(delimiter);
		var arraySize = (string_length(data) div (delimiterSize + offset)) + (delimiterSize == 0 ? 0 : 1);
		var dataArray = createArray(arraySize);
	
		for (var index = 0; index < arraySize; index++) {
			var positionBegin = 1 + index * (offset + delimiterSize);
		
			var value = string_copy(data, positionBegin, offset);
			dataArray[index] = value;
		}
	
		return dataArray;


}
