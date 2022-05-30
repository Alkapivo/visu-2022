///@function convertGMJsonFieldToStack(gmjsonField)
///@description Converter. Extracted Stack is flat (not recursive)
///@param {GMJsonField} gmjsonField
///@return {Optional<Stack<Object>>} stack
function convertGMJsonFieldToStack(argument0) {

		var gmJsonField = argument0;

		if (isDataStructure(gmJsonField, List)) {
			var stack = createStack();
			var stackListSize = getListSize(gmJsonField);
			for (var index = 0; index < stackListSize; index++) {
				var item = gmJsonField[| index];
				pushStack(stack, item);
			}
			return stack;
		}
	
		return createEmptyOptional();
	



}
