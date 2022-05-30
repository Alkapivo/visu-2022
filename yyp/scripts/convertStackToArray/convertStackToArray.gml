///@function convertStackToArray(stack)
///@description Convert stack to array.
///@param {Stack<Object>} stack
///@return {Object[]} array
function convertStackToArray(argument0) {

		var stack = argument0;

		if (isDataStructure(stack, Stack)) {
			var stackClone = cloneStack(stack);
			var stackSize = getStackSize(stackClone);
			var stackArray = createArray(stackSize);
			for (var index = 0; index < stackSize; index++) {
				stackArray[index] = popStack(stackClone);	
			}
			destroyStack(stackClone);
	
			return stackArray;
		} else {
			var exceptionMessage = "[convertStackToArray] Unable to convert stack to array. Argument wasn't recognized as stack";
			throwException(createException(RuntimeException, exceptionMessage, null));
			return [];
		}
	



}
