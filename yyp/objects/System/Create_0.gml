///@description create()

	registerContext(this);
	
	#region Fields
	
///@public:

	///@type {Layer}
	systemLayer = layer;
	
	///@type {Layer}
	renderLayer = createRenderLayer();
	
	///@type {Optional<Repository<Settings>>}
	settingsRepository = createEmptyOptional();
	
///@private:
	
	///@type {Pipeline<LoadingIntent>}
	loadingIntentPipeline = generatePipeline("loadingIntentPipeline", Queue, LoadingIntent);
	
	///@type {Reactor<FieldModifierTask>}
	instanceFieldModifierTaskReactor = generateReactor("instanceFieldModifierTaskReactor", Map, FieldModifierTask);
	
	#endregion
	
	inject(Console);
	inject(LoggerWriter);
	inject(DeltaTime);
	
	#region Load Settings @todo refactor/remove
	#region Validate and restore default file
	var settingsFileName = "settings.json";
	var settingsFilePath = "./";
	var settingsFullFilePath = settingsFileName + settingsFilePath;
	var settingsString = "{}";
	if (fileExists(settingsFullFilePath, StorageType.WEB_LOCAL_STORAGE)) {
		settingsString = readStringFromFile(
			settingsFilePath,
			settingsFileName,
			StorageType.WEB_LOCAL_STORAGE);
	} else {
		
		logger("Create new settings file", LogType.INFO);
		settingsRepository = createRepository("settings", "Settings", createDefaultSettings());
		saveSettingsRepository();
		settingsString = serializeRepository(settingsRepository);
	}
	settingsRepository = deserializeRepository(settingsString);
	
	var systemSettings = findInRepositoryById(getSettingsRepository(), "system");
	var attributes = systemSettings != null ? getSettingsAttributes(systemSettings) : null;
	var settingsVersion = attributes != null ? attributes[? "version"] : null;
	if ((isUndefined(settingsVersion)) ||
		(settingsVersion != GM_version)) {
		destroyRepository(settingsRepository);
		settingsRepository = createRepository("settings", "Settings", createDefaultSettings());
		saveSettingsRepository();
	}
	#endregion
	
	var settings = findInRepositoryById(getSettingsRepository(), "system");
	var attributes = getSettingsAttributes(settings);
	
	global.isDebugMode = attributes[? "enableDebugOverlay"] == "true";
	show_debug_overlay(global.isDebugMode);
	#endregion
	
	
