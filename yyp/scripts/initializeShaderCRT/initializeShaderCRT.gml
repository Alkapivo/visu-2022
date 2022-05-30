///@function initializeShaderCRT(context)
///@description Declare and setup uniform accesor for context.
///@param {Instance} context
function initializeShaderCRT(argument0) {

		var context = argument0;

		setInstanceVariable(context, "shaderCRTUniformEnableScanlines", shader_get_uniform(shaderCRT, "uni_use_scanlines"));

		///@description Resolution (vec4)
		setInstanceVariable(context, "shaderCRTUniformSize", shader_get_uniform(shaderCRT, "uni_crt_sizes"));

		///@description Radial Distortion amount. Range is (-2.0 - 2.0)  the lower the camera view size, means there are less pixel there are on the screen, so use less distortion. Default = 0.12
		setInstanceVariable(context, "shaderCRTUniformDistortionAmount", shader_get_uniform(shaderCRT, "uni_radial_distortion_amount"));

		///@description Range is (0.0 - 1.0) Lower = smaller corners. Default = 0.3
		setInstanceVariable(context, "shaderCRTUniformCornerSize", shader_get_uniform(shaderCRT, "uni_border_corner_size"));

		///@description The falloff of the border corner.  Range is (10.0 - 200.0) Lower = longer falloff. Default = 80.0
		setInstanceVariable(context, "shaderCRTUniformCornerSmoothness", shader_get_uniform(shaderCRT, "uni_border_corner_smoothness"));

		/// @description Range is (0.0 - 2.0) Default = 1.0
		setInstanceVariable(context, "shaderCRTUniformBrightness", shader_get_uniform(shaderCRT, "uni_brightness"));

		///@description Range is (0.0 - 1.0) Lower = noise is less visible. Default = 0.2
		setInstanceVariable(context, "shaderCRTUniformNoiseSize", shader_get_uniform(shaderCRT, "uni_noise_strength"));

		setInstanceVariable(context, "shaderCRTUniformTimer", shader_get_uniform(shaderCRT, "uni_timer"));

	
		///@SuppressWarning
		context.shaderCRTUniformEnableScanlines = context.shaderCRTUniformEnableScanlines;
		context.shaderCRTUniformSize = context.shaderCRTUniformSize;
		context.shaderCRTUniformDistortionAmount = context.shaderCRTUniformDistortionAmount;
		context.shaderCRTUniformCornerSize = context.shaderCRTUniformCornerSize;
		context.shaderCRTUniformCornerSmoothness = context.shaderCRTUniformCornerSmoothness;
		context.shaderCRTUniformBrightness = context.shaderCRTUniformBrightness;
		context.shaderCRTUniformNoiseSize = context.shaderCRTUniformNoiseSize;
		context.shaderCRTUniformTimer = context.shaderCRTUniformTimer;
	



}
