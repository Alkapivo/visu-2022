///@function dialogueManagerMouseViewContainerStepHandler(uiManager)
///@description Handler of AssetScript~UiManagerMouseViewContainerStepHandler.
///@param {UiManager?} uiManager
function dialogueManagerMouseViewContainerStepHandler(argument0) {

		var uiManager = argument0;
	
		var mouseViewContainer = getUiManagerMouseViewContainer(uiManager);
		if (isEntity(mouseViewContainer, MouseViewContainer)) {
	
			var area = getMouseViewContainerArea(mouseViewContainer);
		
			var xBegin = getRectangleXBegin(area);
			var yBegin = getRectangleYBegin(area);
			var xEnd = getRectangleXEnd(area);
			var yEnd = getRectangleYEnd(area);
		
			if ((xBegin != 0) ||
				(yBegin != 0) ||
				(xEnd != GuiWidth) ||
				(yEnd != GuiHeight)) {
				
				setRectangleXBegin(area, 0);
				setRectangleYBegin(area, 0);
				setRectangleXEnd(area, GuiWidth);
				setRectangleYEnd(area, GuiHeight);
			}
		}
	



}
