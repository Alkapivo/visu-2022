///@description create()

	super();
	
	registerSceneController(this);
	
	#region Fields
///@public:

	enableReplay = getPropertyBoolean("GameController.enableReplay", false);

	///@type {?InputHandler}
	inputHandler = createInputHandler(isHandheld() ? TouchInputHandler : KeyboardInputHandler);

	///@type {Number}
	gameplayTime = 0;
		
	#region ///@type {Struct<MidiMatrixController>}
	global.isGameplayStarted = false;
	global.__deaths = 0;
	global.__score = 0;
	global.__launchapdEvents = 0;
	function buttonIsEnabled(button) {
		
		var isEnabled = getStructVariable(button, "isEnabled") == true;
		setStructVariable(button, "isEnabled", !isEnabled)
	}
	
	midiMatrixController = generateDefaultMidiMatrixController();
	#endregion

	///@type {String}
	baseRecording = "{}";
	if (isHtml5()) {
		baseRecording = html5EmbeddedTrackJson();
	} else {
		var base = getPropertyString("base-timeline", "base.json");
		baseRecording = Core.File.read({ path: "data", filename: base, withDialog: false });
	}

	///@type {Struct} 
	gameplayData = {
		shroomCounter: 0,
		respawnCounter: 0,
	}
	
	///@type {Timer}
	godMode = 0.0;
	
	///@type {Number}
	godModeDuration = 3.0;
	
///@private:

	///@type {Number} in seconds
	isGameplayStarted = false;
	
	mouseCounter = 0;
	
	///@type {Boolean}
	isOSTResolved = false;
	
	///@type {Number}
	rewind = getPropertyReal("GameController.rewind", 0.0);
	
	#endregion
	
	#region Dependencies
	inject(BossManager);
	inject(LyricsRenderer);
	inject(GridRenderer);
	inject(ShroomManager);
	inject(BulletManager);
	inject(PlayerManager);
	inject(GameRenderer);
	createCamera();
	
	jsUtilBootComplete(); // hide loading div
	
	pushStack(
		getLyricsRenderer().lyricsTaskPipeline,
		createLyricsEvent(
			global.__lyrics,
			4096, 
			0.11
		)
	);
	#endregion	
	
	GMObject = {
		
		updateBegin: method(this, function() {
			
			resolveGameplayTime(this);
			this.midiMatrixController.update(this.midiMatrixController);
	
			if (!this.isGameplayStarted) {

				if (mouse_check_button_pressed(mb_any)) {			
					this.mouseCounter++;
				}
		
				if (this.mouseCounter >= 2) {
					this.isGameplayStarted = true;
				}
			}
	
			if (global.isGameplayStarted) {
		
				if (this.isOSTResolved) {
			
					if (this.enableReplay) {
						var eventsPlayer = this.midiMatrixController.eventsPlayer;
						var eventsRecorder = this.midiMatrixController.eventsRecorder;
						if ((!isOptionalPresent(eventsPlayer.recording))
							&& (!isOptionalPresent(eventsRecorder.getCurrentRecording(eventsRecorder)))) {
					
							var text = this.baseRecording;
							var eventsRecording = eventsRecorder.parseRecording(eventsRecorder, text);
							if (isStruct(getStructVariable(eventsRecorder.state, "currentRecording"))) {
								eventsRecorder.state.currentRecording.timer = 0.0; //this.rewind // rewind hack
								eventsRecorder.state.currentRecording.audio.trackPosition = 0.0; //this.rewind // rewind hack
							}
						
							eventsPlayer.play(eventsPlayer, eventsRecording);
							visuTrackDefaultHandler();
							logger("DUPA", LogType.DEBUG);
						}	
					}
				} else {
		
					this.isOSTResolved = true;
					try {
				
						var eventsPlayer = this.midiMatrixController.eventsPlayer;
						var eventsRecorder = this.midiMatrixController.eventsRecorder;
						var text = this.baseRecording;
						var eventsRecording = eventsRecorder.parseRecording(eventsRecorder, text);
						
						eventsRecording.audio.trackPosition = 0.0; //this.rewind; // rewind hack
						
						if (isStruct(getStructVariable(eventsRecorder.state, "currentRecording"))) {
							eventsRecorder.state.currentRecording.timer = 0.0; //this.rewind // rewind hack
							eventsRecorder.state.currentRecording.audio.trackPosition = 0.0; //this.rewind // rewind hack
						}
						eventsPlayer.play(eventsPlayer, eventsRecording);
				
						logger("DUPA", LogType.DEBUG);
						//var package = package_carpenter_brut_turbo_killer();
						//Core.PackageManager.applyPackage(package);
				
					} catch (exception) {
			
						logger(exception.message, LogType.ERROR);
						printStackTrace();
					}
				}
	
				if (keyboard_check_pressed(ord("B"))) {
		
					var debugSpawnShroom = function(context) {
		
						var shroomShaderEventTemplates = getInstanceVariable(getShroomManager(), "shroomShaderEventTemplates");
						var shaderEventTemplate = undefined;
		
						if (isDataStructure(shroomShaderEventTemplates, Map)) {
		
							var templateName = getRandomValueFromArray(getMapKeys(shroomShaderEventTemplates));
							shaderEventTemplate = shroomShaderEventTemplates[? templateName];
						}
		
						if (isEntity(shaderEventTemplate, ShaderEvent)) {
			
							var shaderEvent = shaderEventTemplate;
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
			
					debugSpawnShroom(this);
				}
		
				if (!timerFinished(this.godMode)) {
		
					this.godMode = incrementTimer(this.godMode, this.godModeDuration);
				}
			}
	
			global.isGameplayStarted = this.isGameplayStarted;
		}),
		cleanUp: method(this, function() {

			super();
			deregisterSceneController();
			this.midiMatrixController.cleanUp(this.midiMatrixController);
			global.isGameplayStarted = false;
		})
	}

