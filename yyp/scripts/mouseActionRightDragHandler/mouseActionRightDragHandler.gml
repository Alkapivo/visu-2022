///@function mouseActionRightDragHandler()
///@description Resolver.
///@return {Boolean} state
function mouseActionRightDragHandler() {

		var state = false;

		var mouseManager = getMouseManager();
	
		var button = mouse_check_button(mb_right)
		var buttonPressed = mouse_check_button_pressed(mb_right)
		var pressedPosition = mouseManager.mouseRightPressedPosition;
		var threshold = mouseManager.mouseDragThreshoold;
		var pointDistance = point_distance(getMouseGuiX(), getMouseGuiY(), getPositionHorizontal(pressedPosition), getPositionVertical(pressedPosition));
	
		if (button) && (!buttonPressed) && (!mouseManager.mouseRightDrag) && (pointDistance > threshold) {
		
			mouseManager.mouseRightDrag = true;
			state = true;
		}
	
		if (!button) {
		
			mouseManager.mouseRightDrag = false;
		}
	
		return state;
	



}
