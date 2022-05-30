///@function createMouseActionEvent(type, state, viewX, viewY, guiX, guiY)
///@description Constructor for MouseActionEvent entity.
///@param {String} type
///@param {Boolean} state
///@param {Integer} viewX
///@param {Integer} viewY
///@param {Integer} guiX
///@param {Integer} guiY
///@return {MouseActionEvent} mouseActionEvent 
///@throws {Exception}
///@generated {2021-05-01T23:49:41.602Z}

function createMouseActionEvent(type, state, viewX, viewY, guiX, guiY) {

	var mouseActionEvent = createEntity(MouseActionEvent);

	setMouseActionEventType(mouseActionEvent, assertNoOptional(type));
	setMouseActionEventState(mouseActionEvent, assertNoOptional(state));
	setMouseActionEventViewX(mouseActionEvent, assertNoOptional(viewX));
	setMouseActionEventViewY(mouseActionEvent, assertNoOptional(viewY));
	setMouseActionEventGuiX(mouseActionEvent, assertNoOptional(guiX));
	setMouseActionEventGuiY(mouseActionEvent, assertNoOptional(guiY));

	return mouseActionEvent;
	
}
