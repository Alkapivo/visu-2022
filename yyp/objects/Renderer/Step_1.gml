///@description Resize event
		
	if (getSceneRenderer() == this) {
		if (matchAny(rendererResizeState, RendererResizeState.IDLE, RendererResizeState.RESIZED)) {
			rendererResizeState = isResizeRequired(previousWidth, previousHeight) ?
				RendererResizeState.REQUIRED :
				RendererResizeState.IDLE;
		}

		if (rendererResizeState == RendererResizeState.REQUIRED) {
			resizeCooldownTimer = incrementTimer(resizeCooldownTimer, 0.3);
			if (resizeCooldownTimer == 0.0) {
				
				var resizeStrategy = runScript(resizeStrategyHandler);				
				resizeToTarget(resizeStrategy);
				rendererResizeState = RendererResizeState.RESIZED;	
			}
		}
		
		if (matchAny(rendererResizeState, RendererResizeState.IDLE, RendererResizeState.RESIZED)) {
			previousWidth = isHtml5() ? browser_width : window_get_width();
			previousHeight = isHtml5() ? browser_height : window_get_height();
		}
	}
	
	var isTexFilter = gpu_get_texfilter()
	if (isTexFilter != IsTextureLinearInterpolationEnabled) {
		
		gpu_set_texfilter(IsTextureLinearInterpolationEnabled);
	}
	
