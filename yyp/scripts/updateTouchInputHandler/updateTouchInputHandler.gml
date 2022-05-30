///@function updateTouchInputHandler(touchInputHandler, joystickXPosition, joystickYPosition, joystickPointerMaxDistance, actionKeyXPosition, actionKeyYPosition, actionKeyWidth, actionKeyHeight)
///@description setup virtual key TouchInputHandler.actionKey and TouchInputHandler.virtualJoystick.
///@param {TouchInputHandler} touchInputHandler
///@param {Number} joystickXPosition
///@param {Number} joystickYPosition
///@param {Number} joystickPointerMaxDistance
///@param {Number} actionKeyXPosition
///@param {Number} actionKeyYPosition
///@param {Number} actionKeyWidth
///@param {Number} actionKeyHeight
function updateTouchInputHandler(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {

		var touchInputHandler = argument0;	
		var joystickXPosition = argument1;
		var joystickYPosition = argument2;
		var joystickPointerMaxDistance = argument3;
		var actionKeyXPosition = argument4;
		var actionKeyYPosition = argument5;
		var actionKeyWidth = argument6;
		var actionKeyHeight = argument7;
	
		var virtualJoystick = getTouchInputHandlerVirtualJoystick(touchInputHandler);
		setVirtualJoystickXPosition(virtualJoystick, joystickXPosition);
		setVirtualJoystickYPosition(virtualJoystick, joystickYPosition);
		setVirtualJoystickPointerMaxDistance(virtualJoystick, joystickPointerMaxDistance);
	
		setTouchInputHandlerVirtualActionKeyXPosition(touchInputHandler, actionKeyXPosition);
		setTouchInputHandlerVirtualActionKeyYPosition(touchInputHandler, actionKeyYPosition);
		setTouchInputHandlerVirtualActionKeyWidth(touchInputHandler, actionKeyWidth);
		setTouchInputHandlerVirtualActionKeyHeight(touchInputHandler, actionKeyHeight);
	



}
