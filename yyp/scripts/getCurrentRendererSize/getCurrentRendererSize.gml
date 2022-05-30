///@function getCurrentRendererSize()
///@description Get current width and height of game window
///@return {Tuple<Integer>} size - key is width, value is height
function getCurrentRendererSize() {

		var size = createTuple(RealWidth, RealHeight);
		if (isHtml5()) {
			
			var canvasSizeString = jsUtilGetCanvasSize();
			var canvasSize = decodeJson(canvasSizeString);
			var exception = catchException();
			if (isOptionalPresent(exception)) {
				
				throwException(
					createException(
						RuntimeException,
						stringParams(
							"Unable to parse response from jsUtilGetCanvasSize. Original exception: {0}", 
							getExceptionMessage(exception)),
						runtimeExceptionHandler
					)
				);
			} else {

				var isFullscreen = global.isFullscreen || window_get_fullscreen();
				var width = isFullscreen ? browser_width : getJsonObjectFieldValue(canvasSize, "width");
				var height = isFullscreen ? browser_height : getJsonObjectFieldValue(canvasSize, "height");
			
				logger("W: {0}\n\nH: {1}", LogType.INFO, width, height);
				if (isOptionalPresent(width) && isOptionalPresent(height)) {
					setTupleKey(size, width);
					setTupleValue(size, height);			
				} else {
					var disableForDebug = true;
					if (!disableForDebug) {
						throwException(createException(RuntimeException,
							"jsUtilGetCanvasSize response doesn't contain width, height",
							runtimeExceptionHandler));
					}
				}
			}
		} else {
			
			setTupleKey(size, window_get_width());
			setTupleValue(size, window_get_height());
		}
	
		logger("GetCurrentRendererSize: {0}", LogType.INFO, size);
		return size;
	



}
