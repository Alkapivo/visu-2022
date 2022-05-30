///@description 

	gml_release_mode(true);

	var bootTime = get_timer();
	
	#region Boot
	randomize();
	
	if (isHtml5()) {
		///@deprecated gms2.3 tj_init_js();
		//jsUtilSetCanvasVisibility("true");
	} else {
		///@deprecated gms2.3 tj_init_gml();	
	}
	
	///@type {Map<Class<?Entity>::Integer>}
	global.entityPrototypes = createMap();
	
	///@type {Map<Class<?Entity>::Integer>}
	global.entityClassNames = createMap();
	
	global.jsonDecoderType = JsonDecoderType.TJSON;
	
	#region Initialization scripts
	initializeContexts();
	initializeEntities();
	initializeEnums();
	initializeExceptions();
	initializeGlobals();
	initializeMacros();
	initializeProperties();
	initializeManagers();
	
	global.isLoggerEnabled = getPropertyBoolean("isLoggerEnabled", false);
	
	logger("Target device info: { \"isMobile\": {0}, \"isHtml5\": {1} }", LogType.INFO, 
		convertBooleanToString(isMobile()), convertBooleanToString(isHtml5));
	#endregion
	
	#region Load config.json
	var configString = readStringFromFile(working_directory + "system", "config.json");
	if (!isOptionalPresent(configString)) {
		throwException(createException(RuntimeException, "Cannot boot without config.json", runtimeExceptionHandler));
		exit;
	}
			
	var packageConfigs = deserializePackageConfigs(configString);
	var exception = catchException();
	if (isOptionalPresent(exception)) {
		destroyException(exception);
		throwException(
			createException(
				RuntimeException, 
				stringParams("Invalid config.json: {0}", getExceptionMessage(exception)),
				runtimeExceptionHandler
			)
		);
		exit;
	}
	
	var packages = getPackageConfigsData(packageConfigs);
	for (var index = 0; index < getArrayLength(packages); index++) {
		var packageConfig = packages[@ index];
		
		var packageName = getPackageConfigPackageName(packageConfig);
        var artifactName = getPackageConfigArtifactName(packageConfig);
        var context = getPackageConfigContext(packageConfig);
        var scenes = getPackageConfigScenes(packageConfig);
		
		logger("Load package {0}::{1}", LogType.INFO, packageName, context);
		
		var initializeContextsScript = getAssetIndex(
			stringParams("initialize{0}Contexts", artifactName), 
			AssetScript, null);
		if (!isOptionalPresent(initializeContextsScript)) {
			throwException(
				createException(
					RuntimeException, 
					stringParams("initializeContextsScript wasn't found in config.json package { artifactName: \"{0}\" }", artifactName), 
					runtimeExceptionHandler
				)
			);
			exit;
		}
		runScript(initializeContextsScript);
		
		var initializeEntitiesScript = getAssetIndex(
			stringParams("initialize{0}Entities", artifactName), 
			AssetScript, null);
		if (!isOptionalPresent(initializeEntitiesScript)) {
			throwException(
				createException(
					RuntimeException, 
					stringParams("initializeEntitiesScript wasn't found in config.json package. { artifactName: \"{0}\" }", artifactName), 
					runtimeExceptionHandler
				)
			);
			exit;
			
		}
		runScript(initializeEntitiesScript);
		
		var initializeEnumsScript = getAssetIndex(
			stringParams("initialize{0}Enums", artifactName), 
			AssetScript, null);
		if (!isOptionalPresent(initializeEnumsScript)) {
			throwException(
				createException(
					RuntimeException, 
					stringParams("initializeEnumsScript wasn't found in config.json package { artifactName: \"{0}\" }", artifactName), 
					runtimeExceptionHandler
				)
			);
			exit;
		}
		runScript(initializeEnumsScript);
		
		var initializeGlobalsScript = getAssetIndex(
			stringParams("initialize{0}Globals", artifactName), 
			AssetScript, null);
		if (!isOptionalPresent(initializeGlobalsScript)) {
			throwException(
				createException(
					RuntimeException, 
					stringParams("initializeGlobalsScript wasn't found in config.json package { artifactName: \"{0}\" }", artifactName), 
					runtimeExceptionHandler
				)
			);
			exit;
			
		}
		runScript(initializeGlobalsScript);
		
		var initializeManagersScript = getAssetIndex(
			stringParams("initialize{0}Managers", artifactName), 
			AssetScript, null);
		if (!isOptionalPresent(initializeManagersScript)) {
			throwException(
				createException(
					RuntimeException, 
					stringParams("initializeManagersScript wasn't found in config.json package { artifactName: \"{0}\" }", artifactName), 
					runtimeExceptionHandler
				)
			);
			exit;
			
		}
		runScript(initializeManagersScript);
				
		for (var sceneIndex = 0; sceneIndex < getArrayLength(scenes); sceneIndex++) {
			var sceneName = scenes[sceneIndex];
			var sceneAsset = getAssetIndex(sceneName, AssetRoom, null);
			if (!isOptionalPresent(sceneAsset)) {
				throwException(
					createException(
						RuntimeException, 
						stringParams("Scene \"{1}\" asset wasn't found for config.json package { artifactName: \"{0}\" }", artifactName, sceneName), 
						runtimeExceptionHandler
					)
				);
				exit;
			}
			if (sceneIndex == 0) && (index == 0) {
				logger("Register scene \"{0}\" from package {1} as start scene", LogType.INFO,
					sceneName, packageName);
				global.startScene = sceneAsset;
			}
			global.scenes[? sceneName] = sceneAsset;
		}
	}
	
	destroyPackageConfigs(packageConfigs);
	#endregion
	
	#region Load consoleCommands.json
	var consoleCommandsString = readStringFromFile(working_directory + "system", "consoleCommands.json");
	if (isOptionalPresent(consoleCommandsString)) {
		
		var consoleCommandConfigs = deserializeConsoleCommandConfigs(consoleCommandsString);
		var exception = catchException();
		if (isOptionalPresent(exception)) {
			throwException(
				createException(
					RuntimeException, 
					stringParams("Invalid consoleCommands.json. {0}", getExceptionMessage(exception)),
					runtimeExceptionHandler
				)
			);
			exit;
		}
		
		var consoleCommands = getConsoleCommandConfigsData(consoleCommandConfigs);
		var consoleCommandsSize = getArrayLength(consoleCommands);
		for (var index = 0; index < consoleCommandsSize; index++) {
			var consoleCommand = consoleCommands[@ index];
			var command = getConsoleCommandConfigName(consoleCommand);
			var handlerName = getConsoleCommandConfigAsset(consoleCommand);
			var handlerAsset = getAssetIndex(handlerName, AssetScript, null);
			if ((isOptionalPresent(handlerAsset)) &&
				(isOptionalPresent(command))) {
				registerConsoleCommand(command, handlerAsset);
			} else {
				throwException(
					createException(
						AssetNotFoundException, 
						stringParams("Cannot find handler for command \"{0}\"", command),
					)
				);
			}
			
		}
		logger("Registered {0} console command{1}", LogType.INFO, 
				consoleCommandsSize, consoleCommandsSize > 1 ? "s" : "");
	} else {
		logger("consoleCommands.json wasn't found, but system can boot without it", LogType.WARNING);	
	}
	#endregion
	
	#region Run tests
	#endregion
	
	#region Delete old logs
	var loggerWriter = createLoggerWriter(layer);
	deleteOldLogs(loggerWriter);
	#endregion
		
	#region Load startScene
	if (isOptionalPresent(global.startScene)) {
		loadScene(global.startScene);
	} else {
		throwException(
			createException(
				RuntimeException, 
				"Start scene wasn't set", 
				runtimeExceptionHandler
			)
		);
		exit;
	}
	#endregion
	
	#endregion
	
	logger("Initialization finished. Boot time: {0} ms", LogType.INFO, (get_timer() - bootTime) / 1000);
	
	var version = "Version: " + GM_version + 
		" | Build date: " + date_datetime_string(GM_build_date) + 
		" | Runtime: " + GM_runtime_version
	logger("{0}", LogType.INFO, version);
	
	startupLogo();
	
