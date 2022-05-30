///@description cleanUp()

	if (isEntity(uiActionEventPipeline, Pipeline)) {
		destroyPipeline(uiActionEventPipeline);	
	}
	
	removeUiPanelFromUiManagerByInstanceId(uiManager, this);
	
