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
			KEY_X = ord("X")
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
