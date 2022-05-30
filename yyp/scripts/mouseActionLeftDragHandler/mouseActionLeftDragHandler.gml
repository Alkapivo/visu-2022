///@function mouseActionLeftDragHandler()
///@description Resolver.
///@return {Boolean} state
function mouseActionLeftDragHandler() {

		var state = false;

		var mouseManager = getMouseManager();
	
		var button = mouse_check_button(mb_left)
		var buttonPressed = mouse_check_button_pressed(mb_left)
		var pressedPosition = mouseManager.mouseLeftPressedPosition;
		var threshold = mouseManager.mouseDragThreshoold;
		var pointDistance = point_distance(getMouseGuiX(), getMouseGuiY(), getPositionHorizontal(pressedPosition), getPositionVertical(pressedPosition));
	
		if (button) && (!buttonPressed) && (!mouseManager.mouseLeftDrag) && (pointDistance > threshold) {
		
			mouseManager.mouseLeftDrag = true;
			state = true;
		}
	
		if (!button) {
		
			mouseManager.mouseLeftDrag = false;
		}
	
		return state;
	



}
