///@function convertStackToTJsonArray(stack)
///@description Convert Stack to TJsonArray.
///@param {Stack<?Primitive>} stack
///@return {TJsonArray} tjsonArray
function convertStackToTJsonArray(argument0) {

		var stack = cloneStack(argument0);
		var stackArray = createArray(getStackSize(stack), null);
		for (var index = 0; index < getStackSize(stack); index++) {
			stackArray[index] = popStack(stack);	
		}
	
		return tj_array(stackArray);


}
