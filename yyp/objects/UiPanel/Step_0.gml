///@description step()
	
	#region {Pipeline<UiActionEvent>} uiActionEventPipeline
	for (var uiActionEvent = getPipelineFirstElement(uiActionEventPipeline);
		 iteratorFinish(uiActionEvent);
		 uiActionEvent = getPipelineNextElement(uiActionEventPipeline)) {
	
		runScript(uiActionEventHandler, uiActionEvent);
	}
	#endregion

	#region {Optional<AssetScript~UiPanelStepHandler>} stepHandler
	if (isOptionalPresent(stepHandler)) {
		
		runScript(stepHandler, uiManager, this);	
	}
	#endregion
	
