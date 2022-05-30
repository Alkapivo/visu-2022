///@function popStack(stack)
///@description Wrapper for ds_stack_pop.
///@param {Stack<T>} stack
///@return {Optional<T>} stackItem
function popStack(argument0) {

		var value = ds_stack_pop(argument0);
	
		return isUndefined(value) ? createEmptyOptional() : value;
	
		


}
