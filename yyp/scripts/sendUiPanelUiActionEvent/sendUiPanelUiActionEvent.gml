///@function sendUiPanelUiActionEvent(uiPanel, event)
///@description Add InputActionEvent to UiPanel::Pipeline<InputActionEvent>.
///@param {UiPanel?} uiPanel
///@param {UiActionEvent} event
function sendUiPanelUiActionEvent(argument0, argument1) {

		var uiPanel = argument0;
		var event = argument1;
		
		var uiActionEventPipeline = getInstanceVariable(uiPanel, FieldUiPanel_uiActionEventPipeline);
		addElementToPipeline(uiActionEventPipeline, event);
	



}
