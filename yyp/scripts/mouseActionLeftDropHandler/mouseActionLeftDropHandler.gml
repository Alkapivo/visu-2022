///@function mouseActionLeftDropHandler()
///@description Resolver.
///@return {Boolean} state
function mouseActionLeftDropHandler() {

		var state = false;

		var mouseManager = getMouseManager();
	
		var button = mouse_check_button(mb_left);
		var buttonPressed = mouse_check_button_pressed(mb_left);
		var buttonReleased = mouse_check_button_released(mb_left);
		var dragEvent = mouseManager.mouseLeftDrag;
	
		if (!button) && (!buttonPressed) && (buttonReleased) && (dragEvent) {
		
			mouseManager.mouseLeftDrop = true;
			state = true;
		} else {
	
			mouseManager.mouseLeftDrop = false;
		}
	
		return state;
	



}
