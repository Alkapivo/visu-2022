///@function clickHandlerCheckboxEnableGridRenderer(context)
///@description Click handler.
///@param {WindowCheckbox} context
function clickHandlerCheckboxEnableGridRenderer(argument0) {

		var context = argument0;
	
		var worldRenderer = getWorldRenderer();
		worldRenderer.enableGridRenderer = getWindowElementValue(context);
	



}
