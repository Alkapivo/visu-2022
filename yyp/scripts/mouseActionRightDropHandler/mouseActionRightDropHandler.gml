///@function mouseActionRightDropHandler()
///@description Resolver.
///@return {Boolean} state
function mouseActionRightDropHandler() {

		var state = false;

		var mouseManager = getMouseManager();
	
		var button = mouse_check_button(mb_right);
		var buttonPressed = mouse_check_button_pressed(mb_right);
		var buttonReleased = mouse_check_button_released(mb_right);
		var dragEvent = mouseManager.mouseRightDrag;
	
		if (!button) && (!buttonPressed) && (buttonReleased) && (dragEvent) {
		
			mouseManager.mouseRightDrop = true;
			state = true;
		} else {
	
			mouseManager.mouseRightDrop = false;
		}
	
		return state;
	



}
