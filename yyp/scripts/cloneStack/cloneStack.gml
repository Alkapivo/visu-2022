///@function cloneStack(stack)
///@desription Return copy of passed stack.
///@param {Stack<Object>} stack
///@return {Stack<Object>} clonedStack
function cloneStack(argument0) {

		var stack = createStack();
		ds_stack_copy(stack, argument0);
	
		return stack;


}
