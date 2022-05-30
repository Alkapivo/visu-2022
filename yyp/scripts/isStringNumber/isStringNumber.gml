///@function isStringNumber(stringNumber)
///@description Check if string is parsable number.
///@param {String} stringNumber
function isStringNumber(argument0) {

		var stringNumber = argument0;
	
		if (stringContains(stringNumber, ".")) {
		
			var splitedString = splitStringToArray(stringNumber, ".");
			if (getArrayLength(splitedString) != 2) {
				return false;	
			}
		
			var integerPart = splitedString[0];
			var fractionalPart = splitedString[1];
			var sanitizedIntegerPart = string_digits(integerPart);
			var sanitizedFractionalPart = string_digits(fractionalPart);
			if ((string_length(integerPart) != string_length(string(sanitizedIntegerPart))) ||
				(string_length(fractionalPart) != string_length(string(sanitizedFractionalPart))) ||
				(string_length(string(sanitizedIntegerPart)) == 0)) {
				return false;
			}
		
			return true;		
		} else {
			var stringNumberLength = string_length(stringNumber);
			return 
				(stringNumberLength == string_length(string_digits(stringNumber))) &&
				(stringNumberLength > 0);
		}
	


}
