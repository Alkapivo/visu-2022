///@description 

	super();
		
	#region Fields
	
///@public:

	///@type {VirtualJoystick}
	virtualJoystick = createVirtualJoystick();
	
	///@type {Integer}
	virtualActionKeyXPosition = 0;
	
	///@type {Integer}
	virtualActionKeyYPosition = 0;
	
	///@type {Integer}
	virtualActionKeyWidth = 0;
	
	///@type {Integer}
	virtualActionKeyHeight = 0;
	
///@private:

	///@type {Number}	
	virtualJoystickAngleMargin = getPropertyReal("touchInputHandler.virtualJoystick.angleMargin", 15);

	///@type {Number}
	pressedTimer = 0.0;

	#endregion
