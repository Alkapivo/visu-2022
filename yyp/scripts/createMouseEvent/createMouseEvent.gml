///@function createMouseEvent(type, xMouse, yMouse)
///@description Constructor for MouseEvent entity.
///@param {MouseEventType} type
///@param {Integer} xMouse
///@param {Integer} yMouse
///@return {MouseEvent} mouseEvent 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.362Z}
function createMouseEvent(argument0, argument1, argument2) {

		var type = argument0;
		var xMouse = argument1;
		var yMouse = argument2;
	
		var mouseEvent = createEntity(MouseEvent);

		setMouseEventType(mouseEvent, assertNoOptional(type));
		setMouseEventXMouse(mouseEvent, assertNoOptional(xMouse));
		setMouseEventYMouse(mouseEvent, assertNoOptional(yMouse));

		return mouseEvent;
	



}
