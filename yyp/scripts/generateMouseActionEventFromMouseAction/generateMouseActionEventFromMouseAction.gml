///@function generateMouseActionEventFromMouseAction(mouseAction)
///@description Constructor.
///@param {MouseAction} mouseAction
///@return {MouseActionEvent} mouseActionEvent
function generateMouseActionEventFromMouseAction(argument0) {

		var mouseAction = argument0;
	
		var mouseViewX = getMouseViewX();
		var mouseViewY = getMouseViewY();
		var mouseGuiX = getMouseGuiX();
		var mouseGuiY = getMouseGuiY();
	
		var mouseActionEvent = createMouseActionEvent(
			getMouseActionType(mouseAction),
			getMouseActionState(mouseAction),
			mouseViewX, 
			mouseViewY,
			mouseGuiX, 
			mouseGuiY
		);
	
		return mouseActionEvent;
	



}
