///@function parseNumberFromString(stringNumber)
///@description Parse string to number. If string isn't parsable then return null.
///@param {String} stringNumber
///@return {Optional<Number>} number;
function parseNumberFromString(argument0) {

		var stringNumber = argument0;
	
		if (isStringNumber(stringNumber)) {
			if (stringContains(stringNumber, ".")) {
				var splitedString = splitStringToArray(stringNumber, ".");		
				var integerPart = splitedString[0];
				var fractionalPart = splitedString[1];
				var fractionalPartSize = string_length(fractionalPart);
				var fractionalDivider = power(10, fractionalPartSize);
				fractionalPart = fractionalPartSize == 0 ? "0" : fractionalPart;
		
				var finalIntegerPart = real(integerPart);
				var finalFractionalPart = real(fractionalPart) / fractionalDivider;	
		
				return finalIntegerPart + finalFractionalPart;
			} else {
				return real(stringNumber);
			}	
		} else {
			return null;
		}
	



}
