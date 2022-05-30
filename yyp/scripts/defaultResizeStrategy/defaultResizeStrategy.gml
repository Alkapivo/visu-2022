///@function defaultResizeStrategy()
///@description Calculate real, gui, view width/height values.
///@return {ResizeStrategy} resizeStrategy
function defaultResizeStrategy() {

	return html5defaultResizeStrategy();

	if (isHtml5()) {
	
		return html5defaultResizeStrategy();
	}
	
	var realWidth = 0;
	var realHeight = 0;
	
	var guiWidth = 0;
	var guiHeight = 0;
	var guiMinWidth = getPropertyReal("renderer.gui.minWidth", 1024);
	var guiMinHeight = getPropertyReal("renderer.gui.minHeight", 768);
	var guiMaxWidth = getPropertyReal("renderer.gui.maxWidth", 2560);
	var guiMaxHeight = getPropertyReal("renderer.gui.maxHeight", 1600);
	var guiPixelScale = 1.0;
	
	var viewWidth = 0;
	var viewHeight = 0;
	var viewMinWidth = getPropertyReal("renderer.view.minWidth", guiMinWidth);
	var viewMinHeight = getPropertyReal("renderer.view.minHeight", guiMinHeight);
	var viewMaxWidth = getPropertyReal("renderer.view.maxWidth", 1024);
	var viewMaxHeight = getPropertyReal("renderer.view.maxHeight", 720);
	var viewPixelScale = 1.0;
	/*
	var settings = findInRepositoryById(getSettingsRepository(), "view");
	if (settings != null) {
		var attributes = getSettingsAttributes(settings);
		guiPixelScale = getValueFromMap(attributes, "guiPixelScale", 1.0);
		guiPixelScale = isNumber(guiPixelScale) ? guiPixelScale : 1.0;
		viewPixelScale = getValueFromMap(attributes, "viewPixelScale", 1.0);
		viewPixelScale = isNumber(viewPixelScale) ? viewPixelScale : 1.0;
	}
	*/
	var size = getCurrentRendererSize();
	
	realWidth = getTupleKey(size) < guiMinWidth ? guiMinWidth : getTupleKey(size);
	realHeight = getTupleValue(size) < guiMinHeight ? guiMinHeight : getTupleValue(size);
	
	var orientation = realWidth >= realHeight ? ScreenOrientation.HORIZONTAL : ScreenOrientation.VERTICAL;
	var realCompare = orientation == ScreenOrientation.HORIZONTAL ? realWidth : realHeight;
	guiPixelScale = getPixelScale(realCompare, orientation == ScreenOrientation.HORIZONTAL ? guiMaxWidth : guiMaxHeight);
	guiWidth = round(realWidth * guiPixelScale)
	guiHeight = round(realHeight * guiPixelScale)
	
	viewPixelScale = getPixelScale(realCompare, orientation == ScreenOrientation.HORIZONTAL ? viewMaxWidth : viewMaxHeight);
	viewWidth = round(realWidth * viewPixelScale)
	viewHeight = round(realHeight * viewPixelScale)
	
	if (viewWidth < 1024) {
		var helpScale = guiHeight / guiWidth;
		viewWidth = 1024;
		viewHeight = viewWidth * helpScale;
	}

	return createResizeStrategy(
		realWidth, realHeight,
		guiWidth, guiHeight,
		viewWidth, viewHeight
	);
}

///@function html5defaultResizeStrategy()
///@description Calculate real, gui, view width/height values.
///@return {ResizeStrategy} resizeStrategy
function html5defaultResizeStrategy() {

	var size = getCurrentRendererSize();
	var realWidth = getTupleKey(size);
	var realHeight = getTupleValue(size);
	
	CurrentResolution = createResolution(
		stringParams("{0}x{1}", realWidth, realHeight),
		realWidth,
		realHeight,
		realWidth,
		realHeight,
		realWidth,
		realHeight
	);

	return createResizeStrategy(
		realWidth, realHeight,
		realWidth, realHeight,
		realWidth, realHeight
	);
}

