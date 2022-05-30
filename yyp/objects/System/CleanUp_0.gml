///@description cleanUp()

	saveSettingsRepository();

	destroyPipeline(loadingIntentPipeline);
	destroyReactor(instanceFieldModifierTaskReactor)
	
	if (isEntity(settingsRepository, Repository)) {
		destroyRepository(settingsRepository);
	}
	
	deregisterContext(this);
	
