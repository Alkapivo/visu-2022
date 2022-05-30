///@function areArraysEqualValues(givenArray, valuesArray)
///@description Check if givenArray contains all elements from valueArray (without repetition values)
///@param {Object[]} givenArray
///@param {Object[]} valuesArray
///@return {Boolean} areCollectionsEqual
function areArraysEqualValues(argument0, argument1) {

		var givenArray = argument0;
		var valuesArray = argument1;
		var valuesArrayCopy = createArray(getArrayLength(valuesArray), noone);
		array_copy(valuesArrayCopy, 0, valuesArray, 0, getArrayLength(valuesArray));
	
		for (var givenIndex = 0; givenIndex < getArrayLength(givenArray); givenIndex++) {
			var found = false;	
			var value = givenArray[@ givenIndex];
			for (var valuesIndex = 0; valuesIndex < getArrayLength(valuesArrayCopy); valuesIndex++) {
				if (value != noone) && (value == valuesArrayCopy[@ valuesIndex]) {
					found = true;
					valuesArrayCopy[@ valuesIndex] = noone;
					break;
				}
				found = false;
			}
			if (!found) {
				return false;	
			}
		}
	
		return true;


}
