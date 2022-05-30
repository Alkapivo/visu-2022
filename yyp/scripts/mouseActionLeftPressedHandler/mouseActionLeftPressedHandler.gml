///@function mouseActionLeftPressedHandler()
///@description Resolver.
///@return {Boolean} state
function mouseActionLeftPressedHandler() {

		var state = false;

		var mouseManager = getMouseManager();

		var button = mouse_check_button(mb_left)
		var buttonPressed = mouse_check_button_pressed(mb_left)
		var buttonReleased = mouse_check_button_released(mb_left);
		var dropEvent = mouseManager.mouseLeftDrop;
	
		if (button) && (buttonPressed) && (!mouseManager.mouseLeftPressed) {
		
			mouseManager.mouseLeftPressed = true;
			setTupleKey(mouseManager.mouseLeftPressedPosition, getMouseGuiX());
			setTupleValue(mouseManager.mouseLeftPressedPosition, getMouseGuiY());
		}
	
		if (buttonReleased) && (mouseManager.mouseLeftPressed) && (!dropEvent) {
		
			mouseManager.mouseLeftPressed = false;
			state = true;
		}
	
		if (!button) && (!buttonPressed) && (!buttonReleased) {
		
			mouseManager.mouseLeftPressed = false;
		}
	
		return state;
	



}
