///@return {Optional<GridRenderer>} gridRenderer
function getGridRenderer() {

	return global.gridRendererContext;
}

///@param {GridEvent} gridEvent
function sendGridEvent(gridEvent) {
	
	addElementToPipeline(getInstanceVariable(getGridRenderer(), GridRenderer_gridEventPipeline), gridEvent);
}


///@param {ColorTransformTask} colorTransformTask
function sendGridRendererColorTransformTask(colorTransformTask) {

	var colorTransformPipeline = getInstanceVariable(getGridRenderer(), GridRenderer_colorTransformPipeline)
	if (isDataStructure(colorTransformPipeline, List)) {
		
		addToList(colorTransformPipeline, colorTransformTask);	
	}
}

