///@function pushStack(stack, item...)
///@description Wrapper for ds_stack_push.
///@param {Stack<Object>} stack
///@param {Object} item...
function pushStack() {

		if (argument_count < 1) {
			logger("pushStack must provide at least 2 arguments", LogType.ERROR);
			return;
		}

		for (var index = 1; index < argument_count; index++) {
			ds_stack_push(argument[0], argument[index]);
		}
	


}
