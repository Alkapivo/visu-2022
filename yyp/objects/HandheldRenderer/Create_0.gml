///@description 

	super();
	
	#region Fields
///@public:

	///@type {Surface}
	handheldSurface = createSurface(global.guiWidth, global.guiHeight, false);
		
	///@type {ScreenOrientation}
	handheldOrientation = ScreenOrientation.HORIZONTAL;
	
	///@type {Number}
	handheldBarWidth = 0.0;
	
	///@type {Number}
	handheldBarHeight = 0.0;
	
	///@type {RendererResizeState}
	handheldResizeState = RendererResizeState.IDLE;
	
	///@type {Number}
	previousHandheldBarWidth = 0.0;
	
	///@type {Number}
	previousHandheldBarHeight = 0.0;
	
	///@type {Number}
	handheldBarHorizontalMaxWidth = getPropertyReal("handheldRenderer.handheldBarHorizontalMaxWidth", 140);
	
	///@type {Number}
	handheldBarHorizontalWidthFactor = getPropertyReal("handheldRenderer.handheldBarHorizontalWidthFactor", 0.11);
	
	///@type {Number}
	handhelBarVerticalHeightFactor = getPropertyReal("handheldRenderer.handheldBarVerticalHeightFactor", 0.28);
	
	///@type {Number}
	handheldOrientationVerticalTresholdRatio = getPropertyReal("handheldRenderer.handheldBarVerticalTresholdRatio", 4.0 / 3.0);
	
	///@type {Number}
	handheldOrientationHorizontalButtonVerticalOffset = getPropertyReal("handheldRenderer.horizontal.button.verticalOffset", 0.4);
	
	///@type {Number}
	handheldOrientationHorizontalButtonHorizontalOffset = getPropertyReal("handheldRenderer.horizontal.button.horizontalOffset", 0.5);
	
	///@type {Number}
	handheldOrientationHorizontalButtonSize = getPropertyReal("handheldRenderer.horizontal.button.size", 0.3);
	
	///@type {Number}
	handheldOrientationVerticalButtonVerticalOffset = getPropertyReal("handheldRenderer.vertical.button.verticalOffset", 0.5);
	
	///@type {Number}
	handheldOrientationVerticalButtonHorizontalOffset = getPropertyReal("handheldRenderer.vertical.button.horizontalOffset", 0.18);
	
	///@type {Number}
	handheldOrientationVerticalButtonSize = getPropertyReal("handheldRenderer.vertical.button.size", 0.3);
	
	///@type {GMColor}
	handheldColorBegin = colorHashToGMColor(getProperty("handheldRenderer.colorBegin", "#000000"));
	
	///@type {GMColor
	handheldColorEnd = colorHashToGMColor(getProperty("handheldRenderer.colorEnd", "#000000"));
	
///@private:
	
	#endregion
	