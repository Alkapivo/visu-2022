///@function mouseActionRightPressedHandler()
///@description Resolver.
///@return {Boolean} state
function mouseActionRightPressedHandler() {

		var state = false;

		var mouseManager = getMouseManager();

		var button = mouse_check_button(mb_right)
		var buttonPressed = mouse_check_button_pressed(mb_right)
		var buttonReleased = mouse_check_button_released(mb_right);
		var dropEvent = mouseManager.mouseRightDrop;
	
		if (button) && (buttonPressed) && (!mouseManager.mouseRightPressed) {
		
			mouseManager.mouseRightPressed = true;
			setTupleKey(mouseManager.mouseRightPressedPosition, getMouseGuiX());
			setTupleValue(mouseManager.mouseRightPressedPosition, getMouseGuiY());
		}
	
		if (buttonReleased) && (mouseManager.mouseRightPressed) && (!dropEvent) {
		
			mouseManager.mouseRightPressed = false;
			state = true;
		}
	
		if (!button) && (!buttonPressed) && (!buttonReleased) {
		
			mouseManager.mouseRightPressed = false;
		}
	
		return state;
	



}
