///@description Initialize Renderer

	registerContext(this);
	
	#region Fields
///@public:

	///@type RendererResizeState
	rendererResizeState = RendererResizeState.IDLE;
	
	///@type {AssetScript};
	resizeStrategyHandler = defaultResizeStrategy;
	
	///@type {Timer}
	resizeCooldownTimer = 0.0;

///@private:

	///@type {Integer}
	previousWidth = 0;
	
	///@type {Integer}
	previousHeight = 0;

	///@type {Boolean}
	enableTexFilter = getPropertyBoolean("renderer.enableTexFilter", false)
	
	#endregion
	
	#region Setup GPU parameters TODO remove from inheritance, init only?
	gpu_set_texfilter(enableTexFilter);
	gpu_set_ztestenable(false);
	gpu_set_zwriteenable(false);
	gpu_set_blendenable(true);
	application_surface_draw_enable(false);
	#endregion
	