///@function sendMouseActionEvent(mouseActionEvent)
///@description Add MouseActionEvent to MouseManager::Pipeline<MouseActionEvent>.
///@param {MouseActionEvent} mouseActionEvent
function sendMouseActionEvent(argument0) {

		var mouseActionEvent = argument0;
	
		var mouseManager = getMouseManager();
		var mouseActionEventPipeline = getInstanceVariable(mouseManager, FieldMouseManager_mouseActionEventPipeline);
		addElementToPipeline(mouseActionEventPipeline, mouseActionEvent);
	



}
