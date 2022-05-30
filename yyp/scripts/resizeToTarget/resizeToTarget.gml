///@function resizeToTarget(resizeStrategy)
///@description Resize event.
///@param {Resolution} resolution
function resizeToTarget(resolution) {
		
		var isResolutionEntity = isEntity(resolution, Resolution);
		var realWidth = getResolutionRealWidth(isResolutionEntity ? resolution : CurrentResolution);
		var realHeight = getResolutionRealHeight(isResolutionEntity ? resolution : CurrentResolution);
		var guiWidth = getResolutionGuiWidth(isResolutionEntity ? resolution : CurrentResolution);
		var guiHeight = getResolutionGuiHeight(isResolutionEntity ? resolution : CurrentResolution);
		var viewWidth = getResolutionViewWidth(isResolutionEntity ? resolution : CurrentResolution);
		var viewHeight = getResolutionViewHeight(isResolutionEntity ? resolution : CurrentResolution);
		
		RealWidth = clamp(realWidth, 1, MAX_NUMBER);
		RealHeight = clamp(realHeight, 1, MAX_NUMBER);
		GuiWidth = clamp(guiWidth, 1, MAX_NUMBER);
		GuiHeight = clamp(guiHeight, 1, MAX_NUMBER);
		ViewWidth = clamp(viewWidth, 1, MAX_NUMBER);
		ViewHeight = clamp(viewHeight, 1, MAX_NUMBER);

		display_set_gui_size(RealWidth, RealHeight);
		window_set_size(isHtml5() ? GuiWidth : RealWidth, isHtml5() ? GuiHeight : RealHeight);
		surface_resize(application_surface, GuiWidth, GuiHeight);
		cameraChange();
	
		logger(
			"Set resolution { real {0}x{1}, gui: {2}x{3}, view: {4}x{5} }", 
			LogType.INFO, 
			RealWidth, RealHeight,
			GuiWidth, GuiHeight, 
			ViewWidth, ViewHeight
		);
	



}
