///@function clickHandlerSliderLightingAmbientGreen(context)
///@description Click handler.
///@param {WindowSlider} context
function clickHandlerSliderLightingAmbientBlue(argument0) {

		var context = argument0;
	
		setColorBlue(getWorldRendererLightingAmbient(), getWindowElementValue(context) / getWindowSliderValueMax(context));
	



}
