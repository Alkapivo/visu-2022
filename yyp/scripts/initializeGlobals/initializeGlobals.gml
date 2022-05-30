///@description Initialize global variables.
function initializeGlobals() {

	///@type {Integer}
	global.__mouseX = 0;
	#macro MouseX global.__mouseX
	
	///@type {Integer}
	global.__mouseY = 0;
	#macro MouseY global.__mouseY
	
	///@type {Integer}
	global.__previousMouseX = 0;
	#macro PreviousMouseX global.__previousMouseX
	
	///@type {Integer}
	global.__previousMouseY = 0;
	#macro PreviousMouseY global.__previousMouseY

	///@type {Boolean}
	global.isSystemInitialized = false;
		
	///@type {Boolean}
	global.isDebugMode = false;
	
	///@type {Boolean}
	global.isResolutionSet = false;
	
	///@type {Boolean}
	global.isNetworkingAvailable = false;
	
	///@type {Boolean}
	global.isFullscreen = false;
	
	///@type {Integer}	
	global.realWidth = 1024;
	#macro RealWidth global.realWidth
	
	///@type {Integer}
	global.realHeight = 768;
	#macro RealHeight global.realHeight
	
	///@type {Integer}	
	global.guiWidth = 1024;
	#macro GuiWidth global.guiWidth
	
	///@type {Integer}
	global.guiHeight = 768;
	#macro GuiHeight global.guiHeight
	
	///@type {Integer}
	global.viewWidth = 1024;
	#macro ViewWidth global.viewWidth
	
	///@type {Integer}
	global.viewHeight = 768;
	#macro ViewHeight global.viewHeight
			
	///@type {Boolean}
	global.isMobileTarget = isHtml5() ? 
		jsUtilIsMobile() != "undefined" :
		(os_type == os_android || os_type == os_ios);	
	global.isMobileTarget = false;
	
	///@type {Boolean}
	global.isLoggerEnabled = true;
	
	///@type {Map<String::String>}
	global.properties = createMap();
	

	///@type {Map<String::AssetScript>}
	global.consoleCommands = createMap();
	
	///@type {Optional<String[]>}
	global.consoleTrace = createEmptyOptional();
	
	///@type {Queue<String>}
	global.loggerQueue = createQueue();
	
	///@type {Optional<String>}
	global.loggerFileName = null;
	
	///@type {Optional<String>}
	global.loggerFilePath = null;
	
	///@type {Stack<SystemEvent>}
	global.systemEventPipeline = generatePipeline("systemEventPipeline", Queue, SystemEvent);
	
	///@type {Optional<Exception>}
	global.throwedException = createEmptyOptional();
	
	///@type {String}
	global.gameSessionUUID = generateUUID();
		
	///@type {Map<Class<?Entity>::String}
	global.entityNames = createMap();
	
	///@type {Map<Class<?Entity>::Map<String::String>>}
	global.entityFields = createMap();
	
	///@type {KeyboardKeyType[]}
	global.keyboardKeyTypeArray = [
		KeyboardKeyType.KEY_UP,
		KeyboardKeyType.KEY_DOWN,
		KeyboardKeyType.KEY_LEFT,
		KeyboardKeyType.KEY_RIGHT,
		KeyboardKeyType.KEY_W,
		KeyboardKeyType.KEY_A,
		KeyboardKeyType.KEY_S,
		KeyboardKeyType.KEY_D,
		KeyboardKeyType.KEY_SPACE,
		KeyboardKeyType.KEY_Z,
		KeyboardKeyType.KEY_E
	]
	
	///@type {Map<String::AssetRoom>}
	global.scenes = createMap(
		createTuple("SceneBoot", SceneBoot),
		createTuple("SceneRuntimeException", SceneRuntimeException)
	);
	
	///@type {Optional<AssetRoom>}
	global.startScene = createEmptyOptional();
	
	///@type {String}
	global.loggerWriterFilename = "";
	
	///@type {Optional<T?Controller>}
	global.sceneController = createEmptyOptional();
	
	///@type {Optional<T?Renderer>}
	global.sceneRenderer = createEmptyOptional();
	
	///@type {Optional<T?Camera>}
	global.sceneCamera = createEmptyOptional();
	
	///@type {Optional<T?AudioManager>}
	global.sceneAudioManagerContext = createEmptyOptional();
	
	///@type {Number}
	global.cameraSmoothFactor = 0.0;
	
	///@type {Map<String::AssetShader>}
	global.__assetShader = createMap(
		createTuple(
			"shaderUpscalingBicubic", 
			shaderUpscalingBicubic
		),
		createTuple(
		    "shaderUpscalingHQ4X", 
		    shaderUpscalingHQ4X
		),
		createTuple(
		    "shaderBlendModeAdd", 
		    shaderBlendModeAdd
		),
		createTuple(
		    "shaderDefault", 
		    shaderDefault
		),
		createTuple(
		    "shaderHue", 
		    shaderHue
		),
		createTuple(
		    "shaderLUT", 
		    shaderLUT
		),
		createTuple(
		    "shaderTransparentMask", 
		    shaderTransparentMask
		),
		createTuple(
		    "shaderWave", 
		    shaderWave
		),
		createTuple(
		    "shaderAbberation", 
		    shaderAbberation
		),
		createTuple(
		    "shaderCRT", 
		    shaderCRT
		),
		createTuple(
		    "shaderEmboss", 
		    shaderEmboss
		),
		createTuple(
		    "shaderLED", 
		    shaderLED
		),
		createTuple(
		    "shaderMagnify", 
		    shaderMagnify
		),
		createTuple(
		    "shaderMosaic", 
		    shaderMosaic
		),
		createTuple(
		    "shaderPosterization", 
		    shaderPosterization
		),
		createTuple(
		    "shaderRevert", 
		    shaderRevert
		),
		createTuple(
		    "shaderRipple", 
		    shaderRipple
		),
		createTuple(
		    "shaderScanlines", 
		    shaderScanlines
		),
		createTuple(
		    "shaderShockWave", 
		    shaderShockWave
		),
		createTuple(
		    "shaderSketch", 
		    shaderSketch
		),
		createTuple(
		    "shaderThermal", 
		    shaderThermal
		)
	);

	///@type {Map<String::LangPack>}
	global.langPacks = createMap();
	#macro LangPacks global.langPacks
	
	///@type {String}
	global.langCode = "en_EN";
	#macro LangCode global.langCode
	
	///@type {Boolean}
	global.__IsTextureLinearInterpolationEnabled = false;
	#macro IsTextureLinearInterpolationEnabled global.__IsTextureLinearInterpolationEnabled

	#region ParticleEmitterShapeDictionary
	///@type {Map<String::ParticleEmitterShape>}
	global.__ParticleEmitterShapeDictionary = createMap(
		createTuple(
			"rectangle",
			ps_shape_rectangle
		),
		createTuple(
			"ellipse",
			ps_shape_ellipse
		),
		createTuple(
			"diamond",
			ps_shape_diamond
		),
		createTuple(
			"line",
			ps_shape_line
		)
	);
	
	#macro ParticleEmitterShapeDictionary global.__ParticleEmitterShapeDictionary
	#endregion
	
	#region ParticleEmitterDistributionDictionary
	global.__ParticleEmitterDistributionDictionary = createMap(
		createTuple(
			"linear",
			ParticleEmitterDistribution_LINEAR
		),
		createTuple(
			"gaussian",
			ParticleEmitterDistribution_GAUSSIAN
		),
		createTuple(
			"inverted-gaussian",
			ParticleEmitterDistribution_INVERTED_GAUSSIAN
		)
	);
	
	#macro ParticleEmitterDistributionDictionary global.__ParticleEmitterDistributionDictionary
	#endregion
	
	#region Repository
	global.managerPrototypeRepository = createRepository("managerPrototypeRepository", "ManagerPrototype", createMap());
	
	#endregion
	
	#region Resolutions
	var jsonString = readStringFromFile(working_directory + "system", "screen.json");
	global.__resolutions = deserializeResolutions(jsonString);
	#endregion
	
	#region MatchingResolution
	
	global.__matchingResolution = null;
	#macro MatchingResolution global.__matchingResolution
	#endregion
	
	#region SupportedResolutions
	
	global.__supportedResolutions = [];
	#macro SupportedResolutions global.__supportedResolutions
	var displayWidth = display_get_width();
	var displayHeight = display_get_height();
	var resolutions = getResolutionsData(global.__resolutions);
	var resolutionsLength = getArrayLength(resolutions);
	for (var index = 0; index < resolutionsLength; index++) {
	
		var resolution = resolutions[@ index];
		var resolutionWidth = getResolutionRealWidth(resolution);
		var resolutionHeight = getResolutionRealHeight(resolution);
		
		if ((resolutionWidth <= displayWidth) &&
			(resolutionHeight <= displayHeight)) {
		
			pushArray(SupportedResolutions, resolution);	
		}
	}
	
	#region Find first matching resolution
	var resolutionsLength = getArrayLength(SupportedResolutions);
	var matchingResolution = null;
	for (var index = resolutionsLength - 1; index >= 0; index--) {
	
		var resolution = resolutions[@ index];
		if ((resolutionWidth <= displayWidth) &&
			(resolutionHeight <= displayHeight)) {
		
			matchingResolution = resolution;
			break;
		}
	}
	
	if (!isEntity(matchingResolution, Resolution)) {
	
		matchingResolution = getValueFromArray(SupportedResolutions, 0, createResolution("1024s768", 1024, 768, 1024, 768, 1024, 768));
	}
	
	MatchingResolution = matchingResolution;
	#endregion
	
	#endregion
	
	#region ResolutionIntent
	global.__resolutionIntent = null;
	#macro ResolutionIntent global.__resolutionIntent
	#endregion
	
	#region CurrentResolution
	
	global.__CurrentResolution = cloneEntity(MatchingResolution);
	#macro CurrentResolution global.__CurrentResolution
	
	#endregion
	
	
	global.__core_JSON = {
	
		decode: function(value) {
			return json_decode(value);
		},
		stringify: function(value) {
			return isDataStructure(value, Map) ?
				json_encode(value) :
				json_stringify(value);
		}
	}
	global.__core_File = {
	
		write: function(data) {
			
			if (data.withDialog) {
				
				writeStringToFileDialog(data.text, data.filename, structVariableExists(data, "extension") ? getStructVariable(data, "extension") : "");
			} else {
			
				writeStringToFile(data.text, data.filename);
			}
		},
		read: function(data) {
		
			if (data.withDialog) {
				
				return readStringFromFileDialog();
			} else {
			
				return readStringFromFile(working_directory + data.path, data.filename);
			}
		}
	}
	global.__core_Collections = {
		
		_Array: {
			push: function(array, value) {
				return pushArray(array, value)
			},
			size: function(array) {
				return getArrayLength(array);
			},
			getRandom: function(array) {
				return getRandomValueFromArray(array);
			}
		},
		_List: {
			get: function(list, index) {
				return getFromList(list, index);
			},
			size: function(list) {
				return getListSize(list);
			},
			remove: function(list, index) {
				return deleteFromList(list, index);
			},
			pop: function(list) {
			
				var value = getFromList(list, getListSize(list) - 1);
				Core.Collections._List.remove(list, getListSize(list) - 1);
				return value;
			}
			
		},
		_Queue: {
			getTail: function(queue) {
				return getTailOfQueue(queue);
			}
		},
		_Map: {
			get: function(map, key) {
				return getFromMap(map, key);
			},
			clone: function(map) {
				return cloneMap(map);
			},
			remove: function(map, key) {
				removeFromMap(map, key);
			},
			toStruct: function(map) {
			
				var struct = {};
				var keys = getMapKeys(map);
				for (var index = 0; index < getArrayLength(keys); index++) {
				
					var key = keys[index];
					setStructVariable(struct, key, getFromMap(map, key))
				}
				return struct;
			},
			free: function(map) {
				destroyDataStructure(map, Map);
			}
		}
	}
	global.__PackageManager__ = {
		
		applyPackage: function(package, config) {
	
			try {
				///@todo implement lambdas in Core
				var size = Core.Collections._Array.size(package.textures);
				for (var index = 0; index < size; index++) {
			
					var texturePackage = package.textures[index];
					texturePackage.name = getAssetIndex(texturePackage.texture, AssetIndex, asset_texture_empty);
				}
			} catch (exception) {
				logger(exception.message, LogType.ERROR);
				printStackTrace();
			}
		}
	}
	
	global.__core = {
	
		JSON: global.__core_JSON,
		File: global.__core_File,
		Collections: global.__core_Collections,
		PackageManager: global.__PackageManager__
	}
	#macro Core global.__core
}


function effectSetScreensTarget(screens) {
	
	logger("Set screens: {0}", LogType.INFO, screens);
	setScreensTarget(screens);
}

