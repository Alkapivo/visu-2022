///@function sendGridElementRenderRequest(gridElement)
///@description Send gridElement to GridRenderer gridElementPipeline.
///@param {?GridElement} gridElement
function sendGridElementRenderRequest(argument0) {

		var gridElement = argument0;
	
		var positionStamp = fetchGridElementPositionStamp(gridElement);
		var gridElementPipeline = getGridRendererGridElementPipeline();
	
		addToPriorityQueue(gridElementPipeline, positionStamp, gridElement);
}
