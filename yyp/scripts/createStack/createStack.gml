///@function createStack([item...])
///@description Create stack and insert items.
///@param {Object} [item...]
///@return {Stack<Object>} stack
function createStack() {

		var stack = ds_stack_create();
	
		for (var index = 0; index < argument_count; index++) {
			var item = argument[index]
			pushStack(stack, item);
		}
	
		return stack;


}
