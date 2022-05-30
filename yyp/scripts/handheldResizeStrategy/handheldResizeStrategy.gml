///@function handheldResizeStrategy()
///@description Calculate real, gui, view width/height values.
///@return {ResizeStrategy} resizeStrategy
function handheldResizeStrategy() {

		var resizeStrategy = defaultResizeStrategy();
	
		if (isHandheld()) {
			var handheldRenderer = getHandheldRenderer();
			updateHandheldRenderer(handheldRenderer,
				getResizeStrategyGuiWidth(resizeStrategy),
				getResizeStrategyGuiHeight(resizeStrategy));
		
			var orientation = getHandheldRendererOrientation(handheldRenderer);
			var barWidth = getHandheldRendererBarWidth(handheldRenderer);
			var barHeight = getHandheldRendererBarHeight(handheldRenderer);
			var viewWidth = getResizeStrategyViewWidth(resizeStrategy);
			var viewHeight = getResizeStrategyViewHeight(resizeStrategy);
			var viewMaxWidth = getPropertyReal("renderer.view.maxWidth", 750);
			var viewMaxHeight = getPropertyReal("renderer.view.maxHeight", 920);
		
			switch (orientation) {
				case ScreenOrientation.HORIZONTAL:
					var handheldViewWidth = getResizeStrategyGuiWidth(resizeStrategy) - (2 * barWidth);
					var handheldViewHeight = getResizeStrategyGuiHeight(resizeStrategy);
					var viewPixelScale = getPropertyBoolean("handheldREnderer.overrideViewScale", false) ?
						getPropertyReal("handheldREnderer.viewScale", 1.0) : 
						(isMobile() ? 1.0 : getPixelScale(handheldViewWidth, viewMaxWidth));
					viewWidth = round(handheldViewWidth * viewPixelScale)
					viewHeight = round(handheldViewHeight * viewPixelScale)
			
					break;
				case ScreenOrientation.VERTICAL:
					var handheldViewWidth = getResizeStrategyGuiWidth(resizeStrategy);
					var handheldViewHeight = getResizeStrategyGuiHeight(resizeStrategy) - barHeight;
					var viewPixelScale = getPropertyBoolean("handheldREnderer.overrideViewScale", false) ?
						getPropertyReal("handheldREnderer.viewScale", 1.0) : 
						(isMobile() ? 1.0 : getPixelScale(handheldViewHeight, viewMaxHeight));
				
					viewWidth = round(handheldViewWidth * viewPixelScale)
					viewHeight = round(handheldViewHeight * viewPixelScale)
					break;
				default:
					logger("Found unrecognized ScreenOrientation. Raw: {0}", LogType.ERROR, orientation);
			}
		
			setResizeStrategyViewWidth(resizeStrategy, viewWidth);
			setResizeStrategyViewHeight(resizeStrategy, viewHeight);
		}
	
		return resizeStrategy;
	



}
