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
					button.pressed(button, key);
					
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
										log: Core.Collections._Queue.getTail(getLoggerQueue())
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
			var buttonSize = 6;
			var buttonMargin = 2;
			var xStart = GuiWidth - (mapWidth * (buttonSize + buttonMargin)) - 32;
			var yStart = GuiHeight - (mapHeight * (buttonSize + buttonMargin)) - 32;
			midiController.surface = getSurface(midiController.surface, GuiWidth, GuiHeight)
	
			var enableRender = true;
			gpuSetSurfaceTarget(midiController.surface)
			
				if (enableRender) {
					draw_clear_alpha(c_black, 0.0);
					draw_set_font(font_ibm_ps2thin4);
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
					timer: 0.0,
					duration: eventsRecording.timer,
					events: eventsRecording.events,
					eventPointer: 0
				}
				
				var trackPosition = eventsRecording.audio.trackPosition
				var name = eventsRecording.audio.name;
				
				var sound = getAssetIndex(name, AssetSound);
				if ((isAudio(sound)) && (isNumber(trackPosition))) {
					
					audio_stop_all();
					var soundInstanceId = audio_play_sound(sound, 100, false);
					global.__soundInstanceId = soundInstanceId;
					audio_sound_set_track_position(soundInstanceId, trackPosition);
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
				recording.timer = incrementTimer(recording.timer, recording.duration);
				try {
					
					var soundInstanceId = global.__soundInstanceId;
					if ((isAudio(soundInstanceId))
						&& (audio_is_playing(soundInstanceId))) {
				
						var audioPosition = audio_sound_get_track_position(global.__soundInstanceId);
						if (audioPosition > 0.0) {
							recording.timer = audioPosition;
						}
					}
				} catch (exception) {
				
					logger("Unable to sync with played audio. {0}", LogType.ERROR, exception.message);
				}
				
				if (timerFinished(recording.timer)) {
					
					eventsPlayer.recording = null;	
					return;
				} else {
					var size = Core.Collections._Array.size(recording.events)
					if (size > 0) && (size > recording.eventPointer) {
				
						var event = recording.events[recording.eventPointer];
						if (recording.timer >= event.data.timestamp) {
						
							try {
								recording.eventPointer++
								var key = event.data.key;
								var button = Core.Collections._Map.get(keymapConfig, key);
								button.pressed(button, key);
								
								setStructVariable(eventsPlayer.cache, key, 1.0);
								
								var midiController = getGameController().midiMatrixController
								midiController.eventsRecorder.registerEvent(
									midiController.eventsRecorder, { 
										name: "MidiControllerButtonEvent", 
										data: { 
											key: key,
											timestamp: event.data.timestamp,
											log: event.data.log,
										}
									}	
								);
								
								global.__launchapdEvents++
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

function createEventsRecorder() {

	return {
		state: createEmptyOptional(),
		
		startRecording: function(eventsRecorder) {
			
			var currentRecording = {
				timer: 0.0,
				events: [],
				audio: {
					name: getAssetName(asset_ost_visu_main, AssetSound), ///@todo mockup
					trackPosition: 0.00
				},
				layout: {
					name: "novation-launchpad", ///@todo mockup
					page: 0 ///@todo mockup
				}
			};
			eventsRecorder.setCurrentRecording(eventsRecorder, currentRecording)
			audio_stop_all();
			audio_play_sound(asset_ost_visu_main, 100, false);
			
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
				
				currentRecording.events = Core.Collections._Array.push(currentRecording.events, event);
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
				var timer = Core.Collections._Map.get(jsonObject, "timer");
				var events = [];
				var jsonEvents = Core.Collections._Map.get(jsonObject, "events");
				if (jsonEvents != null) {
					
					
					var eventsSize = Core.Collections._List.size(jsonEvents);
					events = createArray(eventsSize);
					for (var index = 0; index < eventsSize; index++) {
						
						var jsonEvent = Core.Collections._List.get(jsonEvents, index);
						var jsonEventData = Core.Collections._Map.get(jsonEvent, "data");
						var entry = {
							name: Core.Collections._Map.get(jsonEvent, "name"),
							data: {
								log: "",
								key: Core.Collections._Map.get(jsonEventData, "key"),
								timestamp: Core.Collections._Map.get(jsonEventData, "timestamp")
							}
						}
						events[index] = entry;
					}
				}
				
				var audio = {
					trackPosition: 0,
					name: "asset_ost_visu_main"
				}
				
				var jsonAudio = Core.Collections._Map.get(jsonObject, "audio");
				audio.trackPosition = Core.Collections._Map.get(jsonAudio, "trackPosition");
				audio.name = Core.Collections._Map.get(jsonAudio, "name");
				
				eventsRecording = {
					timer: timer,
					events: events,
					audio: audio,
					layout: {
						name: "novation-launchpad", ///@todo mockup
						page: 0 ///@todo mockup
					}
				}
				
				Core.Collections._Map.free(jsonObject);
				//Core.File.write({ 
				//	text: Core.JSON.stringify(eventsRecording), 
				//	filename: "recording.json", 
				//	withDialog: true
				//});
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
				
	return getInstanceVariable(getGridRenderer(), "screensFactor");
}

function setScreensFactor(value) {
				
	setInstanceVariable(getGridRenderer(), "screensFactor", value);
}

function setScreensTarget(value) {
				
	var factor = getInstanceVariable(getGridRenderer(), "screensFactor");
	var task = createFieldModifierTask(getGridRenderer(), "screens", value, factor, 1, 0);
	sendFieldModifierTask(task);
}

function setAngleFactor(value) {
	
	setInstanceVariable(getGridRenderer(), "angleFactor", value);
}

function setAngleTarget(value) {
				
	var factor = getInstanceVariable(getGridRenderer(), "angleFactor");
	var task = createFieldModifierTask(getGridRenderer(), "angle", value, factor, 1, 0);
	sendFieldModifierTask(task);
}

function setTopLinePositionTarget(value) {

	var factor = getInstanceVariable(getGridRenderer(), "topLinePositionFactor");
	var task = createFieldModifierTask(getGridRenderer(), "topLinePosition", value, factor, 1, 0);
	sendFieldModifierTask(task);
}

function getTopLinePositionFactor() {

	return getInstanceVariable(getGridRenderer(), "topLinePositionFactor");
}

function setTopLinePositionFactor(value) {

	setInstanceVariable(getGridRenderer(), "topLinePositionFactor", value);
}

function setBottomLinePositionTarget(value) {

	var factor = getInstanceVariable(getGridRenderer(), "bottomLinePositionFactor");
	var task = createFieldModifierTask(getGridRenderer(), "bottomLinePosition", value, factor, 1, 0);
	sendFieldModifierTask(task);
}

function getBottomLinePositionFactor() {

	return getInstanceVariable(getGridRenderer(), "bottomLinePositionFactor");
}

function setBottomLinePositionFactor(value) {

	setInstanceVariable(getGridRenderer(), "bottomLinePositionFactor", value);
}

function setChannelsTarget(value) {
				
	var factor = 0.1
	var task = createFieldModifierTask(getGridRenderer(), "channels", value, factor, 1, 0);
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

function shroomButton(texture, speedValue) {

	var __sprite = texture;//getRandomValueFromArray(arts);
	var shroomTemplate = createShroomTemplate(
		createSprite(
			__sprite, 
			irandom(sprite_get_number(__sprite)), 
			1.0, 1.0, 
			1.0, 
			0.0, 
			c_white
		),
		createMap(), 
		[ 
			speedValue * choose(1, 1, 2, 3, 5, 8, 13)
		],
		[ createTuple(GridElementInfoType.RAINBOW, colorHashToColor("#00ff00ff"))]
	);
		
	spawnShroom(
		shroomTemplate, 
		createPosition(
			irandom(100) / 100.0, 
			getRandomValueFromArray([
				0.013
			])
		)
	);
}

function spawnVisuShroom(config) {

	var texture = config.texture;
	var position = config.position;
	var horizontalSpeed = config.horizontalSpeed;
	var verticalSpeed = config.verticalSpeed;
	
	var shroomTemplate = createShroomTemplate(
		createSprite(
			texture, 
			irandom(sprite_get_number(texture)), 
			1.0, 
			1.0, 
			1.0, 
			0.0, 
			c_white
		),
		createMap(),
		[
			verticalSpeed
		],
		[ 
			createTuple(GridElementInfoType.RAINBOW, colorHashToColor("#00ff00ff"))
		]
	);
	
	spawnShroom(shroomTemplate, position, horizontalSpeed);
}