///@function resolveMouseViewContainerMouseAction(mouseViewContainer, mouseActionEvent)
///@description Resolver.
///@param {MouseViewContainer} mouseViewContainer
///@param {MouseActionEvent} mouseActionEvent
///@return {Boolean} result
function resolveMouseViewContainerMouseAction(argument0, argument1) {

		var mouseViewContainer = argument0;
		var mouseActionEvent = argument1;
	
		var handler = getMouseViewContainerMouseActionEventHandler(mouseViewContainer);	
		var result = runScript(handler, mouseViewContainer, mouseActionEvent);
	
		return isBoolean(result) ? result : false;
	



}
