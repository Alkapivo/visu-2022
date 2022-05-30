///@description Save Console settings

	var settingsRepository = getSettingsRepository();
	if (isOptionalPresent(settingsRepository)) {
		
		var settings = getDefaultValue(
			findInRepositoryById(settingsRepository, "console"),
			saveInRepository(
				getSettingsRepository(), 
				SETTINGS_CONSOLE_REPOSITORY_ID, 
				createSettings(SETTINGS_CONSOLE_REPOSITORY_ID, createMap())
			)
		);
		
		
		var console = getConsole();
		
		var commandHistory = getInstanceVariable(console, "commandHistory");
		if (isDataStructure(commandHistory, List)) {
			var serializedCommandHistory = serializeList(commandHistory);
			var attributes = getSettingsAttributes(settings);
		}
		var serializedList = serializeList(commandHistory);
		var attributes = getSettingsAttributes(settings);
		if (attributes == null) {
			attributes = createMap();
			setSettingsAttributes(settings, attributes);
		}
		attributes[? "commandHistory"] = serializedList;
	}
	
