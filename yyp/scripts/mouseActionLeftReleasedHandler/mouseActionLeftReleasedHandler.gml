///@function mouseActionLeftReleasedHandler()
///@description Resolver.
///@return {Boolean} state
function mouseActionLeftReleasedHandler() {

		var state = false;

		var mouseManager = getMouseManager();
	
		var buttonReleased = mouse_check_button_released(mb_left);
		var dropEvent = mouseManager.mouseLeftDrop;
	
		if (buttonReleased) && (!dropEvent) {
		
			state = true;
		}
	
		return state;
	



}
