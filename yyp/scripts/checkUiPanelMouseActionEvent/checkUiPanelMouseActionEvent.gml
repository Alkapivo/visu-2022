///@function checkUiPanelMouseActionEvent(uiPanel, mouseActionEvent)
///@description Validator.
///@param {UiPanel?} uiPanel
///@param {MouseActionEvent} mouseActionEvent
///@return {Boolean} isValid
function checkUiPanelMouseActionEvent(argument0, argument1) {

		var uiPanel = argument0;
		var mouseActionEvent = argument1;
	
		var area = getUiPanelArea(uiPanel);
		var mouseGuiX = getMouseActionEventGuiX(mouseActionEvent);
		var mouseGuiY = getMouseActionEventGuiY(mouseActionEvent);
	
		return coordsInRectangle(area, mouseGuiX, mouseGuiY);
	



}
