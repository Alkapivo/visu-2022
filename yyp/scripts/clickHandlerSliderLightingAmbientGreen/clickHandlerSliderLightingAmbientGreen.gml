///@function clickHandlerSliderLightingAmbientGreen(context)
///@description Click handler.
///@param {WindowSlider} context
function clickHandlerSliderLightingAmbientGreen(argument0) {

		var context = argument0;
	
		setColorGreen(getWorldRendererLightingAmbient(), getWindowElementValue(context) / getWindowSliderValueMax(context));
	


}
