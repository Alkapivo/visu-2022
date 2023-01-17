///@description

	super();
	registerSceneRenderer(this);
	setRendererResizeStrategyHandler(this, defaultResizeStrategy);
	bktglitch_init();
	__bktgtlich_ui_init()
	initializeShaderCRT(this);
	initializeShaderUpscalingBicubic(this);
	initializeShaderUpscalingHQ4X(this);
	initializeShaderCRT(this);
	
	#region Fields
///@public:

	bpmController = createBPMController({ bpm: getPropertyReal("base-timeline.bpm", GAME_FPS) });
	
	///@type {Optional<JumbotronEvent>}
	jumbotronEvent = null;
	
	///@type {Integer}
	jumbotronEventTimer = -1;
	
	jumbotronState = createMap();
	
	///@description Index is priority, value is shaderPipelineName
	///@type {List<String>}
	shaderPipelinesNames = createList();
	
	///@type {Map<String::ShaderPipeline>}
	shaderPipelines = createMap();
	
	///@type {Map<AssetShader::AssetScript>}
	shaderHandlers = createMap();
	
	///@type {Map<AssetShader::AssetScript>}
	shaderUniformSetters = createMap();
	
	///@type {Repository<ShaderTemplate>}
	shaderTemplateRepository = createRepository("shaderTemplateRepository", "ShaderTemplate", createMap());
	
///@private:

	///@type {Surface}
	applicationSurface = createSurface(global.guiWidth, global.guiHeight);

	///@type {Surface}
	screenSurface = createSurface(global.guiWidth, global.guiHeight);
	
	///@type {Surface}
	gameSurface = createSurface(global.viewWidth, global.viewHeight);

	///@type {Surface}
	shaderSurface = createSurface(global.viewWidth, global.viewHeight, true);
		
	///@type {Surface}
	guiSurface = createSurface(global.guiWidth, global.guiHeight, true);
	
	///@type {Surface}
	jumbotronSurface = createSurface(global.guiWidth, global.guiHeight, true);
		
	///@type {Boolean}
	isStartupBlackout = true;
	
	///@type {Number}
	startupBlackoutTimer = 0.0;
	
	///@type {Timer}
	hudDrawClearTimer = 0.0;
	
	///@type {Number}
	previousScoreValue = 0.0;
	
	///@type {List<ScoreNotifyEffectTask>}
	scoreNotifyEffectPipeline = createList();
	
	///@type {Integer}
	hudVisible = getPropertyBoolean("game.hud.visible", true);
	
	///@type {Integer}
	hudPrimaryFontSize = getPropertyReal("game.hud.primaryFontSize", 0);
	
	///@type {integer}
	hudSecondaryFontSize = getPropertyReal("game.hud.secondaryFontSize", 0);
	
	///@type {String}
	hudLocation = getPropertyString("game.hud.location", "bottom");	
	
	///@type {FontFamily}
	hudFontFamily = fetchFontFamily(getPropertyString("game.hud.fontFamily", "asset_font_jetbrainsmono"));
	
	///@type {Boolean}
	enableShaderCRT = false;//getPropertyBoolean("renderer.enableShaderCRT", true);
		
	///@type {Number}
	shaderCRTUniformValueEnableScanlines = getPropertyReal("shaderCRTUniformValueEnableScanlines", 1.0);
		
	///@type {Number}
	shaderCRTUniformValueDistortionAmount = getPropertyReal("shaderCRTUniformValueDistortionAmount", 0.6);
	
	///@type {Number}
	shaderCRTUniformValueCornerSize = getPropertyReal("shaderCRTUniformValueCornerSize", 0.1);
	
	///@type {Number}
	shaderCRTUniformValueCornerSmoothness = getPropertyReal("shaderCRTUniformValueCornerSmoothness", 120.0);
	
	///@type {Number}
	shaderCRTUniformValueBrightness = getPropertyReal("shaderCRTUniformValueBrightness", 1.0);
	
	///@type {Number}
	shaderCRTUniformValueNoiseSize = getPropertyReal("shaderCRTUniformValueNoiseSize", 0.16);
	
	///@type {Number}
	shaderCRTTimer = 0.0;
	
	///@type {Sprite}
	barPointer = createSprite(asset_texture_visu_player, 0, 1.0, 1.0, 1.0, 0.0, c_white);
	
	///@type {Boolean}
	enableProgressBar = getPropertyBoolean("gameplayRenderer.enableProgressBar", false);
	
	///@type {Boolean}
	isLoadingScreen = true;
	
	///@type {Number}
	mouseXPosition = 0.0;
	
	///@type {Number}
	mouseYPosition = 0.0;
	
	shaderPipeCurrentSize = 0.0;
	background = createSprite(asset_texture_empty, 0, 1.0, 1.0, 0.0, 0.0, c_white);
	previousBackground = createSprite(asset_texture_empty, 0, 1.0, 1.0, 0.0, 0.0, c_white);
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
	#region Stars
	for (var index = 0; index < getArrayLength(this.stars); index++) {
		var starPosition = createPosition(random(1000) / 1000, random(1000) / 1000);
		var starSpeed = choose(2, 3, 4, 5) * 0.0001;
		var starSize = choose(0.5, 0.7, 0.8, 1);
		var starAlpha = choose(0.5, 0.7, 0.8, 1) * 0.5;
		var starDestAlpha = choose(0.5, 0.7, 0.8, 1);
		var star = [
			starPosition,
			starSpeed,
			starSize,
			starAlpha,
			starDestAlpha
		];
		this.stars[index] = star;
	}
	#endregion
	
	#endregion
	
	GMObject = {
		bpmController: this.bpmController,
		bktgtlichUpdate: method(this, function() {
			
			var __isKeyPressed = injectInstanceVariable(this, "__isKeyPressed", false);
			__bktgtlich_ui_step(__isKeyPressed);
			setInstanceVariable(this, "__isKeyPressed", false);
		}),
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
		gmAlarm0: method(this, function() {
			__bktgtlich_ui_alarm();
		}),
		create: method(this, function() {
			
			#region ShaderTemplates
			var shaderTemplatesJsonString = Core.File.read({ 
				path: "data", 
				filename: "shader-templates.json", 
				withDialog: false 
			});
			parseJsonShaderTemplates(shaderTemplatesJsonString);
			#endregion
	
			#region ShaderPipelines initialization
			var shaderPipelinesInitializationArray = [
				createTuple("main", 3),
				createTuple("captured", 1),
			];
			initializeShaderPipelines(shaderPipelinesInitializationArray);
			#endregion
		}),
		cleanUp: method(this, function() {
	
			super();
			deregisterSceneRenderer();
	
			if (this.jumbotronEvent != null) {
				destroyJumbotronEvent(this.jumbotronEvent);	
			}
			destroyDataStructure(this.jumbotronState, Map, "Unable to destroy jumbotronState");

			destroyDataStructure(this.shaderPipelinesNames, List, "Unable to destroy shader pipelines names")
	
			for (var key = mapFirst(this.shaderPipelines); iteratorFinish(key); key = mapNext(this.shaderPipelines, key)) {
				var shaderPipeline = this.shaderPipelines[? key];
				destroyShaderPipeline(shaderPipeline);
			}
			destroyDataStructure(this.shaderPipelines, Map, "Unable to destroy shaderPipelines");

			destroyDataStructure(this.shaderHandlers, Map, "Unable to destroy shader handlers");
			destroyDataStructure(this.shaderUniformSetters, Map, "Unable to destroy shader uniform setters");
	
			destroySurface(this.applicationSurface);
			destroySurface(this.screenSurface);
			destroySurface(this.gameSurface);
			destroySurface(this.shaderSurface);		
			destroySurface(this.guiSurface);
			destroySurface(this.jumbotronSurface);
	
			destroyDataStructure(this.scoreNotifyEffectPipeline, List, "Unable to destroy scoreNotifyEffectPipeline");
		}),
		updatePost: method(this, function() {
			this.GMObject.shaderPipelineDispatcher();
			this.GMObject.bktgtlichUpdate();
			this.GMObject.bpmController.update(this.bpmController);
		}),
		preRender: method(this, function() {
			var midiMatrixController = getInstanceVariable(getGameController(), "midiMatrixController");
			if (isOptionalPresent(getStructVariable(midiMatrixController, "preRender"))) {

				midiMatrixController.preRender(midiMatrixController);
			}
		}),
		render: method(this, function() {
			
			this.shaderSurface = Core.Surfaces.get(this.shaderSurface, ViewWidth, ViewHeight, true);
			this.gameSurface = Core.Surfaces.get(this.gameSurface, ViewWidth, ViewHeight, true);
			this.screenSurface = Core.Surfaces.get(this.screenSurface, GuiWidth, GuiHeight, true);
	
			#region Draw to gameSurface
			gpuSetSurfaceTarget(this.gameSurface);
			var gridRenderer = getGridRenderer();
			draw_clear_alpha(gridRenderer.colorGridBackground, 1.0);
			
			var backgroundAlphaMargin = 0.25;
			var backgroundAlpha = getSpriteAlpha(this.background);
			backgroundAlpha = clamp(backgroundAlpha + applyDeltaTime(), 0.0, 1.0 - backgroundAlphaMargin);
			setSpriteAlpha(this.background, backgroundAlpha);
			setSpriteAlpha(this.previousBackground, 1.0 - backgroundAlphaMargin - backgroundAlpha);

			if (getSpriteAlpha(this.previousBackground) > backgroundAlphaMargin) {
		
				var previousBackgroundScale = RealWidth > RealHeight 
					? RealWidth / getTextureWidth(getSpriteAssetIndex(this.previousBackground)) 
					: RealHeight / getTextureHeight(getSpriteAssetIndex(this.previousBackground)
				);
				drawSprite(
					this.previousBackground,
					RealWidth / 2.0,
					RealHeight / 2.0,
					previousBackgroundScale,
					previousBackgroundScale,
					getSpriteAlpha(this.previousBackground)	
				);
			}
	
			var backgroundScale = RealWidth > RealHeight 
				? RealWidth / getTextureWidth(getSpriteAssetIndex(this.background)) 
				: RealHeight / getTextureHeight(getSpriteAssetIndex(this.background)
			);
			drawSprite(
				this.background,
				RealWidth / 2.0,
				RealHeight / 2.0,
				backgroundScale,
				backgroundScale,
				getSpriteAlpha(this.background)
			);
	
			if (isOptionalPresent(this.foreground)) {
		
				/*
				if (keyboard_check_pressed(ord("I"))) {
					this.firstBlendPointer = clamp(this.firstBlendPointer + 1, 0, this.blendModesLength - 1);
					logger("firstBlendPointer {0}", LogType.DEBUG, this.firstBlendPointer);
				}
				if (keyboard_check_pressed(ord("K"))) {
					this.firstBlendPointer = clamp(this.firstBlendPointer- 1, 0, this.blendModesLength - 1);
					logger("firstBlendPointer {0}", LogType.DEBUG, this.firstBlendPointer);
				}
					
				if (keyboard_check_pressed(ord("O"))) {
					this.secondBlendPointer = clamp(this.secondBlendPointer + 1, 0, this.blendModesLength - 1);
					logger("secondBlendPointer {0}", LogType.DEBUG, this.secondBlendPointer);
				}
				if (keyboard_check_pressed(ord("L"))) {
					this.secondBlendPointer = clamp(this.secondBlendPointer - 1, 0, this.blendModesLength - 1);
					logger("secondBlendPointer {0}", LogType.DEBUG, this.secondBlendPointer);
				}
				*/
		
				this.firstBlendPointer = 8
				this.secondBlendPointer = 2
				//gpu_set_blendmode_ext(this.blendModes[this.firstBlendPointer], this.blendModes[this.secondBlendPointer]);
				gpu_set_blendmode(bm_add)
				var foregroundAlphaMargin = 0.0;
				var foregroundAlpha = getSpriteAlpha(this.foreground);
				foregroundAlpha = clamp(foregroundAlpha + applyDeltaTime(), 0.0, 1.0 - foregroundAlphaMargin);
				setSpriteAlpha(this.foreground, foregroundAlpha);
		
				this.foregroundTheta = incrementTimer(this.foregroundTheta, pi*2, 1 / (GAME_FPS * 3));
				this.cameraTheta = incrementTimer(this.cameraTheta, pi*2, 1 / (GAME_FPS * 5));
				var foregroundThetaFactor = 64;
		
				if (isOptionalPresent(this.previousForeground)) {
			
					setSpriteAlpha(this.previousForeground, 1.0 - foregroundAlphaMargin - foregroundAlpha)
					if (getSpriteAlpha(this.previousForeground) > foregroundAlphaMargin) {
		
						var previousForegroundScale = RealWidth > RealHeight 
							? RealWidth / getTextureWidth(getSpriteAssetIndex(this.previousForeground)) 
							: RealHeight / getTextureHeight(getSpriteAssetIndex(this.previousForeground)
						);
						drawSprite(
							this.previousForeground,
							(RealWidth / 2.0) + cos(foregroundTheta) * foregroundThetaFactor,
							(RealHeight / 2.0) + sin(foregroundTheta) * foregroundThetaFactor,
							previousForegroundScale * 1.1,
							previousForegroundScale * 1.1,
							getSpriteAlpha(previousForeground)	
						);
					}
				}
		
				var foregroundScale = RealWidth > RealHeight 
					? RealWidth / getTextureWidth(getSpriteAssetIndex(this.foreground))
					: RealHeight / getTextureHeight(getSpriteAssetIndex(this.foreground))
				drawSprite(
					this.foreground,
					(RealWidth / 2.0) + cos(foregroundTheta) * foregroundThetaFactor,
					(RealHeight / 2.0) + sin(foregroundTheta) * foregroundThetaFactor,
					foregroundScale * 1.1,
					foregroundScale * 1.1,
					getSpriteAlpha(this.foreground)
				);
		
				gpu_set_blendmode(bm_normal);
			}
	

			#region Render stars particles
			var gridRenderer = getGridRenderer();
			if (isOptionalPresent(gridRenderer)) {
		
				switch (this.starsRenderType) {
					case StarsRenderTypes.POINT:
			
						var invertedColorGridBackground = c_black;
						var colorGridBackground = getInstanceVariable(
							getGridRenderer(), 
							"colorGridBackground"
						);

						if (isNumber(colorGridBackground)) { // in gamemaker color is a number :)
	
							var red = clamp(255 - color_get_red(colorGridBackground), 0, 255);
							var green = clamp(255 - color_get_green(colorGridBackground), 0, 255);
							var blue = clamp(255 - color_get_blue(colorGridBackground), 0, 255);
							var invertedColorGridBackground = make_color_rgb(red, green, blue);
						}
			
						var intersectPosition = getLinesIntersectionPosition(
							[ gridRenderer.topLinePosition - (gridRenderer.topLineWidth * 0.5), gridRenderer.offsetTop ], 
							[ 0.5 - (gridRenderer.bottomLineWidth * 0.5), 1.0 - gridRenderer.offsetBottom ],
							[ gridRenderer.topLinePosition + (gridRenderer.topLineWidth * 0.5), gridRenderer.offsetTop ], 
							[ 0.5 + (gridRenderer.bottomLineWidth * 0.5), 1.0 - gridRenderer.offsetBottom ]);
							
						for (var index = 0; index < getArrayLength(stars); index++) {
							var star = stars[index];
							
							var starPosition = star[0];
							if (intersectPosition != null) {
								intersectPosition[@ 1] = intersectPosition[1] < -0.5 ? -0.5 : intersectPosition[1];
								var angle = getAngleBetweenPoints(star[0], intersectPosition) + 180;
								starPosition[0] += getXOnCircle(star[1], angle);
								starPosition[1] += getYOnCircle(star[1], angle);
							} else {
								starPosition[1] += 0.001;
							}
							if (starPosition[1] > 1.2) {
								star[3] = 0.2;
								starPosition = createPosition(
									((ViewWidth * 0.5) + (random((ViewWidth * 0.2) * 1000) / 1000) * choose(1, -1)) / GuiWidth,
									(random((ViewHeight * 0.2) * 1000) / 1000) / GuiHeight);
							}
							star[0] = starPosition;
							if (star[3] < star[4]) {
								star[3] += 0.004;	
							}
							
							var starSize = star[2];
							var starAlpha = star[3];
							draw_sprite_ext(
								asset_texture_star_1, 
								/*
								clamp(
									clamp(spriteNumber * starSize, 0.0, 1.0) -
									clamp(spriteNumber * starAlpha, 0.0, 1.0),
									0.0,
									1.0
								),
								*/
								0,//floor(random(spriteNumber)),
								starPosition[0] * ViewWidth, 
								starPosition[1] * ViewHeight,
								starSize,
								starSize,
								0,
								invertedColorGridBackground,
								starAlpha
							);
							
							this.stars[index] = star;
						}
						break;
				}
				
			}
			#endregion
	
			#region Render particleSurface BACKGROUND
			var particleManager = getParticleManager();
			if (isOptionalPresent(particleManager)) {
				var particleSurface = particleManager.particlesSurface[ParticleSystems.BACKGROUND];
				if (isSurfaceValid(particleSurface))  {
					drawSurface(
						particleSurface,
						0,
						0,
						getGridRendererXScale(),
						getGridRendererYScale(),
						getGridRendererAngle(),
						1.0,
						c_white,
						createPosition(0.5, 0.5));
				}
			}
			#endregion

			#region Render gridSurface
			var gridSurface = getGridRendererSurface();
			if (isOptionalPresent(gridSurface)) {
				var cameraShake = getGridRenderer().cameraShake;
			
				var xDirection = cos(cameraShake) > 0 ? 1 : -1;
				var yDirection = sin(cameraShake) > 0 ? 1 : -1;
				var xCameraShake = cameraShake > 0 ? 
					(random(cameraShake * 0.7) + (cameraShake * 0.3)) * xDirection :
					0.0;
				var yCameraShake = cameraShake > 0 ?
					(random(cameraShake * 0.7) + (cameraShake * 0.3)) * yDirection :
					0.0;
			
				gpuSetShader(shaderAbberation);
		
				var mousePositionFactor = 0.008;
				this.mouseXPosition = lerp(this.mouseXPosition, getMouseGuiX(), mousePositionFactor)
				this.mouseYPosition = lerp(this.mouseYPosition, getMouseGuiY(), mousePositionFactor)
				this.mouseXPosition = GuiWidth / 2.0;
				this.mouseYPosition = GuiHeight / 2.0;
				this.mouseXPosition = (GuiWidth / 2.0) + (sin(this.cameraTheta) * 64);
				this.mouseYPosition = (GuiHeight / 2.0) + (cos(this.cameraTheta) * 64);
		
				drawSurface(
					gridSurface,
					xCameraShake + (this.mouseXPosition - (GuiWidth / 2.0)),
					yCameraShake + (this.mouseYPosition - (GuiHeight / 2.0)),
					getGridRendererXScale(),
					getGridRendererYScale(),
					getGridRendererAngle() + gridRenderer.angleSwing,
					1.0,
					c_white,
					createPosition(0.5, 0.5)
				);
				gpuResetShader();
			}
			#endregion

			#region Render bossManager.bossSurface
			var bossManager = getBossManager();
			if (isOptionalPresent(bossManager)) {
				var bossSurface = bossManager.bossSurface
				if (isSurfaceValid(bossSurface)) {
					gpuSetShader(shaderAbberation);
					drawSurface(
						bossSurface,
						0,
						0,
						getGridRendererXScale(),
						getGridRendererYScale(),
						getGridRendererAngle(),
						1.0,
						c_white,
						createPosition(0.5, 0.5));
						gpuResetShader();
				}
			}
			#endregion
	
			#region Render particleSurface FOREGROUND
			if (isSurfaceValid(particleSurface))  {
				var particleSurface = particleManager.particlesSurface[ParticleSystems.FOREGROUND];
				drawSurface(
					particleSurface,
					0,
					0,
					getGridRendererXScale(),
					getGridRendererYScale(),
					getGridRendererAngle(),
					1.0,
					c_white,
					createPosition(0.5, 0.5)
				);
			}
			#endregion
			
			gpuResetSurfaceTarget();
			
			#endregion

			#region Draw to shaderSurface
			var shaderPipelinesNamesSize = getListSize(this.shaderPipelinesNames);
			for (var index = 0; index < shaderPipelinesNamesSize; index++) {
				var shaderPipelineName = Core.Collections.Lists.get(this.shaderPipelinesNames, index);
				var shaderPipeline = Core.Collections.Maps.get(this.shaderPipelines, shaderPipelineName);
		
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
							gpuSetSurfaceTarget(this.shaderSurface);
							drawClear(COLOR_TRANSPARENT);
							gpuSetShader(shader);
						
							runScript(uniformSetter, this, state, gridSurface);
							//renderSurface(gameSurface);
					
							var mousePositionFactor = 0.001;
							this.mouseXPosition = lerp(this.mouseXPosition, getMouseGuiX(), mousePositionFactor)
							this.mouseYPosition = lerp(this.mouseYPosition, getMouseGuiY(), mousePositionFactor)
							this.mouseXPosition = GuiWidth / 2.0;
							this.mouseYPosition = GuiHeight / 2.0;
							this.mouseXPosition = (GuiWidth / 2.0) + (sin(this.cameraTheta) * 64);
							this.mouseYPosition = (GuiHeight / 2.0) + (cos(this.cameraTheta) * 64);
					
							drawSurface(
								this.gameSurface,
								xCameraShake + (this.mouseXPosition - (GuiWidth / 2.0)),
								yCameraShake + (this.mouseYPosition - (GuiHeight / 2.0)),
								getGridRendererXScale(),
								getGridRendererYScale(),
								0,//getGridRendererAngle() + gridRenderer.angleSwing,
								alpha,
								c_white,
								createPosition(0.5, 0.5)
							);
					
							gpuResetShader();
							gpuResetSurfaceTarget();
						} else {						
							gpuSetSurfaceTarget(this.shaderSurface);
						
							drawClear(COLOR_TRANSPARENT);
							drawSurface(this.gameSurface, 0, 0);
						
							gpuResetSurfaceTarget();
						}

						// Render texture
						gpuSetSurfaceTarget(this.gameSurface);
						drawSurface(this.shaderSurface, 0, 0, 1.0, 1.0, 0.0, alpha, c_white, [ 0.5, 0.5 ]);
						global.shaderPipeLimit = 2;
						if (pipeSize > global.shaderPipeLimit) {
						
							var gridRendererSurface = getGridRendererSurface();
							gpu_set_blendmode(bm_add);
							renderSurface(
								gridRendererSurface, 
								xCameraShake + (this.mouseXPosition - (GuiWidth / 2.0)),
								yCameraShake + (this.mouseYPosition - (GuiHeight / 2.0)),
								getGridRendererXScale(),
								getGridRendererYScale(), 
								getGridRendererAngle() + gridRenderer.angleSwing, 
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
			#endregion

		}),
		renderGUI: method(this, function() {
			this.applicationSurface = getSurface(this.applicationSurface, GuiWidth, GuiHeight, true);
			this.screenSurface = getSurface(this.screenSurface, ViewWidth, ViewHeight, true);
			this.guiSurface = getSurface(this.guiSurface, GuiWidth, GuiHeight, true);
			this.jumbotronSurface = getSurface(this.jumbotronSurface, GuiWidth, GuiHeight, true);
			this.gameSurface = getSurface(this.gameSurface, ViewWidth, ViewHeight, true);

			gpu_set_texfilter(true);
			gpuSetSurfaceTarget(this.guiSurface);
	
			drawClear(COLOR_TRANSPARENT);
	
			gpuResetSurfaceTarget();

			#region Draw to jumbotronSurface
			gpuSetSurfaceTarget(this.jumbotronSurface);
			if (this.jumbotronEvent != null) {
		
				var jumbotronAlpha = 1.0;
				var jumbotronFadeTime = 0.2
				var duration = getJumbotronEventDuration(this.jumbotronEvent);
				if (this.jumbotronEventTimer < jumbotronFadeTime) {
		
					jumbotronAlpha = this.jumbotronEventTimer / jumbotronFadeTime
				}
		
				if (this.jumbotronEventTimer > duration - jumbotronFadeTime) {
			
					jumbotronAlpha = 1.0 - ((this.jumbotronEventTimer - (duration - jumbotronFadeTime)) / jumbotronFadeTime)
				}
		
				drawClear([ 0.77, 0.0, 0.21, jumbotronAlpha * 0.4]); // TODO getJumbotronEventBackgroundColor
				var jumbotronHandlerName = getJumbotronEventHandlerName(this.jumbotronEvent)
				switch (jumbotronHandlerName) {
					case "message":
						#region
						var gridColor = colorToGMColor(getGridRenderer().colorGridWheelTopLeft); 
						var positionX = 0.5 * GuiWidth;
						var positionY = 0.5 * GuiHeight;
						var font = asset_font_start_screen;
						draw_set_font(font);
						draw_set_halign(fa_middle);
						draw_set_valign(fa_center);
				
						var text = getJumbotronEventMessage(this.jumbotronEvent);
						var fontColorTopLeft = c_white;
						var fontColorTopRight= gridColor;
						var fontColorBottomRight = c_white;
						var fontColorBottomLeft = c_fuchsia;
						draw_text_color(
							positionX,
							positionY, 
							text,
							fontColorTopLeft,
							fontColorTopRight,
							fontColorBottomRight,
							fontColorBottomLeft,
							jumbotronAlpha);
						#endregion
						break;
				}

				this.jumbotronEventTimer = incrementTimer(this.jumbotronEventTimer, duration);
				if (timerFinished(this.jumbotronEventTimer)) {
					this.jumbotronEventTimer = 0.0;
					this.jumbotronEvent = createEmptyOptional();
				}
			} else {
				drawClear(COLOR_TRANSPARENT);	
			}
			gpuResetSurfaceTarget();
			#endregion

			#region Draw to screenSurface
			gpuSetSurfaceTarget(this.screenSurface);
			var verticalScreens = clamp(getGridRenderer().verticalScreens, 1.0, 32.0);
			var verticalScreensSize = ceil(verticalScreens);
			var horizontalScreens = clamp(getGridRenderer().horizontalScreens, 1.0, 32.0);	
			var horizontalScreensSize = ceil(horizontalScreens);
			for (var yIndex = 0; yIndex < verticalScreensSize; yIndex++) {
		
				for (var xIndex = 0; xIndex < horizontalScreensSize; xIndex++) {
			
					var applicationSurfaceWidth = round(GuiWidth / horizontalScreens);
					var applicationSurfaceHeight = round(GuiHeight / verticalScreens);
					drawSurfaceStretched(
						this.gameSurface, 
						xIndex * applicationSurfaceWidth,
						yIndex * applicationSurfaceHeight,
						applicationSurfaceWidth,
						applicationSurfaceHeight
					);
				}
			}
	
			var lyricsRenderer = getLyricsRenderer();
			if (isOptionalPresent(lyricsRenderer)) {
				if (lyricsRenderer.enableLyricsRenderer) {
			
					var lyricsSurface = lyricsRenderer.lyricsSurface;
					drawSurfaceStretched(lyricsSurface, 0, 0, GuiWidth, GuiHeight);
				}
			}
			drawSurfaceStretched(this.guiSurface, 0, 0, GuiWidth, GuiHeight);
			drawSurfaceStretched(this.jumbotronSurface, 0, 0, GuiWidth, GuiHeight);
			gpuResetSurfaceTarget();
			#endregion
	
			#region Draw to applicationSurface
			gpuSetSurfaceTarget(this.applicationSurface);
			if (this.enableShaderCRT) {
		
				this.shaderCRTTimer = incrementTimer(shaderCRTTimer, 10, 1 / GAME_FPS)
				gpuSetShader(shaderCRT);
				gpuSetShaderUniformFloat(this.shaderCRTUniformEnableScanlines, this.shaderCRTUniformValueEnableScanlines);
			    gpuSetShaderUniformFloat(this.shaderCRTUniformSize, ViewWidth, ViewHeight, GuiWidth, GuiHeight);
				gpuSetShaderUniformFloat(this.shaderCRTUniformDistortionAmount, this.shaderCRTUniformValueDistortionAmount);
				gpuSetShaderUniformFloat(this.shaderCRTUniformCornerSize, this.shaderCRTUniformValueCornerSize);
				gpuSetShaderUniformFloat(this.shaderCRTUniformCornerSmoothness, this.shaderCRTUniformValueCornerSmoothness);
				gpuSetShaderUniformFloat(this.shaderCRTUniformBrightness, this.shaderCRTUniformValueBrightness);
				gpuSetShaderUniformFloat(this.shaderCRTUniformNoiseSize, this.shaderCRTUniformValueNoiseSize);
			    gpuSetShaderUniformFloat(this.shaderCRTUniformTimer, this.shaderCRTTimer);
			
				/*
				var _alpha = draw_get_alpha();
				var factor = 0.037;
				draw_set_alpha(factor);
				draw_rectangle_color(0, 0, GuiWidth, GuiHeight, c_black, c_black, c_black, c_black, false);
				draw_set_alpha(_alpha);
				*/
				//drawSurfaceStretched(screenSurface, getMouseGuiX() - (GuiWidth / 2.0), getMouseGuiY() - (GuiHeight / 2.0), global.guiWidth, global.guiHeight);	
				drawSurfaceStretched(this.screenSurface, 0, 0, GuiWidth, GuiHeight);
		
				gpuResetShader();
			} else {

				/*
				var _alpha = draw_get_alpha();
				var factor = 0.037;
				draw_set_alpha(factor);
				draw_rectangle_color(0, 0, GuiWidth, GuiHeight, c_black, c_black, c_black, c_black, false);
				draw_set_alpha(_alpha);
				*/
				//drawSurfaceStretched(screenSurface, getMouseGuiX() - (GuiWidth / 2.0), getMouseGuiY() - (GuiHeight / 2.0), global.guiWidth, global.guiHeight);	
				drawSurfaceStretched(this.screenSurface, 0, 0, GuiWidth, GuiHeight);
			}
			gpuResetSurfaceTarget();
			#endregion
	
			#region Render applicationSurface
			if (!getCamera().isMode3D) {
		
				//gpuSetShader(shaderAbberation);
				bktglitch_activate(GuiWidth, GuiHeight);
				__bktgtlich_pass_uniforms_from_ui();
				drawSurfaceStretched(applicationSurface, 0, 0, RealWidth, RealHeight);
				bktglitch_deactivate();
				//gpuResetShader();
			}
			#endregion
		
			if (global.isGameplayStarted) {
		
				if (!isStackEmpty(this.texturesStack)) {
	
					var texture = popStack(this.texturesStack);
					renderTexture(
						texture, 
						random(GuiWidth * 0.7), 
						random(GuiHeight * 0.7), 
						random(sprite_get_number(texture)),
						0.0,
						1.0,
						1.0,
						0.5
					);
				}
		
				var midiMatrixController = getInstanceVariable(getGameController(), "midiMatrixController");
				if (isStruct(midiMatrixController)) {
	
					var surface = midiMatrixController.surface;
					if (isSurfaceValid(surface)) {
			
						renderSurface(surface);
					}
				}
	
				var midiController = getGameController().midiMatrixController;
				var currentRecording = midiController.eventsRecorder.getCurrentRecording(midiController.eventsRecorder);
				if (isStruct(currentRecording)) {
		
					draw_rectangle_color(
						0.0 + 32,
						RealHeight - 32 - 24,
						0.0 + 32 + 24,
						RealHeight - 32,
						c_fuchsia,
						c_fuchsia,
						c_fuchsia,
						c_fuchsia,
						false
					)
				} else {
	
					draw_set_halign(fa_left);
					draw_set_valign(fa_bottom);
					draw_set_font(asset_font_ibm_ps2thin4);
					var gameplayData = getGameController().gameplayData;
					var text = stringParams(
						"Shroom counter:    {0}\n" +
						"Respawn counter:   {1}\n" +
						"Active shaders:    {2}\n",
						gameplayData.shroomCounter,
						gameplayData.respawnCounter,
						this.shaderPipeCurrentSize
					);
			
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
			}
	
			if (!global.isGameplayStarted) {
	
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
			}
		}),
	}

	this.GMObject.create();
	
