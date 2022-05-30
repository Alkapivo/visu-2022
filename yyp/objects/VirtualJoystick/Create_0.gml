///@description

	#region Fields
	
///@public:

	///@type {VirtualJoystickState}
	state = VirtualJoystickState.DISABLED;
	
	///@type {Integer}
	touchDeviceIndex = 0;
	
	///@type {Optional<Number>}
	xPosition = 0;
	
	///@type {Optional<Number>}
	yPosition = 0;
	
	///@type {Boolean}
	isPositionFixed = true;
	
	///@type {Number}
	fixedXPosition = 0;
	
	///@type {Number}
	fixedYPosition = 0;
	
	///@type {Optional<Number>}
	pointerXPosition = null;
	
	///@type {Optional<Number>}
	pointerYPosition = null;
	
	///@type {Optional<Number>}
	pointerDirection = 0;
	
	///@type {Number}
	pointerMaxDistance = 72;
	
	///@type {Number}
	pointerMinDistance = 8;
	
///@private:

	///@type {Number}
	virtualJoystickDeadzone = getPropertyReal("virtualJoystick.deadzone", 0.33);

	#endregion
	
