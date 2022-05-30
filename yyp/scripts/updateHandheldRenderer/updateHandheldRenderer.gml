///@function updateHandheldRenderer(handheldRenderer, guiWidth, guiHeight);
///@descrtipion Update.
///@param {HandheldRenderer} handheldRenderer
///@param {Number} guiWidth
///@param {Number} guiHeight
function updateHandheldRenderer(argument0, argument1, argument2) {

		var handheldRenderer = argument0;
		var guiWidth = argument1;
		var guiHeight = argument2;
	
		// TODO Getters and setters
		var previousHandheldBarWidth = handheldRenderer.handheldBarWidth;
		var previousHandheldBarHeight = handheldRenderer.handheldBarHeight;
	
		var handheldOrientation = (guiWidth / guiHeight) > handheldRenderer.handheldOrientationVerticalTresholdRatio ?
			ScreenOrientation.HORIZONTAL : ScreenOrientation.VERTICAL;
		var handheldBarWidth = handheldOrientation == ScreenOrientation.HORIZONTAL ? 
			max(handheldRenderer.handheldBarHorizontalMaxWidth, guiWidth * handheldRenderer.handheldBarHorizontalWidthFactor) :
			guiWidth;
		var handheldBarHeight = handheldOrientation == ScreenOrientation.HORIZONTAL ?
			guiHeight :
			guiHeight * handheldRenderer.handhelBarVerticalHeightFactor;

		handheldRenderer.handheldOrientation = handheldOrientation;
		handheldRenderer.handheldBarWidth = handheldBarWidth;
		handheldRenderer.handheldBarHeight = handheldBarHeight;	
		handheldRenderer.handheldResizeState = (
			(handheldBarWidth != previousHandheldBarWidth) || 
			(handheldBarHeight != previousHandheldBarHeight)) ?
				RendererResizeState.REQUIRED : 
				RendererResizeState.IDLE;



}
