///@description Factory Method for MidiMatrixController
///@param {Map<String::Struct> config
///@return {Struct<MidiMatrixController>}
function createMidiMatrixController(config) {
	
	return {
		surface: createSurface(1, 1, true),
		keymapConfig: config,
		eventsPlayer: createEventsPlayer(),
		eventsRecorder: createEventsRecorder(),
		
		__checkButtonKeyboardMapping: function(button) {
			
			var result = false;
			var keyboardMapping = getStructVariable(button, "keyboardMapping");
			if (isArray(keyboardMapping)) {
						
				var length = getArrayLength(keyboardMapping);
				for (var index = 0; index < length; index++) {
				
					var keyboardKey = keyboardMapping[index];
					var keyCheckResult = keyboard_check_pressed(ord(keyboardKey));
					if (keyCheckResult) {
						
						result = (index == 0) ? true : (keyCheckResult && result) == true;
					} else {
					
						result = false;
						break;
					}
				}
			}
			
			return result;
		},
		
		update: function(midiController) {
			
			midiController.eventsRecorder.update(midiController.eventsRecorder);
			midiController.eventsPlayer.update(midiController.eventsPlayer, midiController.keymapConfig);
			
			for (var key = mapFirst(midiController.keymapConfig);
				 iteratorFinish(key);
				 key = mapNext(midiController.keymapConfig, key)) {
					 
				var button = midiController.keymapConfig[? key];	 
				if ((midiController.__checkButtonKeyboardMapping(button)) 
					&& (isOptionalPresent(getStructVariable(button, "pressed")))) {
					
					// asker imoiskar
					try {
						button.pressed(button, key);
					} catch (exception) {
						
						logger("\n{0}\n\n", LogType.ERROR, exception.message);
						printStackTrace();
						
						getConsole().consoleHeightAcc = getConsole().consoleHeightMax;
						getConsole().isConsoleDisplayed = true;
						keyboard_string = "";
					}
					
					var currentRecording = midiController.eventsRecorder.getCurrentRecording(midiController.eventsRecorder);
					if (isStruct(currentRecording)) {
						
						if ((key != "6x0") &&
							(key != "7x0")) {
						
							midiController.eventsRecorder.registerEvent(
								midiController.eventsRecorder, { 
									name: "MidiControllerButtonEvent", 
									data: { 
										key: key,
										timestamp: currentRecording.timer,
										log: Core.Collections.Queues.getTail(getLoggerQueue())
									}
								}	
							);
						}
					}
				}
			}
		},
		preRender: function(midiController) {
			
			var map = midiController.keymapConfig;
			var mapWidth = 8;
			var mapHeight = 8;
			var buttonSize = 8;
			var buttonMargin = 2;
			var xStart = GuiWidth - (mapWidth * (buttonSize + buttonMargin)) - 32;
			var yStart = GuiHeight - (mapHeight * (buttonSize + buttonMargin)) - 32;
			midiController.surface = getSurface(midiController.surface, GuiWidth, GuiHeight)
	
			var enableRender = true;
			gpuSetSurfaceTarget(midiController.surface)
			
				if (enableRender) {
					draw_clear_alpha(c_black, 0.0);
					draw_set_font(asset_font_ibm_ps2thin4);
					draw_set_halign(fa_left);
					draw_set_valign(fa_top);
					draw_set_alpha(0.92);
				
					for (var yIndex = 0; yIndex < mapHeight; yIndex++) {
						for (var xIndex = 0; xIndex < mapWidth; xIndex++) {
						
							var key = stringParams("{0}x{1}", xIndex, yIndex);
							var button = map[? key];
							if (!isStruct(button)) {
							
								break;
							}
						
							var keyboardMappingResult = midiController.__checkButtonKeyboardMapping(button);
							var cacheResult = getStructVariable(midiController.eventsPlayer.cache, stringParams("{0}x{1}", xIndex, yIndex));
							if (cacheResult != null) {
							
								variable_struct_remove(midiController.eventsPlayer.cache, stringParams("{0}x{1}", xIndex, yIndex));
							}
							
							var isButtonEnabled = getStructVariable(button, "isEnabled") == true;
							var color = keyboardMappingResult ? c_lime : c_fuchsia;
							color = cacheResult ? c_lime : color;
							color = isButtonEnabled ? c_orange : color;

							draw_rectangle_color(
								xStart + (xIndex * (buttonSize + buttonMargin)),
								yStart + (yIndex * (buttonSize + buttonMargin)),
								xStart + (xIndex * (buttonSize + buttonMargin)) + buttonSize,
								yStart + (yIndex * (buttonSize + buttonMargin)) + buttonSize,
								color,
								color,
								color,
								color,
								false
							)
						
							//renderText(
							//	key + "\n" + (getStructVariable(button, "isEnabled") == true ? "E" : "D"),
							//	xStart + (xIndex * (buttonSize + buttonMargin)),
							//	yStart + (yIndex * (buttonSize + buttonMargin))
							//);
						}
					}
				
					draw_set_alpha(1.00);
				}
			gpuResetSurfaceTarget()
		},
		cleanUp: function(midiController) {
		
			destroyMap(midiController.keymapConfig);
		}
	}
}

function createEventsPlayer() {

	return {
	
		recording: null,
		cache: {},
		
		play: function(eventsPlayer, eventsRecording) {
		
			try {
				eventsPlayer.recording = {
					timer: eventsRecording.audio.trackPosition,
					duration: audio_sound_length(asset_sound_visu_ost),
					events: eventsRecording.events,
					eventPointer: 0
				}
				
				var trackPosition = eventsRecording.audio.trackPosition
				var name = eventsRecording.audio.name;
				
				var sound = getAssetIndex(name, AssetSound);
				if ((isAudio(sound)) && (isNumber(trackPosition))) {
					
					fetchGameController().video = video_open("data/video.mp4");
					video_set_volume(0.0);
					if (trackPosition > 0) {
						video_pause();
						var rewindSteps = floor(trackPosition);
						repeat(rewindSteps) {
							video_seek_to(trackPosition * 1000.0);
							video_draw();
							print("VHS: ", video_get_position());
							if (video_get_position() >= trackPosition * 1000.0) {
								
								break;	
							}
						}
						video_resume();
					}
					video_enable_loop(true);
					
					audio_stop_all();
					var soundInstanceId = audio_play_sound(sound, 100, false);
					audio_sound_set_track_position(soundInstanceId, trackPosition);
					eventsPlayer.recording.duration = audio_sound_length(soundInstanceId);
					global.__soundInstanceId = soundInstanceId;
				}
				
			} catch (exception) {
				logger(exception.message, LogType.ERROR);
				printStackTrace();
			}
		},
		update: function(eventsPlayer, keymapConfig) {
					
			var recording = eventsPlayer.recording;
			if (isStruct(recording)) {
				
				//print("PLAYING");
				try {
					
					var soundInstanceId = global.__soundInstanceId;
					if ((isAudio(soundInstanceId))
						&& (audio_is_playing(soundInstanceId))) {
				
						var audioPosition = audio_sound_get_track_position(soundInstanceId);
						if (audioPosition > 0.0) {
							recording.timer = audioPosition;
						}
					}
				} catch (exception) {
				
					logger("Unable to sync with played audio. {0}", LogType.ERROR, exception.message);
				}
				recording.timer = incrementTimer(recording.timer, recording.duration);
				
				if (timerFinished(recording.timer)) {
					
					eventsPlayer.recording = null;	
					return;
				} else {
					var size = Core.Collections.Arrays.size(recording.events)
					if (size > 0) && (size > recording.eventPointer) {
				
						var event = recording.events[recording.eventPointer];
						if (recording.timer >= event.data.timestamp) {
						
							try {
								recording.eventPointer++
								global.__launchapdEvents++
								sendMidiMatrixEvent(eventsPlayer, keymapConfig, event.data.key, event.data.timestamp)
							} catch (exception) {
								logger(exception.message, LogType.ERROR);
								printStackTrace();
							}
						}
					}
				}
			}
		}
	}
}

function sendMidiMatrixEvent(eventsPlayer, keymapConfig,  key, timestamp) {
	var button = Core.Collections.Maps.get(keymapConfig, key);
	button.pressed(button, key);
								
	setStructVariable(eventsPlayer.cache, key, 1.0);
								
	var midiController = fetchGameController().midiMatrixController
	midiController.eventsRecorder.registerEvent(
		midiController.eventsRecorder, { 
			name: "MidiControllerButtonEvent", 
			data: { 
				key: key,
				timestamp: timestamp,
				log: "",
			}
		}	
	);
}

function createEventsRecorder() {

	return {
		state: createEmptyOptional(),
		
		startRecording: function(eventsRecorder) {
			
			var currentRecording = {
				timer: 0.0,
				events: [],
				audio: {
					name: getPropertyString("GameController.ost", "asset_sound_empty"),
					trackPosition: 0.0
				},
				layout: {
					name: "novation-launchpad", ///@todo mockup
					page: 0 ///@todo mockup
				}
			};
			eventsRecorder.setCurrentRecording(eventsRecorder, currentRecording)
			audio_stop_all();
			audio_play_sound(getAssetIndex(currentRecording.audio.name, AssetSound), 100, false);
			
			logger(
				"Created new recording: { audio.trackPosition: {0}, layout.name: {1} }", LogType.INFO, 
				currentRecording.audio.trackPosition, currentRecording.layout.name
			);
		},		
		stopRecording: function(eventsRecorder) {
			
			var currentRecording = eventsRecorder.getCurrentRecording(eventsRecorder);
			if (isOptionalPresent(currentRecording)) {
			
				Core.File.write({ 
					text: Core.JSON.stringify(currentRecording), 
					filename: "recording.json", 
					withDialog: true
				});
			}
			eventsRecorder.setCurrentRecording(eventsRecorder, null);
		},	
		registerEvent: function(eventsRecorder, event) {
			
			var currentRecording = eventsRecorder.getCurrentRecording(eventsRecorder);
			if (isStruct(currentRecording)) && (currentRecording.timer > 0) {
				
				currentRecording.events = Core.Collections.Arrays.push(currentRecording.events, event);
				logger("Event registered: {0}", LogType.INFO, Core.JSON.stringify(event));
			}
		},
		update: function(eventsRecorder) {
			
			
			var currentRecording = eventsRecorder.getCurrentRecording(eventsRecorder);
			if (isStruct(currentRecording)) {
				//print("RECORDING");
				currentRecording.timer = incrementTimer(currentRecording.timer, MAX_NUMBER);
			}
		},
		parseRecording: function(eventsRecorder, jsonString) {
		
			var eventsRecording = null;
			try {
				
				var jsonObject = Core.JSON.decode(jsonString);
				var timer = Core.Collections.Maps.get(jsonObject, "timer");
				setInstanceVariable(fetchGameRenderer(), "trackTimer", timer);
				var events = [];
				var jsonEvents = Core.Collections.Maps.get(jsonObject, "events");
				if (jsonEvents != null) {
					
					
					var eventsSize = Core.Collections.Lists.size(jsonEvents);
					events = createArray(eventsSize);
					for (var index = 0; index < eventsSize; index++) {
						
						var jsonEvent = Core.Collections.Lists.get(jsonEvents, index);
						var jsonEventData = Core.Collections.Maps.get(jsonEvent, "data");
						var entry = {
							name: Core.Collections.Maps.get(jsonEvent, "name"),
							data: {
								log: "",
								key: Core.Collections.Maps.get(jsonEventData, "key"),
								timestamp: Core.Collections.Maps.get(jsonEventData, "timestamp")
							}
						}
						events[index] = entry;
					}
				}
				
				var audio = {
					trackPosition: 5.0,
					name: "asset_sound_visu_ost",
				}
				
				var jsonAudio = Core.Collections.Maps.get(jsonObject, "audio");
				audio.trackPosition = Core.Collections.Maps.get(jsonAudio, "trackPosition");
				audio.name = Core.Collections.Maps.get(jsonAudio, "name");
				
				if (!isAudio(Core.Assets.Texture.fetch(audio.name))) {
				
					throw(stringParams("Audio not found: {0}", audio.name));
				}
				
				eventsRecording = {
					timer: timer,
					events: events,
					audio: audio,
					layout: {
						name: "novation-launchpad", ///@todo mockup
						page: 0 ///@todo mockup
					}
				}
				
				Core.Collections.Maps.free(jsonObject);
			} catch (exception) {
				
				logger(exception.message, LogType.ERROR);
				printStackTrace();
			}
			
			return eventsRecording;
		},
		
		getState: function(eventsRecorder) {
		
			if !isOptionalPresent(eventsRecorder.state) {
				eventsRecorder.state = {}
			}
			
			return eventsRecorder.state
		},
		getCurrentRecording: function(eventsRecorder) {
			
			return getStructVariable(eventsRecorder.getState(eventsRecorder), "currentRecording");
		},
		setCurrentRecording: function(eventsRecorder, currentRecording) {
		
			return setStructVariable(eventsRecorder.getState(eventsRecorder), "currentRecording", currentRecording);
		}
	}
}

function parseJsonLaunchpadLayout(jsonString) {

	var gmJsonObject = Core.JSON.decode(jsonString);
	
    var actionParser = function(gmJsonAction) {
        return {
            name: Core.Collections.Maps.get(gmJsonAction, "name"),
            parameters: Core.Collections.Lists.toArray(Core.Collections.Maps.get(gmJsonAction, "parameters"))
        }
    }

	var gmJsonLayout = Core.Collections.Maps.get(gmJsonObject, "layout");
    var layout = [];
    for (var index = 0; index < Core.Collections.Lists.size(gmJsonLayout); index++) {

        var entry = Core.Collections.Lists.get(gmJsonLayout, index);
        var gmJsonActions = Core.Collections.Maps.get(entry, "actions");
        var actions = [];
        for (var actionIndex = 0; actionIndex < Core.Collections.Lists.size(gmJsonActions); actionIndex++) {

            var action = actionParser(Core.Collections.Lists.get(gmJsonActions, actionIndex));
            actions = pushArray(actions, action);
        }

        layout = pushArray(layout, 
			createTuple(
				Core.Collections.Maps.get(entry, "key"),
				{
		            key: Core.Collections.Maps.get(entry, "key"),
		            displayName: Core.Collections.Maps.get(entry, "displayName"),
		            keyboardMapping: Core.Collections.Lists.toArray(Core.Collections.Maps.get(entry, "keyboardMapping")),
					pressed: function(button, key) {
						
						for (var index = 0; index < getArrayLength(button.actions); index++) {
						
							var action = button.actions[index];
							var fun = getAssetIndex(action.name, AssetScript);
							var parametersLength = getArrayLength(action.parameters)
							switch (parametersLength) {
								case 0:
									fun()
									break;
								case 1:
									fun(action.parameters[0]);
									break;
								case 2:
									fun(action.parameters[0], action.parameters[1]);
									break;
								case 3:
									fun(action.parameters[0], action.parameters[1], action.parameters[2]);
									break;
								case 4:
									fun(action.parameters[0], action.parameters[1], action.parameters[2], action.parameters[3]);
									break;
								default:
									logger("Parameters length not supported: {0}", LogType.ERROR, parametersLength);
									break;
							}
							
						}
					},
		            actions: actions
		        }
			)
		);
    }
	
	return createMapFromTupleArray(layout);
}

function fetchNextValueFromSortedAscendingArray(array, value) {
								
	var arrayLength = getArrayLength(array);
	var returnValue = value;
	for (var index = 0; index < arrayLength - 1; index++) {
								
		var arrayValue = array[index];
		if (value <= arrayValue) {
										
			returnValue = array[index + 1];
			break;
		}
	}
	
	return returnValue;
}
							
function fetchPreviousValueFromSortedAscendingArray(array, value) {
								
	var arrayLength = getArrayLength(array);
	var returnValue = value;
	for (var index = 1; index < arrayLength; index++) {
								
		var arrayValue = array[index];
		if (value <= arrayValue) {
										
			returnValue = array[index - 1];
			break;
		}
	}
	return returnValue;
}

function getScreensFactor() {
				
	return getInstanceVariable(fetchGridRenderer(), "screensFactor");
}

function setScreensFactor(value) {
				
	setInstanceVariable(fetchGridRenderer(), "screensFactor", value);
}

function setScreensTarget(value) {
				
	var factor = getInstanceVariable(fetchGridRenderer(), "screensFactor");
	var task = createFieldModifierTask(fetchGridRenderer(), "screens", value, factor, 1, 0);
	sendFieldModifierTask(task);
}

function setAngleFactor(value) {
	
	setInstanceVariable(fetchGridRenderer(), "angleFactor", value);
}

function setAngleTarget(value) {
				
	var factor = getInstanceVariable(fetchGridRenderer(), "angleFactor");
	var task = createFieldModifierTask(fetchGridRenderer(), "angle", value, factor, 1, 0);
	sendFieldModifierTask(task);
}

function setTopLinePositionTarget(value) {

	var factor = getInstanceVariable(fetchGridRenderer(), "topLinePositionFactor");
	var task = createFieldModifierTask(fetchGridRenderer(), "topLinePosition", value, factor, 1, 0);
	sendFieldModifierTask(task);
}

function getTopLinePositionFactor() {

	return getInstanceVariable(fetchGridRenderer(), "topLinePositionFactor");
}

function setTopLinePositionFactor(value) {

	setInstanceVariable(fetchGridRenderer(), "topLinePositionFactor", value);
}

function setBottomLinePositionTarget(value) {

	var factor = getInstanceVariable(fetchGridRenderer(), "bottomLinePositionFactor");
	var task = createFieldModifierTask(fetchGridRenderer(), "bottomLinePosition", value, factor, 1, 0);
	sendFieldModifierTask(task);
}

function getBottomLinePositionFactor() {

	return getInstanceVariable(fetchGridRenderer(), "bottomLinePositionFactor");
}

function setBottomLinePositionFactor(value) {

	setInstanceVariable(fetchGridRenderer(), "bottomLinePositionFactor", value);
}

function setChannelsTarget(value, factor) {
				
	var task = createFieldModifierTask(fetchGridRenderer(), "channels", value, factor, 1, 0);
	sendFieldModifierTask(task);
}

function setSeparatorsTarget(value, factor) {
				
	var task = createFieldModifierTask(fetchGridRenderer(), "separators", value, factor, 1, 0);
	sendFieldModifierTask(task);
}

function sendShaderEvent(shaderEvent) {

	if (isEntity(shaderEvent, ShaderEvent)) {
		
		var shaderName = "shader" + getShaderEventName(shaderEvent);
		var shaderAsset = getShader(shaderName);
		var shaderIsCompiled = true; //isUndefined(shaderAsset) ? false : shader_is_compiled(shaderAsset);
		logger("shaderAsset: {0} isCompiled: {1}", LogType.INFO, shaderAsset, shaderIsCompiled);
						
		if ((shaderAsset != null) && 
			(shaderIsCompiled)) {
							
			var duration = getShaderEventDuration(shaderEvent);
			var state = cloneMap(getShaderEventData(shaderEvent))   ;
			var shaderTask = createShaderTask(shaderAsset, duration, state, 0.0, 0.7);
			var pipeline = isDataStructure(state, Map) ? getValueFromMap(state, "pipeline", "main") : "main";
			sendShaderTaskToShaderPipeline(shaderTask, pipeline);
		} else {
				
			logger("Cannot dispatch ShaderEvent: shader \"{0}\" wasn't {1}", LogType.WARNING,
				shaderName, shaderAsset == null ? "found" : "compiled");
		}
	}
}

function spawnVisuShroom(config) {
	
	var texture = config.texture;
	var position = config.position;
	var horizontalSpeed = config.horizontalSpeed;
	var verticalSpeed = config.verticalSpeed;
	var shroomState = createMap();
	Core.Collections.Maps.set(shroomState, "horizontalSpeed", horizontalSpeed);
	Core.Collections.Maps.set(shroomState, "verticalSpeed", verticalSpeed);
	Core.Collections.Maps.set(shroomState, "spawnPosition", config.spawnPosition);
	Core.Collections.Maps.set(shroomState, "bulletTaken", 0);
	Core.Collections.Maps.set(shroomState, "isShooting", getValueFromStruct(config.features, "isShooting", false));
	Core.Collections.Maps.set(shroomState, "shootingInterval", getValueFromStruct(config.features, "shootingInterval", 1.0));
	Core.Collections.Maps.set(shroomState, "isZigzagMovement", getValueFromStruct(config.features, "isZigzagMovement", false));
	Core.Collections.Maps.set(shroomState, "zigzagAmount", getValueFromStruct(config.features, "zigzagAmount", 0.002));
	Core.Collections.Maps.set(shroomState, "zigzagSpeed", getValueFromStruct(config.features, "zigzagSpeed", 0.2));
	Core.Collections.Maps.set(shroomState, "bulletFollowPlayer", getValueFromStruct(config.features, "bulletFollowPlayer", false));
	Core.Collections.Maps.set(shroomState, "slideAwayAfterLanding", getValueFromStruct(config.features, "slideAwayAfterLanding", false));

	var gridElement = createGridElement(
		position,
		createSprite(texture, irandom(sprite_get_number(texture)), 2.0, 2.0, 0.0, 0.0, c_white),
		createGridElementInfo(true, GridElementInfoType.DEFAULT, c_white, "")
	);
	var radius = fetchCollisionRadiusFromSprite(getGridElementSprite(gridElement));
	var speedValue = verticalSpeed > horizontalSpeed ? verticalSpeed : horizontalSpeed;
	var text = createEmptyOptional();
	var updateHandler = function() {	
		logger("///@todo updateHandler implement", LogType.DEBUG);	
	}
	var bulletCollisionHandler = function() {
		logger("///@todo bulletCollisionHandler implement", LogType.DEBUG);	
	}
	var playerCollisionHandler = function() {
		logger("///@todo playerCollisionHandler implement", LogType.DEBUG);
	}
		
	var shroom = createShroom(
		gridElement,
		radius,
		speedValue,
		shroomState,
		text,
		updateHandler,
		bulletCollisionHandler,
		playerCollisionHandler
	);
		
	addToList(fetchShrooms(), shroom);
}

function actionSetScreensTarget(screens) {
	
	logger("Set screens: {0}", LogType.INFO, screens);
	setScreensTarget(screens);
}

function actionSetScreenFactor(screenFactor) {
	
	var previousFactor = getScreensFactor();
	logger("Set screens factor: {0}", LogType.INFO, previousFactor, screenFactor);
	setScreensFactor(screenFactor);	
}

function actionSetAngleTarget(angle) {
	
	var gridAngle = round(getGridRendererAngle());
	var target = (sign(gridAngle) * ((gridAngle div 45) * 45) + angle);
	logger("Set angle target: {0}", LogType.INFO, target);
	setAngleTarget(target);
}

function actionSetAngleFactor(factor) {
	
	logger("Set angle factor: {0}", LogType.INFO, factor);
	setAngleFactor(factor);
}

function actionSwitchEnableGridRendering() {
	
	var value = !getGridRendererEnableGridRendering()
	logger("Set enable-grid-rendering: {0}", LogType.INFO, value ? "true" : "false");
	setGridRendererEnableGridRendering(value);
}

function actionSwitchEnableLyricsRendering() {
	
	logger("Update enableLyricsRenderer", LogType.INFO);
	if (getLyricsRenderer().enableLyricsRenderer) {
		
		clearReactor(getLyricsRenderer().lyricsReactor)		
	}
	getLyricsRenderer().enableLyricsRenderer = !getLyricsRenderer().enableLyricsRenderer;
}

function actionLoadRecordingFromFile() {

	try {
		var eventsRecorder = fetchGameController().midiMatrixController.eventsRecorder;
		var text = Core.File.read({ withDialog: true });
		var eventsRecording = eventsRecorder.parseRecording(eventsRecorder, text);
		var eventsPlayer = fetchGameController().midiMatrixController.eventsPlayer;
		eventsPlayer.play(eventsPlayer, eventsRecording);
	} catch(exception) {
		logger(exception.message, LogType.INFO);
		printStackTrace();
	}
}

function actionStartRecordingToFile() {
	
	try {	
		var eventsRecorder = fetchGameController().midiMatrixController.eventsRecorder;
		if isStruct(eventsRecorder.getCurrentRecording(eventsRecorder)) {
								
			eventsRecorder.stopRecording(eventsRecorder);	
		} else {
								
			eventsRecorder.startRecording(eventsRecorder);	
		}
								
		global.isGameplayStarted = true;
		global.__hackWithRecorder = true;
		fetchGameController().isGameplayStarted = global.isGameplayStarted;
	} catch(exception) {
		logger(exception.message, LogType.INFO);
		printStackTrace();
	}
}

function actionSwitchEnableGridFrameCleaned() {
	
	var value = !fetchGameRenderer().isGridFrameCleaned
	logger("Set grid-frame-cleaned: {0}", LogType.INFO, value ? "true" : "false");
	fetchGameRenderer().isGridFrameCleaned = value;
}

function actionSwitchEnableGridColorWheel() {
	
	var value = !fetchGameRenderer().isGridWheelEnabled;
	logger("Set grid-wheel-enabled: {0}", LogType.INFO, value ? "true" : "false");
	fetchGameRenderer().isGridWheelEnabled = value;
}

function actionSwitchEnableGridSwing() {
	
	var swingGrid = getInstanceVariable(fetchGridRenderer(), "swingGrid");
	logger("Set swingGrid: {0}", LogType.INFO, swingGrid ? "true" : "false");
	setInstanceVariable(fetchGridRenderer(), "swingGrid", !(swingGrid == true));
}

function actionSwitchChangeGameplay() {

	var gameplayType = getPlayerManager().gameplayType;
	gameplayType = gameplayType == "bullethell"
		? "platformer"
		: "bullethell";
	setInstanceVariable(getPlayerManager(), "gameplayType", gameplayType);
							
	var baseScaleResolution = gameplayType == "bullethell"
		? getPropertyReal("gameRenderer.baseScaleResolution.bullethell", 2048)
		: getPropertyReal("gameRenderer.baseScaleResolution.platformer", 2048)
	global.__baseScaleResolution = baseScaleResolution
							
	
	
	if (Core.Objects.is(fetchGameRenderer())) {
		var jumbotronEvent = createJumbotronEvent(
			stringParams(
				" GAMEMODE\n\n>> {0} <<\n\n----------\n",
				string_upper(gameplayType)
			),
			"message",
			2.66
		);
		getSceneRenderer().jumbotronEvent = jumbotronEvent;
		getSceneRenderer().jumbotronEventTimer = 0.0;
	}
	
	if (Core.Objects.is(fetchGameController())) {
		fetchGameController().godMode = incrementTimer(fetchGameController().godMode, fetchGameController().godModeDuration);	
	}
}

function actionRemoveLastShader() {
	
	logger("Remove shader from pipeline main", LogType.INFO);
	popStack(getShaderPipelinePipe(fetchShaderPipelineByName("main")))
}

function actionSetGridTopLineWidth(width, factor) {

	var fieldModifierTask = createFieldModifierTask(fetchGridRenderer(), "topLineWidth", width, factor, 1, 0);
	logger("Set topLineWidth: {0}", LogType.INFO, width);
	sendFieldModifierTask(fieldModifierTask);
}

function actionSetGridBottomLineWidth(width, factor) {
	
	var fieldModifierTask = createFieldModifierTask(fetchGridRenderer(), "bottomLineWidth", width, factor, 1, 0);
	logger("Set bottomLineWidth: {0}", LogType.INFO, width);
	sendFieldModifierTask(fieldModifierTask);
}

function actionSetGridXScale(scale, factor) {
	
	var fieldModifierTask = createFieldModifierTask(fetchGridRenderer(), "xScale", scale, factor, 1, 0)
	logger("Set xScale: {0}", LogType.INFO, scale);
	sendFieldModifierTask(fieldModifierTask);
}

function actionSetGridYScale(scale, factor) {

	var fieldModifierTask = createFieldModifierTask(fetchGridRenderer(), "yScale", scale, factor, 1, 0)
	logger("Set yScale: {0}", LogType.INFO, scale);
	sendFieldModifierTask(fieldModifierTask);
}

function actionSetGridSpeed(gridSpeed) {
	
	logger("Set gridSpeed to: {0}", LogType.INFO, gridSpeed);
	setInstanceVariable(fetchGridRenderer(), "separatorSpeed", gridSpeed);
	getPlaygroundController().GMObject.state.grid.speed = gridSpeed
}

function actionStartShader(name, duration) {

	var template = findInRepositoryById(fetchShaderTemplateRepository(), name);
	var shaderEvent = createShaderEvent(
		template.shader,
		duration,
		template.data
	);
	logger("Sending shaderEvent: {0}", LogType.INFO, getShaderEventName(shaderEvent));
	sendShaderEvent(shaderEvent)
}

function actionSpawnShroom(name) {
	
	var repo = fetchShroomTemplateRepository();
	var template = findInRepositoryById(repo, name);
	
	if (!isOptionalPresent(template)) {
		
		logger("Shroom temple not found: {0}", LogType.WARNING, name);
		return;
	}
	
	var spawnPosition = Core.Collections.Arrays.getRandomValue(template.spawnPosition);
	if (!Core.Collections.Arrays.contains(SpawnPositionFields, spawnPosition)) {
		logger("Shroom spawn positon not found: {0}", LogType.WARNING, spawnPosition);
	}

	var spawnPositionDispatcher = Core.Collections.Maps.getDefault(
		SpawnPositionDispatcher, 
		spawnPosition,
		Core.Collections.Maps.get(SpawnPositionDispatcher, SpawnPosition_DEFAULT)
	);
	var spawnPositionData = spawnPositionDispatcher(template);
	var config = {
		name: template.name,
		texture: Core.Assets.Texture.fetch(Core.Collections.Arrays.getRandomValue(template.texture)),
		position: spawnPositionData.position,
		spawnPosition: spawnPosition,
		horizontalSpeed: spawnPositionData.horizontalSpeed,
		verticalSpeed: spawnPositionData.verticalSpeed,
		features: template.features,
	}
	
	logger(
		"Spawn shroom: { x: {0}, y: {1}, texture: \"{2}\" }", 
		LogType.INFO, 
		getPositionHorizontal(config.position), 
		getPositionVertical(config.position), 
		getAssetName(config.texture, AssetTexture)
	);
		
	spawnVisuShroom(config)
}

function actionSpawnRandomGlitch() {
	
	logger("Sending bkt glitch event", LogType.INFO);
	setInstanceVariable(fetchGameRenderer(), "__isKeyPressed", true);
}

function actionSetSpawnSpeed(from, to) {
	
	SHROOM_SPEED_RANGE = createPosition(from, to);
	logger("Update spawn speed: { from: {0}, to: {0} }", LogType.INFO, from, to);
}

function actionSetSpawnHRange(from, to) {
	
	SHROOM_SPAWN_H_RANGE = createTuple(from, to);
	logger("Update spawn horizontal position: { from: {0}, to: {0} }", LogType.INFO, from, to);
}

function actionSetSpawnVRange(from, to) {
	
	SHROOM_SPAWN_V_RANGE = createTuple(from, to);
	logger("Update spawn vertical position: { from: {0}, to: {0} }", LogType.INFO, from, to);
}

function actionSetBackgroundColor(name) {
	
	var color = getInstanceVariable(fetchGridRenderer(), name)
	logger("Set colorGridBackground to: {0}", LogType.INFO, gmColorToColorHash(color));
	setInstanceVariable(fetchGridRenderer(), "colorGridBackground", color);
}

function actionSetForegroundTexture(name, isRandomFrame) {

	var texture = getInstanceVariable(fetchGridRenderer(), name);
	var foreground = getInstanceVariable(fetchGameRenderer(), "foreground");
	var frame = irandom(sprite_get_number(texture));
	if (isRandomFrame) {
		try {
			var currentTexture = getSpriteAssetIndex(foreground);
			if (currentTexture == texture) {
				var currentFrame = getSpriteCurrentFrame(foreground);
				frame = currentFrame + 1 >= sprite_get_number(currentTexture)
					? 0 
					: currentFrame + 1;
			}
		} catch (exception) {
			logger(exception.message, LogType.ERROR);	
		}
	}
	setInstanceVariable(fetchGameRenderer(), "previousForeground", foreground);
	setInstanceVariable(fetchGameRenderer(), "foreground", getRandomValueFromArray([
		createSprite(
			texture, 
			frame, 
			1.0, 
			1.0, 
			0.0, 
			0.0, 
			c_white
		)
	]));
}

function actionSetBackgroundTexture(name, isOnOff) {

	var texture = getInstanceVariable(fetchGridRenderer(), name);					
	var background = getInstanceVariable(fetchGameRenderer(), "background");
	var previousBackground = getInstanceVariable(fetchGameRenderer(), "previousBackground");
	var frame = irandom(sprite_get_number(texture));
	try {
		var currentTexture = getSpriteAssetIndex(background);
		if (currentTexture == texture) {
			var currentFrame = getSpriteCurrentFrame(background);
			frame = currentFrame + 1 >= sprite_get_number(currentTexture)
				? 0 
				: currentFrame + 1;
		}
	} catch (exception) {
		logger(exception.message, LogType.ERROR);	
	}
	
	
	var newTexture = isOnOff
		? (getSpriteAssetIndex(background) == getSpriteAssetIndex(previousBackground)
			? asset_texture_empty
			: texture)
		: texture
	
	setInstanceVariable(fetchGameRenderer(), "previousBackground", background);
	setInstanceVariable(fetchGameRenderer(), "background", getRandomValueFromArray([
		createSprite(
			newTexture,
			frame, 
			1.0, 
			1.0, 
			0.0, 
			0.0, 
			c_white
		)
	]));
	setInstanceVariable(fetchGameRenderer(), "foreground", createSprite(asset_texture_empty, 0, 1.0, 1.0, 1.0, 0.0, c_white));
}

function actionSetGridChannels(value, factor) {
	
	logger("Set channels target: {0}", LogType.INFO, value);
	setChannelsTarget(value, factor);	
}

function actionAddGridChannels(value, factor) {
	
	var currentValue = ceil(getInstanceVariable(fetchGridRenderer(), "channels"));
	var newValue = clamp(currentValue + value, 0, 512);
	logger("Set channels target: {0}", LogType.INFO, newValue);
	setChannelsTarget(newValue, factor);		
}

function actionSetGridSeparators(value, factor) {
	
	logger("Set separators target: {0}", LogType.INFO, value);
	setSeparatorsTarget(value, factor);	
}

function actionAddGridSeparators(value, factor) {
	
	var currentValue = ceil(getInstanceVariable(fetchGridRenderer(), "separators"));
	var newValue = clamp(currentValue + value, 0, 64);
	logger("Set separators target: {0}", LogType.INFO, newValue);
	setSeparatorsTarget(newValue, factor);		
}

function actionSpawnGridPulse(amount) {
	
	logger("Send GridPulse: {0}", LogType.INFO, amount);
	setInstanceVariable(fetchGridRenderer(), "wavePulseAmount", amount); 
}

function actionSendLyricsEvent(name) {

	logger("Send LyricsEvent: {0}", LogType.INFO, name);
	sendLyricsEventToLyricsRenderer({ name: name })
}

function actionEnableVideo() {
	
	var controller = fetchGameController();
	logger("Set enableVideo: {0}", LogType.INFO, !controller.enableVideo);
	controller.enableVideo = !controller.enableVideo;
}

function fetchGameController() {

	return room == ScenePlayground 
		? getPlaygroundController() 
		: getGameController();
}
	
function fetchGridRenderer() {

	return room == ScenePlayground 
		? getPlaygroundController() 
		: getGridRenderer();
}
	
function fetchGameRenderer() {

	return room == ScenePlayground 
		? getPlaygroundController() 
		: getGameRenderer();
}