///@function clickHandlerSliderLightingAmbientGreen(context)
///@description Click handler.
///@param {WindowSlider} context
function clickHandlerSliderLightingAmbientRed(argument0) {

		var context = argument0;
	
		setColorRed(getWorldRendererLightingAmbient(), getWindowElementValue(context) / getWindowSliderValueMax(context));
	


}
