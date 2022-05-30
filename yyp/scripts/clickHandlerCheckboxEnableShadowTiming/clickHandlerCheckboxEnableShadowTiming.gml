///@function clickhandlerCheckboxEnableShadowTiming(context)
///@description Click handler.
///@param {WindowCheckbox} context
function clickHandlerCheckboxEnableShadowTiming(argument0) {

		var context = argument0;
	
		var worldRenderer = getWorldRenderer();
		worldRenderer.enableShadowTiming = getWindowElementValue(context);
	



}
