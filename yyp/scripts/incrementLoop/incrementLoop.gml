///@function incrementLoop(number, value, maxNumber)
///@return Increment number by value.
///@param {Number} number
///@param {Number} value
///@param {Number} maxNumber
///@return {Number} incrementedNumber
function incrementLoop(argument0, argument1, argument2) {

		var number = argument0;
		var value = argument1;
		var maxNumber = argument2;
	
		var incrementedNumber = number + applyDeltaTime(value);
	
		return incrementedNumber > maxNumber ? incrementedNumber - maxNumber : incrementedNumber;
	



}
