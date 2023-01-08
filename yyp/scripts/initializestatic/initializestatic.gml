///@function initializeContexts()
///@description Define all global contextes.
function initializeContexts() {

       #region Core
       global.cameraContext = null;
       global.consoleContext = null;
       global.deltaTimeContext = null;
       global.systemContext = null;
       global.loggerWriterContext = null;
       global.systemContext = null;
       #endregion
       
       #region Controller
       global.sceneControllerContext = null;
       #endregion
       
       #region Manager
       global.networkManagerContext = null;
       global.windowManagerContext = null;
       global.resourceManagerContext = null; 
	   global.particleManagerContext = null;
       #endregion
       
       #region Renderer
       global.sceneRendererContext = null;
       #endregion
       
}

///@function initializeEntities()
function initializeEntities() {

	#macro ArrayMap 100190
		global.entityPrototypes[? ArrayMap] = 2;
		global.entityClassNames[? ArrayMap] = "ArrayMap";

	#macro Tuple 100191
		global.entityPrototypes[? Tuple] = 2;
		global.entityClassNames[? Tuple] = "Tuple";

	#macro PackageConfig 100201
		global.entityPrototypes[? PackageConfig] = 4;
		global.entityClassNames[? PackageConfig] = "PackageConfig";
	

	#macro PackageConfigs 100202
		global.entityPrototypes[? PackageConfigs] = 1;
		global.entityClassNames[? PackageConfigs] = "PackageConfigs";
	

	#macro ConsoleCommandConfig 100203
		global.entityPrototypes[? ConsoleCommandConfig] = 2;
		global.entityClassNames[? ConsoleCommandConfig] = "ConsoleCommandConfig";
	

	#macro ConsoleCommandConfigs 100204
		global.entityPrototypes[? ConsoleCommandConfigs] = 1;
		global.entityClassNames[? ConsoleCommandConfigs] = "ConsoleCommandConfigs";
	

	#macro Color 100205
		global.entityPrototypes[? Color] = 4;
		global.entityClassNames[? Color] = "Color";
	

	#macro Position 100206
		global.entityPrototypes[? Position] = 2;
		global.entityClassNames[? Position] = "Position";
	

	#macro LayerGroup 100207
		global.entityPrototypes[? LayerGroup] = 2;
		global.entityClassNames[? LayerGroup] = "LayerGroup";
	

	#macro Sprite 100208
		global.entityPrototypes[? Sprite] = 7;
		global.entityClassNames[? Sprite] = "Sprite";
	

	#macro StripTexture 100209
		global.entityPrototypes[? StripTexture] = 4;
		global.entityClassNames[? StripTexture] = "StripTexture";
	

	#macro VertexBufferPack 100210
		global.entityPrototypes[? VertexBufferPack] = 3;
		global.entityClassNames[? VertexBufferPack] = "VertexBufferPack";
	

	#macro GenericEntity 100211
		global.entityPrototypes[? GenericEntity] = 2;
		global.entityClassNames[? GenericEntity] = "GenericEntity";
	

	#macro GenericEntityCollection 100212
		global.entityPrototypes[? GenericEntityCollection] = 3;
		global.entityClassNames[? GenericEntityCollection] = "GenericEntityCollection";
	

	#macro KeyState 100213
		global.entityPrototypes[? KeyState] = 3;
		global.entityClassNames[? KeyState] = "KeyState";
	

	#macro NetResponse 100214
		global.entityPrototypes[? NetResponse] = 2;
		global.entityClassNames[? NetResponse] = "NetResponse";
	
	
	#macro Rectangle 100216
		global.entityPrototypes[? Rectangle] = 4;
		global.entityClassNames[? Rectangle] = "Rectangle";
	

	#macro ResizeStrategy 100217
		global.entityPrototypes[? ResizeStrategy] = 6;
		global.entityClassNames[? ResizeStrategy] = "ResizeStrategy";
	

	#macro Repository 100218
		global.entityPrototypes[? Repository] = 3;
		global.entityClassNames[? Repository] = "Repository";
	

	#macro Settings 100219
		global.entityPrototypes[? Settings] = 2;
		global.entityClassNames[? Settings] = "Settings";
	

	#macro Theme 100220
		global.entityPrototypes[? Theme] = 2;
		global.entityClassNames[? Theme] = "Theme";
	

	#macro ColorTransformTask 100221
		global.entityPrototypes[? ColorTransformTask] = 3;
		global.entityClassNames[? ColorTransformTask] = "ColorTransformTask";
	

	#macro ConsoleCommand 100222
		global.entityPrototypes[? ConsoleCommand] = 2;
		global.entityClassNames[? ConsoleCommand] = "ConsoleCommand";
	

	#macro Exception 100223
		global.entityPrototypes[? Exception] = 3;
		global.entityClassNames[? Exception] = "Exception";
	

	#macro FieldModifierTask 100224
		global.entityPrototypes[? FieldModifierTask] = 6;
		global.entityClassNames[? FieldModifierTask] = "FieldModifierTask";
	

	#macro Listener 100225
		global.entityPrototypes[? Listener] = 3;
		global.entityClassNames[? Listener] = "Listener";
	

	#macro LoadingIntent 100226
		global.entityPrototypes[? LoadingIntent] = 2;
		global.entityClassNames[? LoadingIntent] = "LoadingIntent";
	

	#macro LoadingStage 100227
		global.entityPrototypes[? LoadingStage] = 3;
		global.entityClassNames[? LoadingStage] = "LoadingStage";
	

	#macro SystemEvent 100228
		global.entityPrototypes[? SystemEvent] = 3;
		global.entityClassNames[? SystemEvent] = "SystemEvent";
	

	#macro ResourcePack 100229
		global.entityPrototypes[? ResourcePack] = 3;
		global.entityClassNames[? ResourcePack] = "ResourcePack";
	

	#macro ResourcePackEntry 100230
		global.entityPrototypes[? ResourcePackEntry] = 3;
		global.entityClassNames[? ResourcePackEntry] = "ResourcePackEntry";
	

	#macro TiledLayer 100231
		global.entityPrototypes[? TiledLayer] = 12;
		global.entityClassNames[? TiledLayer] = "TiledLayer";
	

	#macro TiledMap 100232
		global.entityPrototypes[? TiledMap] = 7;
		global.entityClassNames[? TiledMap] = "TiledMap";
	

	#macro TiledObject 100233
		global.entityPrototypes[? TiledObject] = 6;
		global.entityClassNames[? TiledObject] = "TiledObject";
	

	#macro VertexBufferGroup 100234
		global.entityPrototypes[? VertexBufferGroup] = 3;
		global.entityClassNames[? VertexBufferGroup] = "VertexBufferGroup";
	

	#macro VertexObjectBuffer 100235
		global.entityPrototypes[? VertexObjectBuffer] = 3;
		global.entityClassNames[? VertexObjectBuffer] = "VertexObjectBuffer";
	

	#macro MouseEvent 100236
		global.entityPrototypes[? MouseEvent] = 3;
		global.entityClassNames[? MouseEvent] = "MouseEvent";
	

	#macro Margin 100237
		global.entityPrototypes[? Margin] = 4;
		global.entityClassNames[? Margin] = "Margin";
	

	#macro WindowGridValue 100238
		global.entityPrototypes[? WindowGridValue] = 3;
		global.entityClassNames[? WindowGridValue] = "WindowGridValue";
	

	#macro LinkedListNode 100239
		global.entityPrototypes[? LinkedListNode] = 3;
		global.entityClassNames[? LinkedListNode] = "LinkedListNode";
	

	#macro Pipeline 100240
		global.entityPrototypes[? Pipeline] = 4;
		global.entityClassNames[? Pipeline] = "Pipeline";
	

	#macro Reactor 100241
		global.entityPrototypes[? Reactor] = 6;
		global.entityClassNames[? Reactor] = "Reactor";
	
	#macro Resolution 100201
	global.entityPrototypes[? Resolution] = 7;
	global.entityClassNames[? Resolution] = "Resolution";
	

	#macro Resolutions 100202
	global.entityPrototypes[? Resolutions] = 1;
	global.entityClassNames[? Resolutions] = "Resolutions";
	

	#macro AudioEvent 100203
	global.entityPrototypes[? AudioEvent] = 4;
	global.entityClassNames[? AudioEvent] = "AudioEvent";
	

	#macro AudioContext 100204
	global.entityPrototypes[? AudioContext] = 4;
	global.entityClassNames[? AudioContext] = "AudioContext";
	

	#macro GenericEvent 100205
	global.entityPrototypes[? GenericEvent] = 3;
	global.entityClassNames[? GenericEvent] = "GenericEvent";
	

	#macro GenericTask 100288 //@cloneEntityBug
	global.entityPrototypes[? GenericTask] = 3;
	global.entityClassNames[? GenericTask] = "GenericTask";
	

	#macro MethodIntent 100207
	global.entityPrototypes[? MethodIntent] = 5;
	global.entityClassNames[? MethodIntent] = "MethodIntent";
	

	#macro ManagerPrototype 100208
	global.entityPrototypes[? ManagerPrototype] = 6;
	global.entityClassNames[? ManagerPrototype] = "ManagerPrototype";
	
	#macro FieldModifier 100209
	global.entityPrototypes[? FieldModifier] = 4;
	global.entityClassNames[? FieldModifier] = "FieldModifier";


}

///@function initializeEnums()
///@description Contains defined enums.
function initializeEnums() {
	
		enum LogType {
			INFO = 0,
			WARNING = 1,
			ERROR = 2,
			DEBUG = 3,
			NETWORK_MESSAGE = 4,
		}
	
		enum JsonDecoderType {
			GMJSON = 100,
			TJSON = 200
		}
	
		enum JsonEntityType {
			OBJECT = 0,
			ARRAY = 1
		}

		enum Direction {
			UP = 90,
			UP_RIGHT = 45,
			RIGHT = 0,
			DOWN_RIGHT = 315,
			DOWN = 270,
			DOWN_LEFT = 225,
			LEFT = 180,
			UP_LEFT = 135
		}
	
		enum RendererResizeState {
			IDLE = 0,
			REQUIRED = 1,
			RESIZED = 2,
		}
	
		enum CompareMethod {
			EQUAL = 0,
			NOT_EQUAL = 1
		}
		
		enum LoadingHandlerState {
			IDLE = 0,
			INITIALIZE = 1,
			EXECUTE = 2,
			FINISH = 3
		}

		enum MouseEventType {
			CLICK = 0,
			WHEEL_UP = 1,
			WHEEL_DOWN = 2
		}
	
		enum WindowState {
			IDLE = 0,
			DRAG = 1,
			RESIZE = 2,
			SCROLL_VERTICAL = 3,
			SCROLL_HORIZONTAL = 4,
			SCROLL_BUTTON_VERTICAL = 5,
			SCROLL_BUTTON_HORIZONTAL = 6
		}
	
		enum WindowLayoutType {
			COLUMNS = 0,
			GRID = 1,
			FREE = 2,
		}
	
		enum WindowGridValueType {
			TEXT = 0,
			RECTANGLE = 1,
			NOONE = 2
		}

		enum NetEvent {
		    COMMAND = 0,
		    CONNECT = -1,
		    DISCONNECT = -2,
		    CONNECT_FAIL = -3,
		    UNKNOWN = -4
		}

		enum KeyboardKeyType {
			KEY_UP = vk_up,
			KEY_DOWN = vk_down,
			KEY_LEFT = vk_left,
			KEY_RIGHT = vk_right,
			KEY_W = ord("W"),
			KEY_A = ord("A"),
			KEY_S = ord("S"),
			KEY_D = ord("D"),
			KEY_SPACE = vk_space,
			KEY_Z = ord("Z"),
			KEY_E = ord("E"),
			KEY_X = ord("X"),
			KEY_SHIFT = vk_shift
		}
	
		enum VirtualJoystickState {
			START = 0,
			RUNNING = 1,
			DISABLED = 2
		}
	
		enum ScreenOrientation {
			VERTICAL = 0,
			HORIZONTAL = 1
		}
	
		enum StorageType {
			LOCAL,
			WEB_LOCAL_STORAGE
		}
	
	#region PipelineType
	#macro PipelineType_STACK Stack
	#macro PipelineType_QUEUE Queue
	
		global.__PipelineTypeFields = [
			PipelineType_STACK,
			PipelineType_QUEUE
		]
	
	#macro PipelineTypeFields global.__PipelineTypeFields
	#endregion
	
	#region ReactorType
	#macro ReactorType_LIST List
	#macro ReactorType_MAP Map
	
		global.__ReactorTypeFields = [
			ReactorType_LIST,
			ReactorType_MAP
		]
	
	#macro ReactorTypeFields global.__ReactorTypeFields
	#endregion
	
	#region SystemEventType
	#macro SystemEventType_LOADING_INTENT "loading-intent"
	#macro SystemEventType_QUIT "quit"
	
		global.__SystemEventTypeFields = [
			SystemEventType_LOADING_INTENT,
			SystemEventType_QUIT
		]
	#macro SystemEventTypeFields global.__SystemEventTypeFields
	#endregion
	
	#region ParticleEmitterShape
	#macro ParticleEmitterShape_RECTANGLE ps_shape_rectangle
	#macro ParticleEmitterShape_ELLIPSE ps_shape_ellipse
	#macro ParticleEmitterShape_DIAMOND ps_shape_diamond
	#macro ParticleEmitterShape_LINE ps_shape_line
	
		global.__ParticleEmitterShapeFields = [
			ParticleEmitterShape_RECTANGLE,
			ParticleEmitterShape_ELLIPSE,
			ParticleEmitterShape_DIAMOND,
			ParticleEmitterShape_LINE
		];
	#macro ParticleEmitterShapeFields global.__ParticleEmitterShapeFields
	#endregion
	
	#region ParticleEmitterDistribution
	#macro ParticleEmitterDistribution_LINEAR ps_distr_linear
	#macro ParticleEmitterDistribution_GAUSSIAN ps_distr_gaussian
	#macro ParticleEmitterDistribution_INVERTED_GAUSSIAN ps_distr_invgaussian
	
		global.__ParticleEmitterDistributionFields = [
			ParticleEmitterDistribution_LINEAR,
			ParticleEmitterDistribution_GAUSSIAN,
			ParticleEmitterDistribution_INVERTED_GAUSSIAN
		];
	#macro ParticleEmitterDistributionFields global.__ParticleEmitterDistributionFields
	#endregion
}

///@function initializeExceptions()
///@description Insert exception macros here.
function initializeExceptions() {

	#macro RuntimeException "com.devhorizon.horizonengine.core.RuntimeException"
	#macro AssetNotFoundException "com.devhorizon.horizonengine.core.AssetNotFound"
	#macro ClassNotFoundException "com.devhorizon.horizonengine.lang.ClassNotFoundException"
	#macro CastException "com.devhorizon.horizonengine.lang.cast.CastException"
	#macro ScriptNotFoundException "com.devhorizon.horizonengine.lang.script.ScriptNotFoundException"
	#macro EntityImplementationNotFoundException "com.devhorizon.horizonengine.util.entity.EntityImplementationNotFoundException"
	#macro NotImplementedException "com.devhorizon.horizonengine.core.NotImplementedException"
	#macro ParseException "com.devhorizon.horizonengine.util.ParseException"
	#macro NullPointerException "com.devhorizon.horizonengine.core.NullPointerException"
	#macro UndefinedException "com.devhorizon.horizonengine.core.UndefinedException"
	#macro KeyAlreadyExistException "com.devhorizon.horizonengine.util.collection.KeyAlreadyExistException"
	#macro OutOfBoundaryException "com.devhorizon.horizonengine.util.collection.OutOfBoundaryException"
	#macro MouseManagerException "com.devhorizon.horizonengine.manager.MouseManager.MouseManagerException"
	#macro TJsonException "com.yellowafterlife.tjson"
	#macro StoreException "com.devhorizon.horizonengine.store"
	#macro InvalidClassException "com.devhorizon.horizonengine.lang.class.InvalidClassException"
	#macro InvalidDataStructureException "com.devhorizon.horizonengine.util.collection.InvalidDataStructureException"
	#macro InvalidEntityException "com.devhorizon.horizonengine.entity.InvalidEntityException"
	#macro InstanceDoesntExistsException "com.devhorizon.horizonengine.lang.InstanceDoesntExistsException"
	#macro InvalidTypeException "com.devhorizon.horizonengine.lang.InvalidTypeException"
	#macro InvalidSizeException "com.devhorizon.horizonengine.util.collection.LinkedList.InvalidSizeException"
	#macro VertexBufferException "com.devhorizon.horizonengine.gpu.VertexBufferException" 
	#macro FieldNotFoundException "com.devhorizon.horizonengine.util.reflection.FieldNotFoundException" 
	#macro NotANumberException "com.devhorizon.horizonengine.lang.NotANumberException"
	#macro ManagerException "com.devhorizon.horizonengine.manager.ManagerException"
	#macro InjectException "com.devhorizon.horizonengine.InjectException"
	#macro EnumNotFoundException "com.devhorizon.horizonengine.lang.EnumNotFoundException"
}

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
	global.realWidth = 1280;
	#macro RealWidth global.realWidth
	
	///@type {Integer}
	global.realHeight = 720;
	#macro RealHeight global.realHeight
	
	///@type {Integer}	
	global.guiWidth = 1280;
	#macro GuiWidth global.guiWidth
	
	///@type {Integer}
	global.guiHeight = 720;
	#macro GuiHeight global.guiHeight
	
	///@type {Integer}
	global.viewWidth = 1280;
	#macro ViewWidth global.viewWidth
	
	///@type {Integer}
	global.viewHeight = 720;
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
		KeyboardKeyType.KEY_E,
		KeyboardKeyType.KEY_X,
		KeyboardKeyType.KEY_SHIFT
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
	global.__IsTextureLinearInterpolationEnabled = true;
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
	
		matchingResolution = getValueFromArray(SupportedResolutions, 0, createResolution("1280x720", 1280, 720, 1280, 720, 1280, 720));
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
	
	global.__soundInstanceId = null;
	
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
		
		Arrays: {
			push: function(array, value) {
				return pushArray(array, value)
			},
			size: function(array) {
				return getArrayLength(array);
			},
			getRandomValue: function(array) {
				return getRandomValueFromArray(array);
			},
			getRandomIndex: function(array) {
				return getRandomIndexFromArray(array);
			},
			contains: function(array, value) {
				return arrayContain(array, value);
			}
		},
		Lists: {
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
				Core.Collections.Lists.remove(list, getListSize(list) - 1);
				return value;
			},
			toArray: function(list) {
				return convertListToArray(list);
			},
			forEach: function(list, handler, data = null) {
				var size = Core.Collections.Lists.size(list)
				for (var index = 0; index < size; index++) {
					var element = Core.Collections.Lists.get(list, index);
					handler(element, data);
				}
			},
			create: createList
		},
		Queues: {
			getTail: function(queue) {
				return getTailOfQueue(queue);
			}
		},
		Maps: {
			get: function(map, key) {
				return getFromMap(map, key);
			},
			getDefault: function(map, key, defaultValue) {
				
				var result = getFromMap(map, key);
				if (!isOptionalPresent(result)) {
					
					result = defaultValue;
				}
				return result;
			},
			set: function(map, key, value) {
				setInMap(map, key, value)	
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
					var value = getFromMap(map, key);
					setStructVariable(struct, key, value)
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
				var size = Core.Collections.Arrays.size(package.textures);
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
		Assets: {
			Texture: {
				getWidth: sprite_get_width,
				getHeight: sprite_get_height,
				fetch: function(name) {
					return getAssetIndex(name, AssetTexture, asset_texture_empty)
				},
			},
			Font: {
				fetch: function(name) {
					return getAssetIndex(name, AssetFont, asset_font_default);	
				}
			},
		},
		Structs: {
			get: function(struct, name, defaultValue = null) {
				return getValueFromStruct(struct, name, defaultValue);
			},
			contains: structVariableExists,
			is: isSurfaceValid,
			getFields: getStructVariableNames,
		},
		Numbers: {
			isBetween: isNumberInRange,
		},
		Surfaces: {
			create: createSurface,
			get: getSurface,
			getWidth: surface_get_width,
			getHeight: surface_get_height,
			is: isSurfaceValid,
			render: renderSurface,
			renderToSurface: function(surface, handler, data = null) {
				
				if (Core.Surfaces.getTarget(surface) != -1) {
					throw "Surface cannot be rendered, because target wasn't reseted"
				}
				
				Core.Surfaces.setTarget(surface);
				handler(surface, data);
				Core.Surfaces.resetTarget(surface);
			},
			setTarget: gpuSetSurfaceTarget,
			getTarget: surface_get_target,
			resetTarget: gpuResetSurfaceTarget,
		},
		Sprites: {
			render: drawSprite,
		},
		GPU: {
			renderClearColor: function(color, alpha = 1.0) {
				draw_clear_alpha(color, alpha);
			},
			setConfig: function(config = {}) {
				if (Core.Structs.contains(config, "font")) {
					draw_set_font(config.font);
				}
				
				if (Core.Structs.contains(config, "horizontalAlign")) {
					draw_set_halign(config.horizontalAlign);
				}
				
				if (Core.Structs.contains(config, "verticalAlign")) {
					draw_set_valign(config.verticalAlign);
				}
			},
		},
		Fonts: {
			Render: {
				text: renderText,
				outlinedText: renderTextOutline,
			}
		},
		JSON: global.__core_JSON,
		File: global.__core_File,
		Collections: global.__core_Collections,
		PackageManager: global.__PackageManager__
	}
	#macro Core global.__core
}

///@function initializeMacros()
///@description Insert macros here.
function initializeMacros() {

	#region Lang
	#macro debugger var __debugger__ = "breakpoint"
	#macro null undefined
	#macro ziobro 0.0
	#macro sasin 70000000.0
	#macro this id
	
	#endregion
	
	#region Common
	#macro GAME_FPS 60
	#macro FRAME_MS 1.0 / GAME_FPS
	#macro MAX_NUMBER 2147483647.0
	#endregion
	
	#region cast
	#macro Instance 800401
	#macro Entity 800402
	#macro Integer 800403
	#macro Number 800404
	#macro String 800405
	#macro Boolean 800406
	#macro any 800407
	#macro Primitive 800408
	#macro Collection 800409
	#macro JsonString 800410
	#macro Type 900450
	#macro Struct 90460
	#endregion
	
	#region MPGrid
	#macro MP_GRID_EMPTY 0
	#macro MP_GRID_OCCUPIED -1
	#endregion
	
	#region DataStructureType
		///@implements {IterableCollection}
	#macro Array 0
	
		///@implements {IterableCollection}
		//#macro ArrayMap is defined in entites
	
	#macro Grid ds_type_grid
	
		///@implements {IterableCollection}
	#macro List ds_type_list
	
		///@implements {IterableCollection}
	#macro Map ds_type_map
	
	#macro PriorityQueue ds_type_priority
	#macro Queue ds_type_queue
	#macro Stack ds_type_stack
	#endregion
	
	#region AssetType
	#macro AssetFont asset_font
	#macro AssetClass asset_object
	#macro AssetPath asset_path
	#macro AssetRoom asset_room
	#macro AssetScript asset_script
	#macro AssetShader asset_shader
	#macro AssetSound asset_sound
	#macro AssetTexture asset_sprite
	#macro AssetTiles asset_tiles
	#macro AssetTimeline asset_timeline
	#macro AssetUnknown asset_unknown
	#endregion
	
	#region Color
	#macro COLOR_WHITE			[ 1.0, 1.0, 1.0, 1.0 ]
	#macro COLOR_BLACK			[ 0.0, 0.0, 0.0, 1.0 ]
	#macro COLOR_RED			[ 1.0, 0.0, 0.0, 1.0 ]
	#macro COLOR_GREEN			[ 0.0, 1.0, 0.0, 1.0 ]
	#macro COLOR_BLUE			[ 0.0, 0.0, 1.0, 1.0 ]
	#macro COLOR_TRANSPARENT	[ 0.0, 0.0, 0.0, 0.0 ]
	#endregion
	
	
	#region Settings
	#macro SETTINGS_CONSOLE_REPOSITORY_ID "console"
	#endregion
	
	#macro GM_COLOR_WHITE c_white
	#macro GM_COLOR_BLACK c_black
	#macro GM_HALIGN_LEFT fa_left
	#macro GM_HALIGN_CENTER fa_center
	#macro GM_HALIGN_RIGHT fa_right
	#macro GM_VALIGN_TOP fa_top
	#macro GM_VALIGN_CENTER fa_middle
	#macro GM_VALIGN_BOTTOM fa_bottom
}

///@function initialzieManagers()
///@description Insert ManagerPrototypes here.
function initializeManagers() {

	var managers = [];
	
	for (var index = 0; index < getArrayLength(managers); index++) {
	
		var managerPrototype = managers[@ index];
		if (!isEntity(managerPrototype, ManagerPrototype)) {
		
			throwException(
				createException(
					RuntimeException,
					stringParams("Found invalid ManagerPrototype. { \"index\": {0} }", index),
					runtimeExceptionHandler
				)
			)
			continue;
		}
		
		registerManagerPrototype(managerPrototype);
		
		var exception = catchException();
		if (isOptionalPresent(exception)) {
		
			throwException(
				createException(
					RuntimeException,
					stringParams("Unable to register ManagerPrototype. { \"index\": {0} }", index),
					runtimeExceptionHandler
				)
			)
			continue;
		}
	}
}

///@function initializeProperties()
///@description Initialize global.properties.
///@throws {RuntimeException}
function initializeProperties() {

	if (isDataStructure(global.properties, Map)) {
		var propertiesString = readStringFromFile(working_directory + "system", "properties.json", StorageType.LOCAL);
		if (!isOptionalPresent(propertiesString)) {
			throwException(
				createException(
					RuntimeException, 
					"Cannot boot without properties.json", 
				runtimeExceptionHandler)
			);
			return;
		}
		
		var propertiesJson = decodeJson(propertiesString, JsonDecoderType.GMJSON);
		if (!isOptionalPresent(propertiesJson) || !isJsonObject(propertiesJson)) {
			throwException(
				createException(
					RuntimeException, 
					"Unable to parse properties.json", 
				runtimeExceptionHandler)
			);
			return;
		}
		
		var keys = getJsonObjectKeys(propertiesJson);
		for (var index = 0; index < getArrayLength(keys); index++) {
			var propertyName = keys[index];
			var propertyValue = getJsonObjectFieldValue(propertiesJson, propertyName);
			addProperty(propertyName, propertyValue);
		}		
	} else {
		throwException(
			createException(
				RuntimeException, 
				"global.properties isn't a Map<String::Object>", 
			runtimeExceptionHandler)
		);
		return;
	}

}

