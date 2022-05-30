///@function createInputHandler(inputHandlerClass)
///@description InputHandler factory.
///@param {Class<?InputHandler>} inputHandlerClass
///@return {?InputHandler} inputHandler
function createInputHandler(argument0) {

		var inputHandlerClass = argument0;
	
		return instance_create_layer(0, 0, getSystemLayer(), inputHandlerClass);
	



}
