///@description Determine state

	var mouseX = getMouseGuiX();
	var mouseY = getMouseGuiY();
	
	pointerMinDistance = pointerMaxDistance * virtualJoystickDeadzone;
	
	state = 
		(device_mouse_check_button(touchDeviceIndex, mb_left)) && 
		(state != VirtualJoystickState.RUNNING) ?
			VirtualJoystickState.START : 
		((device_mouse_check_button_released(touchDeviceIndex, mb_left)) ?
			VirtualJoystickState.DISABLED :
			state);
			
	if (state == VirtualJoystickState.START) {
		pointerXPosition = mouseX;
		pointerYPosition = mouseY;
		pointerDirection = point_direction(xPosition, yPosition, pointerXPosition, pointerYPosition);
			
		if (point_distance(xPosition, yPosition, pointerXPosition, pointerYPosition) > pointerMaxDistance) {
			state = VirtualJoystickState.DISABLED;
		} else {
			state = VirtualJoystickState.RUNNING;	
		}
	}
	
	if (state == VirtualJoystickState.RUNNING) {
		pointerXPosition = mouseX;
		pointerYPosition = mouseY;
		pointerDirection = point_direction(xPosition, yPosition, pointerXPosition, pointerYPosition);	
		
		if (point_distance(xPosition, yPosition, pointerXPosition, pointerYPosition) > pointerMaxDistance) {
			pointerXPosition = xPosition + lengthdir_x(pointerMaxDistance, pointerDirection);
			pointerYPosition = yPosition + lengthdir_y(pointerMaxDistance, pointerDirection);
		}
	}
		
	if (state == VirtualJoystickState.DISABLED) {
		pointerXPosition = xPosition;
		pointerYPosition = yPosition;	
	}
	
	if ((state == VirtualJoystickState.START) || 
		(state == VirtualJoystickState.RUNNING)) {
		
		if (point_distance(xPosition, yPosition, pointerXPosition, pointerYPosition) < pointerMinDistance) {
			state =	VirtualJoystickState.DISABLED;
		}
	}