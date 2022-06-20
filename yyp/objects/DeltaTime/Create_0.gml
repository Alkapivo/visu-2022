///@description create()

	registerContext(this);
	
	#region Fields
///@public:

	///@type {Boolean}
	deltaTimeEnabled = true;
	
	///@type {Number}
    global.deltaTime = 0;
	
	///@type {Number}
    minFps = 2;
	
///@private:

	///@type {Number}
	deltaTime = 0.0;
	
	///@type {Number}
	///@const
	deltaTimePrecision = 1000000.0;
	
	///@type {Number}
	deltaTimePrevious = 0.0;
	
	///@type {Boolean}
	deltaTimeRestored = false;
	#endregion
	
