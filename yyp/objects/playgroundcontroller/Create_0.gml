/// @description GMObject.create()

	super();
	gc_enable(true);
	
	//#region Fields

	video = null;

///@public:

	#region Controller fields
	
	///@type {Optional<MidiMatrixController>}
	midiMatrixController = null;
	
	///@type {Boolean}
	enableReplay = getPropertyBoolean("GameController.enableReplay", false);
	
	///@type {Number}
	gameplayTime = 0;
	
	///@type {String}
	baseRecording = "{}";
	
	///@type {Timer}
	godMode = 0.0;
	
	///@type {Number}
	godModeDuration = 3.0;
	
	///@type {Number} in seconds
	isGameplayStarted = false;
	
	///@type {Number}
	mouseCounter = 0;
	
	///@type {Boolean}
	isOSTResolved = false;
	
	///@type {Number}
	rewind = getPropertyReal("GameController.rewind", 0.0);
	
	global.isGameplayStarted = false;
	global.__deaths = 0;
	global.__score = 0;
	global.__launchapdEvents = 0;
	#endregion
	
	#region Renderer fields
	shaderPipelinesNames = createList(); ///@description Index is priority, value is shaderPipelineName
	shaderPipelines = createMap();
	shaderHandlers = createMap();
	shaderUniformSetters = createMap();
	shaderTemplateRepository = createRepository("shaderTemplateRepository", "ShaderTemplate", createMap());
	applicationSurface = createSurface(global.guiWidth, global.guiHeight);
	screenSurface = createSurface(global.guiWidth, global.guiHeight);
	gridSurface = createSurface(global.viewWidth, global.viewHeight);
	gameSurface = createSurface(global.viewWidth, global.viewHeight);
	shaderSurface = createSurface(global.viewWidth, global.viewHeight, true);
	backgroundSurface = createSurface(GuiWidth, GuiHeight, true);
	mouseXPosition = 0.0;
	mouseYPosition = 0.0;
	background = createSprite(asset_texture_empty, 0, 1.0, 1.0, 0.0, 0.0, c_white);
	previousBackground = createSprite(asset_texture_visu_bkg_1, 0, 1.0, 1.0, 0.0, 0.0, c_white);
	foreground = createSprite(asset_texture_empty, 0, 1.0, 1.0, 1.0, 0.0, c_white);
	previousForeground = createSprite(asset_texture_empty, 0, 1.0, 1.0, 0.0, 0.0, c_white);
	foregroundTheta = 0.0;
	trackTimer = 0.0;
	cameraTheta = 0.0;
	texturesStack = createStack(
		asset_texture_visu_bkg_1,
		asset_texture_visu_bkg_2,
		asset_texture_visu_bkg_3,
		asset_texture_visu_bkg_4,
		asset_texture_visu_bkg_6,
		asset_texture_visu_shroom_01,
		asset_texture_visu_shroom_02,
		asset_texture_visu_shroom_03,
		asset_texture_visu_shroom_04,
		asset_texture_visu_shroom_05,
		asset_texture_visu_shroom_06,
		asset_texture_visu_shroom_07,
		asset_texture_visu_shroom_08
	);
	blendModes = [
		bm_zero,
		bm_one,
		bm_src_colour,
		bm_inv_src_colour,
		bm_src_alpha,
		bm_inv_src_alpha,
		bm_dest_alpha,
		bm_inv_dest_alpha,
		bm_dest_colour,
		bm_inv_dest_colour,
		bm_src_alpha_sat,
	];
	firstBlendPointer = 1;
	secondBlendPointer = 3;
	blendModesLength = getArrayLength(blendModes);
	starsRenderType = StarsRenderTypes.POINT;
	stars = createArray(255);
	#region Shaders initialization
	initializeShaderEmboss(this);
	addToMap(this.shaderHandlers, shaderEmboss, shaderEmbossHandler);
	addToMap(this.shaderUniformSetters, shaderEmboss, shaderEmbossUniformSetter);
	
	initializeShaderRevert(this);
	addToMap(this.shaderHandlers, shaderRevert, shaderRevertHandler);
	addToMap(this.shaderUniformSetters, shaderRevert, shaderRevertUniformSetter);
	
	initializeShaderLED(this);
	addToMap(this.shaderHandlers, shaderLED, shaderLEDHandler);
	addToMap(this.shaderUniformSetters, shaderLED, shaderLEDUniformSetter);
	
	initializeShaderMagnify(this);
	addToMap(this.shaderHandlers, shaderMagnify, shaderMagnifyHandler);
	addToMap(this.shaderUniformSetters, shaderMagnify, shaderMagnifyUniformSetter);
	
	initializeShaderMosaic(this);
	addToMap(this.shaderHandlers, shaderMosaic, shaderMosaicHandler);
	addToMap(this.shaderUniformSetters, shaderMosaic, shaderMosaicUniformSetter);
	
	initializeShaderPosterization(this);
	addToMap(this.shaderHandlers, shaderPosterization, shaderPosterizationHandler);
	addToMap(this.shaderUniformSetters, shaderPosterization, shaderPosterizationUniformSetter);
	
	initializeShaderRipple(this);
	addToMap(this.shaderHandlers, shaderRipple, shaderRippleHandler);
	addToMap(this.shaderUniformSetters, shaderRipple, shaderRippleUniformSetter);
	
	initializeShaderScanlines(this);
	addToMap(this.shaderHandlers, shaderScanlines, shaderScanlinesHandler);
	addToMap(this.shaderUniformSetters, shaderScanlines, shaderScanlinesUniformSetter);
	
	initializeShaderShockWave(this);
	addToMap(this.shaderHandlers, shaderShockWave, shaderShockWaveHandler);
	addToMap(this.shaderUniformSetters, shaderShockWave, shaderShockWaveUniformSetter);
	
	initializeShaderWave(this);
	addToMap(this.shaderHandlers, shaderWave, shaderWaveHandler);
	addToMap(this.shaderUniformSetters, shaderWave, shaderWaveUniformSetter);
	
	initializeShaderThermal(this);
	addToMap(this.shaderHandlers, shaderThermal, shaderThermalHandler);
	addToMap(this.shaderUniformSetters, shaderThermal, shaderThermalUniformSetter);
	
	initializeShaderSketch(this);
	addToMap(this.shaderHandlers, shaderSketch, shaderSketchHandler);
	addToMap(this.shaderUniformSetters, shaderSketch, shaderSketchUniformSetter);
	
	initializeShaderAbberation(this);
	addToMap(this.shaderHandlers, shaderAbberation, shaderAbberationHandler);
	addToMap(this.shaderUniformSetters, shaderAbberation, shaderAbberationUniformSetter);
	#endregion
	#endregion

	#region Grid fields
	///@type {Boolean}
	enableGridRendering = true;

	///@type {Boolean}
	enableGridElementsRendering = true;
	
	///@type {Boolean}
	enableSeparatorsRenderering = true;
	
	///@type {Boolean}
	enableSurfaceRendering = true;
	
	///@type {Color}
	colorGridWheelTopLeft = colorHashToColor(getProperty("gridRenderer.colorGridWheelTopLeft"));
	
	///@type {Color}
	colorGridWheelTopRight = colorHashToColor(getProperty("gridRenderer.colorGridWheelTopRight"));
	
	///@type {Color}
	colorGridWheelBottomRight = colorHashToColor(getProperty("gridRenderer.colorGridWheelBottomRight"));
	
	///@type {Color}
	colorGridWheelBottomLeft = colorHashToColor(getProperty("gridRenderer.colorGridWheelBottomLeft"));
	
	///@type {List<ColorTransformTask>
	colorTransformPipeline = createList();

	///@type {Color[]}
	gridColorWheel = [
		cloneArray(colorGridWheelTopLeft),
		cloneArray(colorGridWheelTopRight),
		cloneArray(colorGridWheelBottomRight),
		cloneArray(colorGridWheelBottomLeft)
	];
	
	///@type {Color[]}
	gridColorWheelTable = [
		colorGridWheelTopLeft,
		colorGridWheelTopRight,
		colorGridWheelBottomRight,
		colorGridWheelBottomLeft
	]
	
	///@type {Integer[]}
	gridColorWheelPointers = [ 1, 2, 3, 0 ];
	
	///@type {Number} normalized
	topLineWidth = 0.33;
	
	///@type {Number} normalized
	topLinePosition = 0.5;
	
	///@type {Number}
	topLinePositionFactor = global.topLinePositionFactorValues[0];

	///@type {Number} normalized
	bottomLineWidth = 0.75
	
	///@type {Number} normalized
	bottomLinePosition = 0.5;

	///@type {Number}
	bottomLinePositionFactor = global.bottomLinePositionFactorValues[0];

	///@type {Number}
	channels = 0;
	
	///@type {Number}
	separators = 0;
	
	///@type {Number} normalized
	offsetTop = 0.0;
	
	///@type {Number} normalized
	offsetBottom = 0.0;

	///@type {Number} const, normalized
	separatorSpeed = 1.0;
	
	///@type {Number} unit is Hz
	separatorFrameFrequency = 0.33;
	
	///@type {Color}
	colorPrimaryLines = colorHashToColor("#9d23ad");
	
	///@type {Color}
	colorSecondaryLines = colorHashToColor("#a31049");
	
	///@type {Color}
	colorGridBackground = c_black;
	
	///@type {Number}
	primaryLinesWidth = 8.0;
	
	///@type {Number}
	secondaryLinesWidth = 5.0;
	
	///@type {Number} degrees
	angle = 360.0 * 6;
	
	///@type {Number}
	angleFactor = 1.0;
	
	///@type {Number}
	xScale = 0.95;
	
	///@type {Number}
	yScale = 0.95;
	
	///@type {Boolean}
	isGridWheelEnabled = false;
	
	///@type {Boolean}
	isGridFrameCleaned = true;
	
	///@type {Boolean}
	gridWheelSpeed = 0.01;
	
	///@type {Boolean}
	swingGrid = false;
	
	///@type {Number}
	screens = 1.0;
	
	///@type {Number}
	screensFactor = global.screensFactorValues[0];
	
	///@type {Number}
	verticalScreens = 1.0;
	
	///@type {Number}
	horizontalScreens = 1.0;
	
	///@type {Number}
	wavePulseAmount = 0.0;
	
	///@type {Number}
	wavePulseMinAmount = 20.0;
	
	///@type {Number}
	wavePulseFriction = 2.5;
	
	///@type {Number}
	wavePulseDistortion = 180.0;
	
	///@type {Number}
	wavePulseSpeed = 1.0;
	
	///@type {Number}
	cameraShake = 0.0;
	
	///@type {Number}
	cameraShakeFactor = 0.5;
	
	///@type {Boolean}
	isFlat = false;
	
	///@type {Number}
	gridAngle = 0.0;
	
	shroom_texture_01 = getAssetIndex(getPropertyString("gridRenderer.shroom_texture_01", "asset_texture_visu_shroom_01"), asset_texture_empty);
	shroom_texture_02 = getAssetIndex(getPropertyString("gridRenderer.shroom_texture_02", "asset_texture_visu_shroom_02"), asset_texture_empty);
	shroom_texture_03 = getAssetIndex(getPropertyString("gridRenderer.shroom_texture_03", "asset_texture_visu_shroom_03"), asset_texture_empty);
	shroom_texture_04 = getAssetIndex(getPropertyString("gridRenderer.shroom_texture_04", "asset_texture_visu_shroom_04"), asset_texture_empty);
	shroom_texture_05 = getAssetIndex(getPropertyString("gridRenderer.shroom_texture_05", "asset_texture_visu_shroom_05"), asset_texture_empty);
	shroom_texture_06 = getAssetIndex(getPropertyString("gridRenderer.shroom_texture_06", "asset_texture_visu_shroom_06"), asset_texture_empty);
	shroom_texture_07 = getAssetIndex(getPropertyString("gridRenderer.shroom_texture_07", "asset_texture_visu_shroom_07"), asset_texture_empty);
	shroom_texture_08 = getAssetIndex(getPropertyString("gridRenderer.shroom_texture_08", "asset_texture_visu_shroom_08"), asset_texture_empty);
	background_texture_01 = getAssetIndex(getPropertyString("gridRenderer.background_texture_01", "asset_texture_visu_bkg_1"), asset_texture_empty);
	background_texture_02 = getAssetIndex(getPropertyString("gridRenderer.background_texture_02", "asset_texture_visu_bkg_2"), asset_texture_empty);
	background_texture_03 = getAssetIndex(getPropertyString("gridRenderer.background_texture_03", "asset_texture_visu_bkg_3"), asset_texture_empty);
	background_texture_04 = getAssetIndex(getPropertyString("gridRenderer.background_texture_04", "asset_texture_visu_bkg_4"), asset_texture_empty);
	background_texture_05 = getAssetIndex(getPropertyString("gridRenderer.background_texture_05", "asset_texture_visu_bkg_5"), asset_texture_empty);
	background_texture_06 = getAssetIndex(getPropertyString("gridRenderer.background_texture_06", "asset_texture_visu_bkg_6"), asset_texture_empty);
	background_color_01 = colorHashToGMColor(getPropertyString("gridRenderer.background_color_01", "#ffffff"));
	background_color_02 = colorHashToGMColor(getPropertyString("gridRenderer.background_color_02", "#e63956"));
	background_color_03 = colorHashToGMColor(getPropertyString("gridRenderer.background_color_03", "#d131f5"));
	background_color_04 = colorHashToGMColor(getPropertyString("gridRenderer.background_color_04", "#ffffff"));
	camera = camera_create();
	#endregion
 	GMObject = {
		state: {
			surface: null,
			wireframeSurface: null,
			grid: null,
			midiMatrix: null,
		},
		shaderPipelineDispatcher: method(this, function() {
	
			var shaderPipelinesNamesSize = getListSize(this.shaderPipelinesNames);
			this.shaderPipeCurrentSize = 0;
			for (var index = 0; index < shaderPipelinesNamesSize; index++) {
		
				var shaderPipelineName = Core.Collections.Lists.get(this.shaderPipelinesNames, index);
				var shaderPipeline = Core.Collections.Maps.get(this.shaderPipelines, shaderPipelineName);
		
				var pipe = getShaderPipelinePipe(shaderPipeline);
				var buffer = getShaderPipelineBuffer(shaderPipeline);
				var pipeSize = getStackSize(pipe);
				var shaderLimit = 20;
				var shaderLimitCounter = 0;
				for (var taskIndex = 0; taskIndex < pipeSize; taskIndex++) {
			
					var task = popStack(pipe);
					shaderLimitCounter++;
					this.shaderPipeCurrentSize++;
					if (shaderLimitCounter > shaderLimit) {
						logger("[NullDispatcher<ShaderTask>] Shader limit reached. { limit: {0}, pipeSize: {1} }", LogType.WARNING, shaderLimit, shaderLimitCounter);
						break;
					}
			
					var cooldown = getShaderTaskCooldown(task);
					if (cooldown > 0) {
						cooldown -= (1 / GAME_FPS) * getDeltaTimeValue();
						setShaderTaskCooldown(task, cooldown > 0 ? cooldown : 0.0);
						if (cooldown > 0) {
							pushStack(buffer, task);
							continue;	
						}	
					}
			
					var countdown = getShaderTaskCountdown(task);
					countdown -= (1 / GAME_FPS) * getDeltaTimeValue();
					setShaderTaskCountdown(task, countdown);
			
					if (countdown > 0) {
						var state = getShaderTaskState(task);
						var shader = getShaderTaskShader(task);
						var handler = fetchShaderTaskHandler(shader);
				
						if (handler != null) {
							script_execute(handler, state);
							pushStack(buffer, task);	
						}
					} else {
						destroyShaderTask(task);
					}
			
					var alpha = getShaderTaskAlpha(task);
					var alphaFadeOutTimer = 0.8;
					if (countdown > alphaFadeOutTimer) {
						if (alpha < 1) {
							alpha = clamp(alpha + applyDeltaTime(), 0.0, 1.0);
							setShaderTaskAlpha(task, alpha);
						}
					} else {
						alpha = countdown / alphaFadeOutTimer;
						setShaderTaskAlpha(task, alpha);
					}
				}
		
				// Push buffer to pipe
				var bufferSize = getStackSize(buffer);
				for (var taskIndex = 0; taskIndex < bufferSize; taskIndex++) {
					var task = popStack(buffer);
					pushStack(pipe, task);	
				}
			}
		}),
		intro: method(this, function() {
			
			if (!this.isGameplayStarted) {

				if (mouse_check_button_pressed(mb_any)
					|| keyboard_check_pressed(ord("P"))) {			
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
								eventsRecorder.state.currentRecording.timer = this.rewind // rewind hack
								eventsRecorder.state.currentRecording.audio.trackPosition = this.rewind // rewind hack
							}
						
							eventsPlayer.play(eventsPlayer, eventsRecording);
							visuTrackDefaultHandler();
						}	
					}
				} else {
		
					this.isOSTResolved = true;
					try {
				
						var eventsPlayer = this.midiMatrixController.eventsPlayer;
						var eventsRecorder = this.midiMatrixController.eventsRecorder;
						var text = this.baseRecording;
						var eventsRecording = eventsRecorder.parseRecording(eventsRecorder, text);
						
						eventsRecording.audio.trackPosition = this.rewind; // rewind hack
						
						if (isStruct(getStructVariable(eventsRecorder.state, "currentRecording"))) {
							eventsRecorder.state.currentRecording.timer = this.rewind // rewind hack
							eventsRecorder.state.currentRecording.audio.trackPosition = this.rewind // rewind hack
						}
						eventsPlayer.play(eventsPlayer, eventsRecording);
						//var package = package_carpenter_brut_turbo_killer();
						//Core.PackageManager.applyPackage(package);
				
					} catch (exception) {
			
						logger(exception.message, LogType.ERROR);
						printStackTrace();
					}
				}
				if (!timerFinished(this.godMode)) {
		
					this.godMode = incrementTimer(this.godMode, this.godModeDuration);
				}
			}
	
			global.isGameplayStarted = this.isGameplayStarted;
		}),	
		renderIntro: method(this, function() {

			var renderStack = true
			if (renderStack && !isStackEmpty(this.texturesStack)) {
				var texture = popStack(this.texturesStack);
				var size = sprite_get_number(texture);
				for (var index = 0; index < size; index++) {
					renderTexture(
						texture, 
						random(GuiWidth * 0.7), 
						random(GuiHeight * 0.7), 
						index,
						0.0,
						1.0,
						1.0,
						0.5
					);
					
					if (getCurrentConfig() == "debug") {
						break;
					}
				}
			}
			
	
			var __color = draw_get_color();
			var __alpha = draw_get_alpha();
	
			draw_set_color(c_black);
			draw_set_alpha(0.9);
			draw_rectangle(0, 0, RealWidth, RealHeight, false);
		
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_set_font(asset_font_start_screen);
			draw_set_color(choose(c_white, c_white, c_white, c_white, c_white, c_white, c_fuchsia));
			draw_set_alpha(1.0);

			///@todo move to properties
			var title = getPropertyString("gameRenderer.start.title", "John doe");
			var subtitle = getPropertyString("gameRenderer.start.subtitle", "Lorem ipsum");
			var text = stringParams(
				"{0}\n{1}\n\n{2}        {3}\n\n{4}\n{5}",
				title,
				subtitle,
				"MOUSE CLICK TO",
				getRandomValueFromArray([
					"play    ", " play   ", "  play  ", "   play ", "    play"
				]),
				"",
				""
			);
			draw_text(
				(RealWidth / 2.0) + irandom(2), 
				(RealHeight / 2.0) + irandom(2), 
				text
			);
		
			draw_set_color(__color);
			draw_set_alpha(__alpha);
		}),
		renderHUD: method(this, function() {
			var midiController = this.midiMatrixController;
			var currentRecording = midiController.eventsRecorder.getCurrentRecording(midiController.eventsRecorder);
			if (isStruct(currentRecording)) {
				draw_rectangle_color(
					0.0 + 32,
					GuiHeight - 32 - 24,
					0.0 + 32 + 24,
					GuiHeight - 32,
					c_fuchsia,
					c_fuchsia,
					c_fuchsia,
					c_fuchsia,
					false
				)
			} else {
				
				var gameplayType = getPlayerManager().gameplayType;
				var controls = "";
				if (gameplayType == "bullethell") {

					controls = 
						"shoot:           Z / SPACE" + "\n" +
						"slow movement:   SHIFT" + "\n" +
						"use bomb:        X" + "\n" +
						"gamemode:        " + gameplayType + "\n" +
						"change gamemode: N" + "\n" +
						"random shader:   B" + "\n";

				} else if (gameplayType == "platformer") {

					controls = 
						"jump:            ARROW UP / SPACE" + "\n" +
						"gamemode:        " + gameplayType + "\n" +
						"change gamemode: N" + "\n" +
						"random shader:   B" + "\n";
				}
				
				draw_set_halign(fa_left);
				draw_set_valign(fa_bottom);
				draw_set_font(asset_font_ibm_ps2thin4);
				renderTextOutline(controls, 32, RealHeight - 32, c_white, c_black);
			}

			var recording = midiController.eventsPlayer.recording;
			var currentRecording = midiController.eventsRecorder.getCurrentRecording(midiController.eventsRecorder);
			if (isStruct(currentRecording)) {
				recording = currentRecording;	
			}
			if (isStruct(recording)) {

				var soundInstanceId = global.__soundInstanceId;
				if (isAudio(soundInstanceId)) {

					var currentLength = recording.timer;
					var audioLength = audio_sound_length(soundInstanceId); //this.trackTimer; //rewind hack
					//logger("Recording timer: {0} {1} {2}", LogType.INFO, recording.timer, getGameplayTime(), audioLength);
					var barLength = (GuiWidth / 3);

					draw_set_color(c_white);
					draw_set_alpha(0.4);
					drawLine(
						(GuiWidth / 2) - (barLength / 2),
						GuiHeight - 32,
						(GuiWidth / 2) + (barLength / 2),
						GuiHeight - 32,
						1
					);

					draw_set_font(asset_font_ibm_ps2thin4);
					draw_set_halign(fa_right);
					draw_set_valign(fa_middle);

					var minutes = string(currentLength div 60);
					var seconds = string(currentLength mod 60);
					minutes = string_length(minutes) == 1
						? stringParams("0{0}", minutes) 
						: minutes
					seconds = floor(currentLength mod 60) < 10
						? stringParams("0{0}", seconds) 
						: seconds

					renderTextOutline(stringParams("{0}:{1}", minutes,seconds), (GuiWidth / 2) - (barLength / 2), GuiHeight - 32, c_white, c_black);

					draw_set_alpha(0.7);
					draw_set_color(c_fuchsia);
					drawLine(
						(GuiWidth / 2) - (barLength / 2),
						GuiHeight - 35,
						(GuiWidth / 2) - (barLength / 2) + (barLength * (currentLength / audioLength)),
						GuiHeight - 35,
						4
					);

					draw_set_alpha(1);
				}
			}	
		}),
		create: method(this, function(data) {
			
			registerSceneController(this);
			jsUtilBootComplete(); // hide loading div
			
			if (isHtml5()) {
				this.baseRecording = html5EmbeddedTrackJson();
			} else {
				var base = getPropertyString("base-timeline", "base.json");
				this.baseRecording = Core.File.read({ path: "data", filename: base, withDialog: false });
			}
			
			this.GMObject.state.grid = data.grid;
			this.GMObject.state.midiMatrix = data.midiMatrix;
			this.midiMatrixController = this.GMObject.state.midiMatrix;
			this.GMObject.state.surface = Core.Surfaces.get(
				this.GMObject.state.surface, 
				this.GMObject.state.grid.pixelWidth, 
				this.GMObject.state.grid.pixelHeight, 
				true
			);
			this.GMObject.state.wireframeSurface = Core.Surfaces.get(
				this.GMObject.state.wireframeSurface, 
				this.GMObject.state.grid.pixelWidth, 
				this.GMObject.state.grid.pixelHeight, 
				true
			);
			
			this.GMObject.state.grid.view.y = this.GMObject.state.grid.height - this.GMObject.state.grid.view.height
			
			var shaderTemplatesJsonString = Core.File.read({ 
				path: "data", 
				filename: "shader-templates.json", 
				withDialog: false 
			});
			parseJsonShaderTemplates(shaderTemplatesJsonString);
			var shaderPipelinesInitializationArray = [
				createTuple("main", 3),
				createTuple("captured", 1),
			];
			initializeShaderPipelines(shaderPipelinesInitializationArray);
			
			inject(BulletManager);
			inject(PlayerManager);
			inject(ShroomManager);
			inject(ParticleManager);
			
			inject(LyricsRenderer);
			inject(PlaygroundRenderer);
			
			bktglitch_init();
			__bktgtlich_ui_init()
		}),
		bktgtlichUpdate: method(this, function() {
			
			var __isKeyPressed = injectInstanceVariable(this, "__isKeyPressed", false);
			__bktgtlich_ui_step(__isKeyPressed);
			setInstanceVariable(this, "__isKeyPressed", false);
		}),
		cleanUp: method(this, function() {
			super();
			deregisterSceneController();
			this.midiMatrixController.cleanUp(this.midiMatrixController);
			global.isGameplayStarted = false;
			destroyDataStructure(this.colorTransformPipeline, List, "Unable to destroy colorTransformPipeline");
			
			this.video = video_close();
		}),
		gmAlarm0: method(this, function() {
			__bktgtlich_ui_alarm();
		}),
		update: method(this, function() {
			resolveGameplayTime(this);
			this.GMObject.intro();
			this.GMObject.shaderPipelineDispatcher();
			this.GMObject.state.grid.update(this.GMObject.state.grid);
			this.GMObject.state.midiMatrix.update(this.GMObject.state.midiMatrix);
			this.mouseLook();
			this.GMObject.state.grid.channels = this.channels;
			this.GMObject.state.grid.separators.amount = this.separators;
			this.GMObject.bktgtlichUpdate();
			//this.enableGridRendering = true;
			
			
			#region ColorTransformPipeline reactor
			var destroyColorTransformTasks = [];
			var colorTransformPipelineSize = getListSize(this.colorTransformPipeline);
			for (var index = 0; index < colorTransformPipelineSize; index++) {
				
				var	colorTransformTask = Core.Collections.Lists.get(this.colorTransformPipeline, index);
				var fieldName = getColorTransformTaskFieldName(colorTransformTask);
				var color = instanceVariableExists(this, fieldName) ? getInstanceVariable(this, fieldName) : null;
				if (color == null) {
					continue;	
				}
		
				if (transformColor(
						color, 
						getColorTransformTaskTargetColor(colorTransformTask),
						getColorTransformTaskChangeFactor(colorTransformTask)
					)) {
			
					destroyColorTransformTasks = pushArray(destroyColorTransformTasks, index);
				}
			}
	
			removeItemsFromList(this.colorTransformPipeline, destroyColorTransformTasks, destroyColorTransformTask);
			#endregion
		
			#region Transform colors in gridColorWheel
			var gridColorWheelLength = getArrayLength(this.gridColorWheel);
			for (var index = 0; index < gridColorWheelLength; index++) {
				var colorPointer = this.gridColorWheelPointers[index];
				var sourceColor = this.gridColorWheel[@ index];
				var targetColor = this.gridColorWheelTable[colorPointer]
				var changeFactor = this.gridWheelSpeed;
	
				var redSource = getColorRed(sourceColor);
				var greenSource = getColorGreen(sourceColor);
				var blueSource = getColorBlue(sourceColor);
				var alphaSource = getColorAlpha(sourceColor);
	
				var redTarget = getColorRed(targetColor);
				var greenTarget = getColorGreen(targetColor);
				var blueTarget = getColorBlue(targetColor);
				var alphaTarget = getColorAlpha(targetColor);
	
				var redFinal = redSource + changeFactor * sign(redTarget - redSource) * getDeltaTimeValue();
				redFinal = sign(redTarget - redFinal) == sign(redTarget - redSource) ? redFinal : redTarget;
	
				var greenFinal = greenSource + changeFactor * sign(greenTarget - greenSource) * getDeltaTimeValue();
				greenFinal = sign(greenTarget - greenFinal) == sign(greenTarget - greenSource) ? greenFinal : greenTarget;
	
				var blueFinal = blueSource + changeFactor * sign(blueTarget - blueSource) * getDeltaTimeValue();
				blueFinal = sign(blueTarget - blueFinal) == sign(blueTarget - blueSource) ? blueFinal : blueTarget;
	
				var alphaFinal = alphaSource + changeFactor * sign(alphaTarget - alphaSource) * getDeltaTimeValue();
				alphaFinal = sign(alphaTarget - alphaFinal) == sign(alphaTarget - alphaSource) ? alphaFinal : alphaTarget;
	
				setColorRed(sourceColor, redFinal);
				setColorGreen(sourceColor, greenFinal);
				setColorBlue(sourceColor, blueFinal);
				setColorAlpha(sourceColor, alphaFinal);
	
				var areEqual = areColorsEqual(sourceColor, targetColor);
				//printArray(targetColor);
				if (areEqual) {
					setColorRed(sourceColor, round(redFinal * 255) / 255);
					setColorGreen(sourceColor, round(greenFinal * 255) / 255);
					setColorBlue(sourceColor, round(blueFinal * 255) / 255);
					setColorAlpha(sourceColor, round(alphaFinal * 255) / 255);	
					
					//printArray(this.gridColorWheelTable[index]);
					this.gridColorWheelPointers[index] = colorPointer + 1 > 3 ? 0 : colorPointer + 1;
				}
			}
			#endregion
		}),
		preRender: method(this, function() {
			
			
			this.GMObject.state.surface = Core.Surfaces.get(
				this.GMObject.state.surface, 
				this.GMObject.state.grid.pixelWidth, 
				this.GMObject.state.grid.pixelHeight, 
				true
			);
			this.GMObject.state.wireframeSurface = Core.Surfaces.get(
				this.GMObject.state.wireframeSurface, 
				this.GMObject.state.grid.pixelWidth, 
				this.GMObject.state.grid.pixelHeight, 
				true
			);
			/*
			this.GMObject.state.grid.render(
				this.GMObject.state.grid, 
				this.GMObject.state.surface, 
				this.GMObject.state.wireframeSurface
			);
			*/
			
			this.GMObject.state.midiMatrix.preRender(this.GMObject.state.midiMatrix);
		}),
		render: method(this, function() {
			
			var renderShaderPipeline = function(context) {
				
				var cameraShake = 0.0; //getGridRenderer().cameraShake;
			
				var xDirection = cos(cameraShake) > 0 ? 1 : -1;
				var yDirection = sin(cameraShake) > 0 ? 1 : -1;
				var xCameraShake = cameraShake > 0 ? 
					(random(cameraShake * 0.7) + (cameraShake * 0.3)) * xDirection :
					0.0;
				var yCameraShake = cameraShake > 0 ?
					(random(cameraShake * 0.7) + (cameraShake * 0.3)) * yDirection :
					0.0;
				var shaderPipelinesNamesSize = getListSize(context.shaderPipelinesNames);
				for (var index = 0; index < shaderPipelinesNamesSize; index++) {
					var shaderPipelineName = Core.Collections.Lists.get(context.shaderPipelinesNames, index);
					var shaderPipeline = Core.Collections.Maps.get(context.shaderPipelines, shaderPipelineName);

					var pipe = getShaderPipelinePipe(shaderPipeline);
					var buffer = getShaderPipelineBuffer(shaderPipeline);
					var pipeSize = getStackSize(pipe);
					for (var taskIndex = 0; taskIndex < pipeSize; taskIndex++) {
						var task = popStack(pipe);
						var state = getShaderTaskState(task);
						var shader = getShaderTaskShader(task);
						var uniformSetter = fetchShaderTaskUniformSetter(shader);
	
						if (uniformSetter != null) {
	
							var alpha = getShaderTaskAlpha(task);
							if (alpha > 0) {						
								// Render shader to texture
								gpuSetSurfaceTarget(context.shaderSurface);
								drawClear(COLOR_TRANSPARENT);
								gpuSetShader(shader);
			
								runScript(uniformSetter, context, state, gridSurface);
								//renderSurface(gameSurface);
		
								var mousePositionFactor = 0.001;
								//context.mouseXPosition = lerp(context.mouseXPosition, getMouseGuiX(), mousePositionFactor)
								//context.mouseYPosition = lerp(context.mouseYPosition, getMouseGuiY(), mousePositionFactor)
								context.mouseXPosition = GuiWidth / 2.0;
								context.mouseYPosition = GuiHeight / 2.0;
								//context.mouseXPosition = (GuiWidth / 2.0) + (sin(context.cameraTheta) * 64);
								//context.mouseYPosition = (GuiHeight / 2.0) + (cos(context.cameraTheta) * 64);
		
								drawSurface(
									context.gameSurface,
									xCameraShake + (context.mouseXPosition - (GuiWidth / 2.0)),
									yCameraShake + (context.mouseYPosition - (GuiHeight / 2.0)),
									1.0, //getGridRendererXScale(),
									1.0, //getGridRendererYScale(),
									0.0, //getGridRendererAngle() + gridRenderer.angleSwing, 
									alpha,
									c_white,
									createPosition(0.5, 0.5)
								);
		
								gpuResetShader();
								gpuResetSurfaceTarget();
							} else {						
								gpuSetSurfaceTarget(context.shaderSurface);
			
								drawClear(COLOR_TRANSPARENT);
								drawSurface(context.gameSurface, 0, 0);
			
								gpuResetSurfaceTarget();
							}
							
							// Render texture
							
							gpuSetSurfaceTarget(context.gameSurface);
							drawSurface(context.shaderSurface, 0, 0, 1.0, 1.0, 0.0, alpha, c_white, [ 0.5, 0.5 ]);
							global.shaderPipeLimit = 2;
							if (pipeSize > global.shaderPipeLimit) {
			
								var gridRendererSurface = this.gridSurface
								gpu_set_blendmode(bm_add);
								renderSurface(
									gridRendererSurface, 
									xCameraShake + (context.mouseXPosition - (GuiWidth / 2.0)),
									yCameraShake + (context.mouseYPosition - (GuiHeight / 2.0)),
									1.0, //getGridRendererXScale(),
									1.0, //getGridRendererYScale(),
									0.0, //getGridRendererAngle() + gridRenderer.angleSwing, 
									0.33,
									c_white,
									createPosition(0.5, 0.5)
								);
								gpu_set_blendmode(bm_normal);
							}
							gpuResetSurfaceTarget();
	
							pushStack(buffer, task);	
						}
					}

					// Push buffer to pipe
					var bufferSize = getStackSize(buffer);
					for (var taskIndex = 0; taskIndex < bufferSize; taskIndex++) {
						var task = popStack(buffer);
						pushStack(pipe, task);	
					}
				}
			}
			
			var renderGrid = function(context) {
				
				
				// clear frame
				if (context.isGridFrameCleaned) {
					Core.GPU.renderClearColor(GM_COLOR_BLACK, 0.0);
				} else {
					draw_set_alpha(0.035);
					draw_rectangle_color(0.0, 0.0, GuiWidth, GuiHeight, c_white, c_white, c_white, c_white, false)
					draw_set_alpha(1.0)
				}
				
				// camera setup
				var cameraDistance = 160;
				var xto = context.x;
				var yto = context.y;
				var zto = context.z + (context.zoom * context.xScale);
				var xfrom = xto + cameraDistance * dcos(context.cameraDirection) * dcos(context.cameraPitch);
				var yfrom = yto - cameraDistance * dsin(context.cameraDirection) * dcos(context.cameraPitch);
				var zfrom = zto - cameraDistance * dsin(context.cameraPitch);
				context.viewMatrix = matrix_build_lookat(xfrom, yfrom, zfrom, xto, yto, zto, 0, 0, 1);
				camera_set_view_mat(context.camera, context.viewMatrix);
				context.projectionMatrix = matrix_build_projection_perspective_fov(-60, -1 * GuiWidth / GuiHeight, 1, 32000);
				camera_set_proj_mat(context.camera, context.projectionMatrix);
				camera_apply(context.camera);

				// wireframe
				if (context.enableGridRendering) {
					matrix_set(matrix_world, matrix_build(
						3072, 3072, 10, 
						0, 0, 0, 
						1, 1, 1
					));
					context.GMObject.state.grid.renderWireframe(context.GMObject.state.grid);
				}
								
				// shrooms
				gpu_set_alphatestenable(true);
				matrix_set(matrix_world, matrix_build(
					3072, 3072, 400 + (cos(this.pitchTimer * 12) * 64.0), 
					0, 0, 0, 
					1, 1, 1
				));
				context.GMObject.state.grid.renderShrooms(context.GMObject.state.grid);
				gpu_set_alphatestenable(false);
				
				// particles
				if (isOptionalPresent(getParticleManager())) {
					matrix_set(matrix_world, matrix_build(
						3072, 3072, 600, 
						0, 0, 0, 
						1, 1, 1
					));
					var particleSystem = getParticleManager().particleSystems[0]
					part_system_drawit(particleSystem);
				}
				
				// player
				matrix_set(matrix_world, matrix_build(
					3072, 3072, 800 + (sin(this.pitchTimer * 16) * 64.0), 
					0, 0, 0, 
					1, 1, 1
				));
				context.GMObject.state.grid.renderPlayer(context.GMObject.state.grid);
				
				// render all
				matrix_set(matrix_world, matrix_build_identity());
			}
				
			var renderBackground = function(context) {
				var backgroundAlphaMargin = 0.25;
				var backgroundAlpha = getSpriteAlpha(context.background);
				backgroundAlpha = clamp(backgroundAlpha + applyDeltaTime(), 0.0, 1.0 - backgroundAlphaMargin);
				setSpriteAlpha(context.background, backgroundAlpha);
				setSpriteAlpha(context.previousBackground, 1.0 - backgroundAlphaMargin - backgroundAlpha);

				if (getSpriteAlpha(context.previousBackground) > backgroundAlphaMargin) {
		
					var previousBackgroundScale = RealWidth > RealHeight 
						? RealWidth / getTextureWidth(getSpriteAssetIndex(context.previousBackground)) 
						: RealHeight / getTextureHeight(getSpriteAssetIndex(context.previousBackground)
					);
					drawSprite(
						context.previousBackground,
						RealWidth / 2.0,
						RealHeight / 2.0,
						previousBackgroundScale,
						previousBackgroundScale,
						getSpriteAlpha(context.previousBackground)	
					);
				}
	
				var backgroundScale = RealWidth > RealHeight 
					? RealWidth / getTextureWidth(getSpriteAssetIndex(context.background)) 
					: RealHeight / getTextureHeight(getSpriteAssetIndex(context.background)
				);
				gpu_set_blendmode(bm_add);
				drawSprite(
					context.background,
					RealWidth / 2.0,
					RealHeight / 2.0,
					backgroundScale,
					backgroundScale,
					getSpriteAlpha(context.background),
					0.0,
					context.colorGridBackground
				);
				gpu_set_blendmode(bm_normal);
			}
			
			var renderVideo = function(context) {
				
				if (context.enableVideo) {
					var videoData = video_draw();
					if (isArray(videoData)) {
						var videoStatus = videoData[0];
						if (videoStatus == 0) {
							var videoData = videoData[1];
							renderSurfaceStretched(videoData, 0.0, 0.0, GuiWidth, GuiHeight);
						}
					}
				}
			}
			
			var renderForeground = function(context) {
				
				var foregroundAlphaMargin = 0.0;
				var foregroundAlpha = getSpriteAlpha(context.foreground);
				foregroundAlpha = clamp(foregroundAlpha + applyDeltaTime(), 0.0, 1.0 - foregroundAlphaMargin);
				setSpriteAlpha(context.foreground, foregroundAlpha);
		
				context.foregroundTheta = incrementTimer(context.foregroundTheta, pi*2, 1 / (GAME_FPS * 3));
				context.cameraTheta = incrementTimer(context.cameraTheta, pi*2, 1 / (GAME_FPS * 5));
				var foregroundThetaFactor = 64;
		
				if (isOptionalPresent(context.previousForeground)) {
			
					setSpriteAlpha(context.previousForeground, 1.0 - foregroundAlphaMargin - foregroundAlpha)
					if (getSpriteAlpha(context.previousForeground) > foregroundAlphaMargin) {
		
						var previousForegroundScale = RealWidth > RealHeight 
							? RealWidth / getTextureWidth(getSpriteAssetIndex(context.previousForeground)) 
							: RealHeight / getTextureHeight(getSpriteAssetIndex(context.previousForeground)
						);
						gpu_set_blendmode(bm_add)
						drawSprite(
							context.previousForeground,
							(RealWidth / 2.0) + cos(context.foregroundTheta) * foregroundThetaFactor,
							(RealHeight / 2.0) + sin(context.foregroundTheta) * foregroundThetaFactor,
							previousForegroundScale * 1.1,
							previousForegroundScale * 1.1,
							getSpriteAlpha(context.previousForeground),
							0.0,
							context.colorGridBackground
						);
						gpu_set_blendmode(bm_normal);
					}
				}
		
				var foregroundScale = RealWidth > RealHeight 
					? RealWidth / getTextureWidth(getSpriteAssetIndex(context.foreground))
					: RealHeight / getTextureHeight(getSpriteAssetIndex(context.foreground))
				gpu_set_blendmode(bm_add)
				drawSprite(
					context.foreground,
					(RealWidth / 2.0) + cos(context.foregroundTheta) * foregroundThetaFactor,
					(RealHeight / 2.0) + sin(context.foregroundTheta) * foregroundThetaFactor,
					foregroundScale * 1.1,
					foregroundScale * 1.1,
					getSpriteAlpha(context.foreground),
					0.0,
					context.colorGridBackground
				);
		
				gpu_set_blendmode(bm_normal);
			}
			
			this.shaderSurface = Core.Surfaces.get(this.shaderSurface, ViewWidth, ViewHeight, true);
			this.gridSurface = Core.Surfaces.get(this.gridSurface, ViewWidth, ViewHeight, false);
			this.gameSurface = Core.Surfaces.get(this.gameSurface, ViewWidth, ViewHeight, true);
					
			Core.Surfaces.setTarget(this.gridSurface);
			renderGrid(this);
			Core.Surfaces.resetTarget();
			
			Core.Surfaces.setTarget(this.gameSurface);
			Core.GPU.renderClearColor(GM_COLOR_BLACK, 1.0);
			renderVideo(this);
			renderBackground(this)
			Core.Surfaces.render(this.gridSurface);
			renderForeground(this);
			Core.Surfaces.resetTarget();
			
			renderShaderPipeline(this);

		}),
		renderGUI: method(this, function() {
			
			var renderDebugText = function(context) {
				var grid = context.GMObject.state.grid;
				var text = stringParams("FPS: {0}\nview.x: {1}\nview.y: {2}\n{3}\n", 
					fps,
					grid.view.x, 
					grid.view.y,
					Core.Structs.is(grid.view.follow.target) 
						? stringParams("target.x: {0}\ntarget.y: {1}", grid.view.follow.target.x, grid.view.follow.target.y)
						: "",
				);
				text = stringParams("[{0}] REC Gameplay footage", choose(" ", "x", "?", " ", "!", "?", "0", "1", " ", " ", " "))
				if (Core.Collections.Lists.size(getShroomManager().shrooms) > 0) {
					/*
					text = stringParams("{0}\nshrooms: {1}",
						text,
						Core.Collections.Lists.size(getShroomManager().shrooms),
					);
					*/
				}
				Core.GPU.setConfig({
					font: asset_font_ibm_ps2thin4,
					horizontalAlign: GM_HALIGN_LEFT,
					verticalAlign: GM_VALIGN_TOP,
				});
				Core.Fonts.Render.outlinedText(text, 32, 32);
			}
			
			bktglitch_activate(GuiWidth, GuiHeight);
			__bktgtlich_pass_uniforms_from_ui();
			Core.Surfaces.render(this.gameSurface);
			bktglitch_deactivate();
			
			var lyricsSurface = getLyricsRenderer().lyricsSurface;
			if (Core.Surfaces.is(lyricsSurface)) {
				Core.Surfaces.render(lyricsSurface);	
			}
			
			if (!global.isGameplayStarted) {
				this.GMObject.renderIntro();
				
			} else {
				//this.GMObject.renderHUD();
				//renderDebugText(this);
			}
		}),
	}

	this.GMObject.create({ 
		grid: createGridController(), 
		midiMatrix: generateDefaultMidiMatrixController() 
	});
	
	#region 3D

	x = 4096;
	y = 5356;
	z = 0;
	zoom = 5000;
	cameraDirection = 270;
	cameraPitch = -70;
	viewMatrix = null;
	projectionMatrix = null;
	isMouseLookEnabled = false
	pitchTimer = 0.0;
	directionTimer = 0.0;
	shaderTimer = 0.0;
	shaderDuration = random(8);
	enableShader = false;
	mouseLook = method(this, function() {
		
		this.pitchTimer = incrementTimer(this.pitchTimer, pi * 2, 1 / (GAME_FPS * 2));
		this.directionTimer = incrementTimer(this.pitchTimer, pi * 2);
		this.cameraPitch += sin(this.pitchTimer) * 0.029;
		this.cameraDirection -= cos(this.directionTimer) * 0.023;
		var pitchTimerSize = 2.9;
		this.z += cos(this.pitchTimer) * pitchTimerSize;
		
		if (this.enableShader) {
			this.shaderTimer = incrementTimer(this.shaderTimer, this.shaderDuration);
			if (timerFinished(this.shaderTimer)) {
			
				this.shaderDuration = random(6) + 1.3;
				var shaderKeys = [ "0x4", "1x4", "2x4", "3x4", "0x5", "1x5", "2x5", "3x5" ];
				var key = getRandomValueFromArray(shaderKeys);
				var button = Core.Collections.Maps.get(this.GMObject.state.midiMatrix.keymapConfig, key);
				button.pressed(button, key);
			}
		}
		
		this.isMouseLookEnabled = keyboard_check_pressed(vk_f1)
			? !this.isMouseLookEnabled 
			: this.isMouseLookEnabled;
		
		if (this.isMouseLookEnabled) {
			
			this.cameraDirection -= (window_mouse_get_x() - window_get_width() / 2) / 10;
		    this.cameraPitch -= (window_mouse_get_y() - window_get_height() / 2) / 10;
		    this.cameraPitch = clamp(this.cameraPitch, -85, 85);
		    window_mouse_set(window_get_width() / 2, window_get_height() / 2);
		}

	    var move_speed = 16;
	    var dx = 0;
	    var dy = 0;
		var dz = 0;
		
	    if (keyboard_check(ord("A"))) {
	        dx += dsin(this.cameraDirection) * move_speed;
	        dy += dcos(this.cameraDirection) * move_speed;
			print(cameraDirection, cameraPitch, this.x, this.y, this.z);
	    }

	    if (keyboard_check(ord("D"))) {
	        dx -= dsin(this.cameraDirection) * move_speed;
	        dy -= dcos(this.cameraDirection) * move_speed;
			print(cameraDirection, cameraPitch, this.x, this.y, this.z);
	    }

	    if (keyboard_check(ord("W"))) {
	        dx -= dcos(this.cameraDirection) * move_speed;
	        dy += dsin(this.cameraDirection) * move_speed;
			print(cameraDirection, cameraPitch, this.x, this.y, this.z);
	    }

	    if (keyboard_check(ord("S"))) {
	        dx += dcos(this.cameraDirection) * move_speed;
	        dy -= dsin(this.cameraDirection) * move_speed;
			print(cameraDirection, cameraPitch, this.x, this.y, this.z);
	    }
		
		if (keyboard_check(ord("Q"))) {
	        dz += move_speed;
			print(cameraDirection, cameraPitch, this.x, this.y, this.z, this.zoom * this.xScale);
	    }

	    if (keyboard_check(ord("E"))) {
	        dz -= move_speed;
			print(cameraDirection, cameraPitch, this.x, this.y, this.z, this.zoom * this.xScale);
	    }
		
		this.x += dx;
		this.y += dy;
		this.z += dz;
	});
	
	gpu_set_ztestenable(false);
	gpu_set_zwriteenable(false);
	gpu_set_cullmode(cull_counterclockwise);
	application_surface_draw_enable(false);


	vertex_format_begin();
	vertex_format_add_position_3d();
	vertex_format_add_normal();
	vertex_format_add_texcoord();
	vertex_format_add_color();
	vertexFormat = vertex_format_end();
	vertexBuffer = vertex_create_buffer();
	vertex_begin(vertexBuffer, vertexFormat);
	var _width = this.GMObject.state.grid.pixelWidth;
	var _height = this.GMObject.state.grid.pixelHeight;
	var color = GM_COLOR_WHITE;
		
	appendPointToVertexBuffer(vertexBuffer, 0, 0, 0, 0, 0, 1, 0, 0, color, 1);
    appendPointToVertexBuffer(vertexBuffer, _width, 0, 0,  0, 0, 1, 1, 0, color, 1);
    appendPointToVertexBuffer(vertexBuffer, _width, _height, 0, 0, 0, 1, 1, 1, color, 1);

    appendPointToVertexBuffer(vertexBuffer, _width, _height, 0, 0, 0, 1, 1, 1, color, 1);
    appendPointToVertexBuffer(vertexBuffer, 0, _height, 0, 0, 0, 1, 0, 1, color, 1);
    appendPointToVertexBuffer(vertexBuffer, 0, 0, 0, 0, 0, 1, 0, 0, color, 1);
	vertex_end(vertexBuffer);
	
	#endregion
	
	enableVideo = true;
