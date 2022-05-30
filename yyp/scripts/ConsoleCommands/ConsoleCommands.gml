///@export consoleCommandClear(String[])
///@export consoleCommandDebugOverlay(String[])
///@export consoleCommandFullscreen(String[])
///@export consoleCommandGetWorkingDirectory(String[])
///@export consoleCommandList(String[])
///@export consoleCommandMove(String[])
///@export consoleCommandQuit(String[])
///@export consoleCommandRestart(String[])
///@export consoleCommandSay(String[])
///@export consoleCommandVersion(String[])

///@param {String[]} parameters
function consoleCommandClear(parameters) {
	
	clearConsoleStack(getConsole());
}

///@param {String[]} parameters
function consoleCommandDebugOverlay(parameters) {
	
	var parametersLength = parameters != null ? getArrayLength(parameters) : 0;
	if (parameters == null) || (parametersLength != 1) {
		
		addLogToConsoleStack(getConsole(), "Usage: debug_overlay [ { enable, true, 1 } | { disable, false, 0 } ]");
	} else {
		
		var parameter = string(string_lower(parameters[0]));
		var enableDebugOverlay = false;
		switch (parameter) {
			
			case "enable":
			case "true":
			case "1":
			
				enableDebugOverlay = true;
				break;
			
			case "disable":
			case "false":
			case "0":
			
				enableDebugOverlay = false;
				break;
			
			default:
				addLogToConsoleStack(getConsole(), "Unrecognized parameter " + string(parameters[0]));
				break;
		}
		
		global.isDebugMode = enableDebugOverlay;
		show_debug_overlay(enableDebugOverlay);
		logger("Debug overlay {0}", LogType.INFO, enableDebugOverlay == "true" ? "enabled" : "disabled");
		
		var settingsRepository = getSettingsRepository();
		if (settingsRepository != null) {
			
			var settings = findInRepositoryById(settingsRepository, "system");
			var attributes = getSettingsAttributes(settings);
			attributes[? "enableDebugOverlay"] = enableDebugOverlay ? "true" : "false";
			saveSettingsRepository();
		}
		
		logger("{0}", LogType.WARNING, getWorldName(getCurrentWorld()));
	}
}

///@param {String[]} parameters
function consoleCommandFullscreen(parameters) {

	var isFullscreen = window_get_fullscreen();
	window_set_fullscreen(!isFullscreen);
	global.isFullscreen = !isFullscreen;
	
	var settingsRepository = getSettingsRepository();
	if (settingsRepository != null) {
		
		var settings = findInRepositoryById(settingsRepository, "view");
		var attributes = getSettingsAttributes(settings);
		attributes[? "fullscreen"] = window_get_fullscreen() ? "true" : "false";
		saveSettingsRepository();
	}
}

///@param {String[]} parameters
function consoleCommandGetWorkingDirectory(parameters) {

	var log = string(working_directory) + "\nWorking directory copied to clipboard.";
	clipboard_set_text(log);
				
	addLogToConsoleStack(getConsole(), log);
}

///@param {String[]} parameters
function consoleCommandList(parameters) {

	var parametersLength = parameters != null ? getArrayLength(parameters) : 0;
	if (parameters == null) || (parametersLength != 1) {
		
		addLogToConsoleStack(getConsole(), "Usage: list [ commands ]");
	} else {
		
		var parameter = string(string_lower(parameters[0]));
		switch (parameter) {
			
			case "commands":
			
				var sortedList = createList();
				for (var key = mapFirst(global.consoleCommands); iteratorFinish(key); key = mapNext(global.consoleCommands, key)) {
					addToList(sortedList, key);
				}
				
				sortList(sortedList, true)
				for (var index = 0; index < getListSize(sortedList); index++) {
					addLogToConsoleStack(getConsole(), sortedList[| index]);	
				}
				
				destroyDataStructure(sortedList, List, "Unable to destroy sorted commands list");
				break;
			default:
			
				addLogToConsoleStack(getConsole(), "Unrecognized parameter " + string(parameters[0]));
				break;
		}
	}
}

///@param {String[]} parameters
function consoleCommandMove(parameters) {

	var parametersLength = parameters != null ? getArrayLength(parameters) : 0;
	var log = "";
	if ((parameters == null) || (parametersLength != 2)) {
		
		log = "Usage: move <x coordinate> <y coordinate>";
	} else {
		
		var xCoord = parameters[0];
		var yCoord = parameters[1];
		if ((!isUndefined(xCoord)) && (string_digits(xCoord) != "") &&
			(!isUndefined(xCoord)) && (string_digits(xCoord) != "")) {
			
			var camera = getCamera();
			if (camera != null) {
				
				camera.cameraXPosition = real(xCoord) * 32;
				camera.cameraYPosition = real(yCoord) * 32;
				if (camera.cameraTarget != null) {
					
					camera.cameraTarget.x = camera.cameraXPosition;
					camera.cameraTarget.y = camera.cameraYPosition;
				}
			}
		}
	}
	
	addLogToConsoleStack(getConsole(), log);
}

///@param {String[]} parameters
function consoleCommandQuit(parameters) {
	
	game_end();
}

///@param {String[]} parameters
function consoleCommandRestart(parameters) {
	
	audio_stop_all();
	var loadingIntent = createLoadingIntent(SceneGame, createEmptyOptional());
	sendLoadingIntent(loadingIntent);
}

///@param {String[]} parameters
function consoleCommandSay(parameters) {
	
	var parametersLength = parameters != null ? getArrayLength(parameters) : 0;
	var log = "";
	if (parameters == null) {
		
		log = "Usage: say <text>";
	} else {
		
		for (var index = 0; index < parametersLength; index++) {
			
			log += parameters[index] + " ";
		}
	}

	if (global.isNetworkingAvailable) {
		
		sendMessage(log);
	} else {
		
		addLogToConsoleStack(getConsole(), log);		
	}
}

///@param {String[]} parameters
function consoleCommandVersion(parameters) {
	
	var log = "com.devhorizon.spaace-loader::" + GM_version + 
		" | GMS runtime v" + GM_runtime_version + 
		" | Build date " + date_datetime_string(GM_build_date);
				
	addLogToConsoleStack(getConsole(), log);
}

function consoleCommandSetGlobal(parameters) {

	if (!isArray(parameters)) {
	
		return;
	}
	
	if (getArrayLength(parameters) < 2) {
		
		return;
	}
	
	var globalName = parameters[0];
	var value = parameters[1];
	
	setGlobalVariable(globalName, value);
	logger("global.{0}: {1}", LogType.INFO, globalName, value); 
}