///@function initializeVisuEntities()

function initializeVisuEntities() {

	#macro Boss 200201
	global.entityPrototypes[? Boss] = 3;
	global.entityClassNames[? Boss] = "Boss";
	

	#macro BossEvent 200202
	global.entityPrototypes[? BossEvent] = 1;
	global.entityClassNames[? BossEvent] = "BossEvent";
	

	#macro BossStage 200203
	global.entityPrototypes[? BossStage] = 3;
	global.entityClassNames[? BossStage] = "BossStage";
	

	#macro Bullet 200204
	global.entityPrototypes[? Bullet] = 6;
	global.entityClassNames[? Bullet] = "Bullet";
	

	#macro GameEvent 200205
	global.entityPrototypes[? GameEvent] = 3;
	global.entityClassNames[? GameEvent] = "GameEvent";
	

	#macro GridElement 200206
	global.entityPrototypes[? GridElement] = 3;
	global.entityClassNames[? GridElement] = "GridElement";
	

	#macro GridElementInfo 200207
	global.entityPrototypes[? GridElementInfo] = 4;
	global.entityClassNames[? GridElementInfo] = "GridElementInfo";
	

	#macro GridEvent 200208
	global.entityPrototypes[? GridEvent] = 1;
	global.entityClassNames[? GridEvent] = "GridEvent";
	

	#macro JumbotronEvent 200209
	global.entityPrototypes[? JumbotronEvent] = 3;
	global.entityClassNames[? JumbotronEvent] = "JumbotronEvent";
	

	#macro ParticleEvent 200210
	global.entityPrototypes[? ParticleEvent] = 2;
	global.entityClassNames[? ParticleEvent] = "ParticleEvent";
	

	#macro ParticleTask 200211
	global.entityPrototypes[? ParticleTask] = 9;
	global.entityClassNames[? ParticleTask] = "ParticleTask";
	

	#macro VisuPlayer 200212
	global.entityPrototypes[? VisuPlayer] = 8;
	global.entityClassNames[? VisuPlayer] = "VisuPlayer";
	

	#macro PlayerEvent 200213
	global.entityPrototypes[? PlayerEvent] = 1;
	global.entityClassNames[? PlayerEvent] = "PlayerEvent";
	

	#macro ShaderEvent 200214
	global.entityPrototypes[? ShaderEvent] = 3;
	global.entityClassNames[? ShaderEvent] = "ShaderEvent";
	

	#macro ShaderPipeline 200215
	global.entityPrototypes[? ShaderPipeline] = 3;
	global.entityClassNames[? ShaderPipeline] = "ShaderPipeline";
	

	#macro ShaderTask 200216
	global.entityPrototypes[? ShaderTask] = 5;
	global.entityClassNames[? ShaderTask] = "ShaderTask";
	

	#macro Shroom 200217
	global.entityPrototypes[? Shroom] = 8;
	global.entityClassNames[? Shroom] = "Shroom";
	

	#macro ShroomEmitter 200218
	global.entityPrototypes[? ShroomEmitter] = 7;
	global.entityClassNames[? ShroomEmitter] = "ShroomEmitter";
	

	#macro ShroomEmitterEvent 200219
	global.entityPrototypes[? ShroomEmitterEvent] = 4;
	global.entityClassNames[? ShroomEmitterEvent] = "ShroomEmitterEvent";
	

	#macro ShroomEvent 200220
	global.entityPrototypes[? ShroomEvent] = 1;
	global.entityClassNames[? ShroomEvent] = "ShroomEvent";
	

	#macro ShroomTemplate 200221
	global.entityPrototypes[? ShroomTemplate] = 4;
	global.entityClassNames[? ShroomTemplate] = "ShroomTemplate";
	

	#macro Star 200222
	global.entityPrototypes[? Star] = 6;
	global.entityClassNames[? Star] = "Star";
	

	#macro Timeline 200223
	global.entityPrototypes[? Timeline] = 3;
	global.entityClassNames[? Timeline] = "Timeline";
	

	#macro TimelineEntry 200224
	global.entityPrototypes[? TimelineEntry] = 2;
	global.entityClassNames[? TimelineEntry] = "TimelineEntry";
	

	#macro TimelineEvent 200225
	global.entityPrototypes[? TimelineEvent] = 2;
	global.entityClassNames[? TimelineEvent] = "TimelineEvent";
	

	#macro LyricsEvent 200226
	global.entityPrototypes[? LyricsEvent] = 3;
	global.entityClassNames[? LyricsEvent] = "LyricsEvent";
	
}

function initializeVisuContexts() {

	global.introControllerContext = null;
	global.playgroundControllerContext = null;
	global.gameControllerContext = null;

	global.audioManagerContext = null;
	global.bossManagerContext = null;
	global.bulletManagerContext = null;
	global.playerManagerContext = null;
	global.shroomManagerContext = null;
	global.shroomEmitterManagerContext = null;
	global.timelineManagerContext = null;
	global.particleManagerContext = null;

	global.gameRendererContext = null;	
	global.gridRendererContext = null;
	global.lyricsRendererContext = null;
	global.playgroundRendererContext = null;
}

function initializeVisuEnums() {

	enum GridRendererAttributes {
		TOP_LINE_WIDTH,
		TOP_LINE_POSITION,
		BOTTOM_LINE_WIDTH,
		CHANNELS,
		OFFSET_TOP,
		OFFSET_BOTTOM,
		SEPARATOR_SPEED,
		SEPARATOR_FRAME_FREQUENCY,
		PRIMARY_LINES_WIDTH,
		SECONDARY_LINES_WIDTH
	}
	
	enum PlayerStatus {
		INTRO = 0,
		READY = 1,
		OUTRO = 2
	}
	
	enum BulletProducer {
		SHROOM = 0,
		PLAYER = 1,
	}
	
	enum ShroomType {
		DEFAULT = 0,	
	}
	
	enum BossType {
		VISU = 0,
		MID = 1,
	}
	
	enum GridElementInfoType {
		DEFAULT = 0,
		SHROOM = 1,
		RAINBOW = 2,
	}
	
	enum ParticleSystems {
		BACKGROUND = 0,
		FOREGROUND = 1,
	}
	
	enum FadeTypes {
		IN = 0,
		OUT = 1,
	}
	
	enum StarsRenderTypes {
		POINT = 0,
		PARTICLE = 1
	}
	
	#region SpawnPosition
	#macro SpawnPosition_TOP "top"
	#macro SpawnPosition_RIGHT "right"
	#macro SpawnPosition_BOTTOM "bottom"
	#macro SpawnPosition_LEFT "left"
	#macro SpawnPosition_DEFAULT SpawnPosition_TOP
	
	global.__SpawnPositionFields = [
		SpawnPosition_TOP,
		SpawnPosition_RIGHT,
		SpawnPosition_BOTTOM,
		SpawnPosition_LEFT,
		SpawnPosition_DEFAULT
	];
	#macro SpawnPositionFields global.__SpawnPositionFields
	#endregion
}

function initializeVisuException() {

    ///@todo
}

function initializeVisuGlobals() {

	///@type {Number}
	global.shroomSize = 5;
	
	global.isGameplayStarted = false;
	
	global.shroomVisuSpawnHorizontalRange = createTuple(0.0, 1.0);
	#macro SHROOM_SPAWN_H_RANGE global.shroomVisuSpawnHorizontalRange
	
	global.shroomVisuSpawnVerticalRange = createTuple(0.0, 1.0);
	#macro SHROOM_SPAWN_V_RANGE global.shroomVisuSpawnVerticalRange
	
	global.shroomVisuSpawnSpeedRange = createTuple(0.003, 0.005);
	#macro SHROOM_SPEED_RANGE global.shroomVisuSpawnSpeedRange
	
	
	global.demo = false;

	///@todo Remove
	global.gameCounter = 0;
	global.gamepadId = 0;
	global.gameplayTimePrecise = 0;
	global.screensFactorValues = [ 0.001, 0.002, 0.003, 0.05, 1 ];
	global.topLinePositionFactorValues = [ 0.001, 0.002, 0.003, 0.05, 1 ];
	global.bottomLinePositionFactorValues = [ 0.001, 0.002, 0.003, 0.05, 1 ];
	
	///@todo Remove
	global.bulletAsset = asset_texture_visu_bullet_2;
	sprite_set_speed(global.bulletAsset, 10, spritespeed_framespersecond);
	
	global.__deaths = 0;
	global.__score = 0;
	
	#macro GameplayType_PLATFORMER "platformer"
	#macro GameplayType_BULLETHELL "bullethell"
	global.__GameplayTypes = [
		GameplayType_PLATFORMER,
		GameplayType_BULLETHELL
	]
	#macro GameplayTypes global.__GameplayTypes
	
	
	global.__baseScaleResolution = getPropertyReal("gameRenderer.baseScaleResolution", 2048);
	#macro BASE_SCALE_RESOLUTION global.__baseScaleResolution
	
	#region MidiMatrixController
	global.__SpawnPositionDisptacher = createMap(
		createTuple(
			SpawnPosition_TOP,
			function(template) {
				var from = getTupleKey(SHROOM_SPAWN_H_RANGE);
				var to = getTupleValue(SHROOM_SPAWN_H_RANGE);
				var width = 2.5
				var grid = getPlaygroundController().GMObject.state.grid
				var viewX = 0.25 * floor(grid.view.x / 0.25);
				var startX = viewX + (grid.view.width / 2) - width / 2.0
				var horizontalPosition = startX + width * (from + random(to - from))
				var verticalPosition = grid.view.y - 1.0
				return {
					verticalSpeed: Core.Collections.Arrays.getRandomValue(template.baseSpeed),
					horizontalSpeed: choose(0.00001, 0.0001),
					position: createPosition(
						horizontalPosition,
						verticalPosition
					)
				}
			}
		),
		createTuple(
			SpawnPosition_RIGHT,
			function(template) {
				var from = getTupleKey(SHROOM_SPAWN_V_RANGE);
				var to = getTupleValue(SHROOM_SPAWN_V_RANGE);
				var height = 2.5
				var grid = getPlaygroundController().GMObject.state.grid
				var viewY = 0.25 * floor(grid.view.y / 0.25);
				var startY = viewY + (grid.view.height / 2) - height / 2.0
				var horizontalPosition = grid.view.x + grid.view.width + 2.0
				var verticalPosition = startY + height * (from + random(to - from)) - 0.5
				return {
					verticalSpeed: choose(0.00001, 0.0001),
					horizontalSpeed:  - 1.0 * Core.Collections.Arrays.getRandomValue(template.baseSpeed),
					position: createPosition(
						horizontalPosition,
						verticalPosition
					)
				}
			}
		),
		createTuple(
			SpawnPosition_BOTTOM,
			function(template) {
				var from = getTupleKey(SHROOM_SPAWN_H_RANGE);
				var to = getTupleValue(SHROOM_SPAWN_H_RANGE);
				var width = 2.5
				var grid = getPlaygroundController().GMObject.state.grid
				var viewX = 0.25 * floor(grid.view.x / 0.25);
				var startX = viewX + (grid.view.width / 2) - width / 2.0
				var horizontalPosition = startX + width * (from + random(to - from))
				var verticalPosition = grid.view.y + grid.view.width + 1.0
				return {
					verticalSpeed: -1.0 * Core.Collections.Arrays.getRandomValue(template.baseSpeed),
					horizontalSpeed: choose(0.00001, 0.0001),
					position: createPosition(
						horizontalPosition,
						verticalPosition
					)
				}
			}
		),
		createTuple(
			SpawnPosition_LEFT,
			function(template) {
				var from = getTupleKey(SHROOM_SPAWN_V_RANGE);
				var to = getTupleValue(SHROOM_SPAWN_V_RANGE);
				var height = 2.5
				var grid = getPlaygroundController().GMObject.state.grid
				var viewY = 0.25 * floor(grid.view.y / 0.25);
				var startY = viewY + (grid.view.height / 2) - height / 2.0
				var horizontalPosition = grid.view.x - 2.0
				var verticalPosition = startY + height * (from + random(to - from)) - 0.5
				return {
					verticalSpeed: choose(0.00001, 0.0001),
					horizontalSpeed:  Core.Collections.Arrays.getRandomValue(template.baseSpeed),
					position: createPosition(
						horizontalPosition,
						verticalPosition
					)
				}
			}
		)
	);
	#macro SpawnPositionDispatcher global.__SpawnPositionDisptacher
	#endregion
}

function initializeVisuMacros() {

	
}

function initializeVisuManagers() {

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
	
function initializeVisuProperties() {

	var propertiesString = Core.File.read({ 
		path: "data", 
		filename: "properties.json", 
		withDialog: false 
	});
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
		logger("Adding property: { \"key\": \"{0}\", \"value\": \"{1}\" }", LogType.DEBUG, propertyName, propertyValue);
		addProperty(propertyName, propertyValue);
	}	
}