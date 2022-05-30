///@function deserializeStack(serializedStack)
///@description Return deserializedStack from string created by serializeStack.
///@param {String} serializedStack
///@return {Stack<Object>} deserializedStack
function deserializeStack(argument0) {

		var deserializedStack = ds_stack_create();
		ds_stack_read(deserializedStack, argument0);
	
		return deserializedStack;


}
