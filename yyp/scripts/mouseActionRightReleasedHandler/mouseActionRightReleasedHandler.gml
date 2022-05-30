///@function mouseActionRightReleasedHandler()
///@description Resolver.
///@return {Boolean} state
function mouseActionRightReleasedHandler() {

		var state = false;

		var mouseManager = getMouseManager();
	
		var buttonReleased = mouse_check_button_released(mb_right);
		var dropEvent = mouseManager.mouseRightDrop;
	
		if (buttonReleased) && (!dropEvent) {
		
			state = true;
		}
	
		return state;
	



}
