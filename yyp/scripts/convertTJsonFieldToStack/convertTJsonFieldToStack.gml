///@function convertTJsonFieldToStack(tjsonField)
///@description Converter. Extracted stack is flat (not recursive)
///@param {tjsonField} tjsonField
///@return {Stack<Object>} stack
function convertTJsonFieldToStack(argument0) {
	
		var tjsonField = argument0;
	
		if (tj_is_array(tjsonField)) {
			var stack = createStack();
			var stackArraySize = getArrayLength(tjsonField );
			for (var index = 0; index < stackArraySize; index++) {
				var item = tjsonField[index];
				pushStack(stack, item);
			}
			return stack;
		}
	
		return createEmptyOptional();
	



}
