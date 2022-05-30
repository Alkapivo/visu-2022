///@description

	#region Fields
	
///@public:
	
	///@type {Surface}
	applicationSurface = createSurface(GuiWidth, GuiHeight, true);
	
///@private:

	////@type {Optional<Exception>}
	exception = createEmptyOptional();
	
	///@type {Number}
	blinkTimer = 0.0;
	
	#endregion