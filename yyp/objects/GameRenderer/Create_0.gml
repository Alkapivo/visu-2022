///@description

	super();
	registerSceneRenderer(this);
	setRendererResizeStrategyHandler(id, (isHandheld() ? handheldResizeStrategy : defaultResizeStrategy));
	bktglitch_init();
	__bktgtlich_ui_init()
	
	#region Fields
///@public:

	var __bpm = getPropertyReal("base-timeline.bpm", GAME_FPS) * 2;
	bpmController = createBPMController({ bpm: __bpm });
	
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
	barPointer = createSprite(asset_sprite_spaceship, 0, 1.0, 1.0, 1.0, 0.0, c_white);
	
	///@type {Boolean}
	enableProgressBar = getPropertyBoolean("gameplayRenderer.enableProgressBar", false);
	
	///@type {Boolean}
	isLoadingScreen = true;
	
	///@type {Number}
	mouseXPosition = 0.0;
	
	///@type {Number}
	mouseYPosition = 0.0;
	
	shaderPipeCurrentSize = 0.0;
	#endregion
	
	#region Shaders initialization
	initializeShaderEmboss(this);
	addToMap(shaderHandlers, shaderEmboss, shaderEmbossHandler);
	addToMap(shaderUniformSetters, shaderEmboss, shaderEmbossUniformSetter);
	
	initializeShaderRevert(this);
	addToMap(shaderHandlers, shaderRevert, shaderRevertHandler);
	addToMap(shaderUniformSetters, shaderRevert, shaderRevertUniformSetter);
	
	initializeShaderLED(this);
	addToMap(shaderHandlers, shaderLED, shaderLEDHandler);
	addToMap(shaderUniformSetters, shaderLED, shaderLEDUniformSetter);
	
	initializeShaderMagnify(this);
	addToMap(shaderHandlers, shaderMagnify, shaderMagnifyHandler);
	addToMap(shaderUniformSetters, shaderMagnify, shaderMagnifyUniformSetter);
	
	initializeShaderMosaic(this);
	addToMap(shaderHandlers, shaderMosaic, shaderMosaicHandler);
	addToMap(shaderUniformSetters, shaderMosaic, shaderMosaicUniformSetter);
	
	initializeShaderPosterization(this);
	addToMap(shaderHandlers, shaderPosterization, shaderPosterizationHandler);
	addToMap(shaderUniformSetters, shaderPosterization, shaderPosterizationUniformSetter);
	
	initializeShaderRipple(this);
	addToMap(shaderHandlers, shaderRipple, shaderRippleHandler);
	addToMap(shaderUniformSetters, shaderRipple, shaderRippleUniformSetter);
	
	initializeShaderScanlines(this);
	addToMap(shaderHandlers, shaderScanlines, shaderScanlinesHandler);
	addToMap(shaderUniformSetters, shaderScanlines, shaderScanlinesUniformSetter);
	
	initializeShaderShockWave(this);
	addToMap(shaderHandlers, shaderShockWave, shaderShockWaveHandler);
	addToMap(shaderUniformSetters, shaderShockWave, shaderShockWaveUniformSetter);
	
	initializeShaderWave(this);
	addToMap(shaderHandlers, shaderWave, shaderWaveHandler);
	addToMap(shaderUniformSetters, shaderWave, shaderWaveUniformSetter);
	
	initializeShaderThermal(this);
	addToMap(shaderHandlers, shaderThermal, shaderThermalHandler);
	addToMap(shaderUniformSetters, shaderThermal, shaderThermalUniformSetter);
	
	initializeShaderSketch(this);
	addToMap(shaderHandlers, shaderSketch, shaderSketchHandler);
	addToMap(shaderUniformSetters, shaderSketch, shaderSketchUniformSetter);
	
	initializeShaderAbberation(this);
	addToMap(shaderHandlers, shaderAbberation, shaderAbberationHandler);
	addToMap(shaderUniformSetters, shaderAbberation, shaderAbberationUniformSetter);
	
	initializeShaderUpscalingBicubic(this);
	initializeShaderUpscalingHQ4X(this);
	initializeShaderCRT(this);
	texelSize = 0.0;
	#endregion
	
	#region ShaderPipelines initialization
	var shaderPipelinesInitializationArray = [
		createTuple("main", 3),
		createTuple("captured", 1),
	];
	initializeShaderPipelines(shaderPipelinesInitializationArray);
	#endregion
	
	#region Stars
	starsRenderType = StarsRenderTypes.POINT;
	stars = createArray(255);
	for (var index = 0; index < getArrayLength(stars); index++) {
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
		stars[index] = star;
	}
	#endregion

	background = createSprite(asset_texture_empty, 0, 1.0, 1.0, 0.0, 0.0, c_white);
	previousBackground = createSprite(asset_texture_empty, 0, 1.0, 1.0, 1.0, 0.0, c_white);
	foreground = createSprite(asset_texture_empty, 0, 1.0, 1.0, 1.0, 0.0, c_white);
	previousForeground = createSprite(asset_texture_empty, 0, 1.0, 1.0, 0.0, 0.0, c_white);
	foregroundTheta = 0.0;
	trackTimer = 0.0;
	cameraTheta = 0.0;

/// @description Insert description here
// You can write your code in this editor

//Begin defining a format
vertex_format_begin();

vertex_format_add_position_3d();//Add 3D position info
vertex_format_add_color();//Add color info
vertex_format_add_texcoord();//Texture coordinate info

//End building the format, and assign the format to the variable "format"
format = vertex_format_end();

//Create the vertex buffer. Another function, vetex_create_buffer_ext can be used to create the buffer with its size predefined and fixed. 
//With the standard vertex_create_buffer, the buffer will just grow automatically as needed.
vb_plane = vertex_create_buffer();

//Begin building the buffer using the format defined previously
vertex_begin(vb_plane, format);

//Using size to keep it square if we decide to change how bug it is.
var size = 32;

//Add the six vertices needed to draw a simple square plane. 
//The normals are all pointing to (0,0,-1) (upward, in our case)

//The first triangle
vertex_position_3d(vb_plane, -size, -size, 0);
vertex_color(vb_plane, c_white, 1);
vertex_texcoord(vb_plane, 0, 0);

vertex_position_3d(vb_plane, size, -size, 0);
vertex_color(vb_plane, c_white, 1);
vertex_texcoord(vb_plane, 1, 0);

vertex_position_3d(vb_plane, -size, size, 0);
vertex_color(vb_plane, c_white, 1);
vertex_texcoord(vb_plane, 0, 1);

//The second triangle. The winding order has been maintained so drawing is consistent if culling is enabled.
vertex_position_3d(vb_plane, -size, size, 0);
vertex_color(vb_plane, c_white, 1);
vertex_texcoord(vb_plane, 0, 1);

vertex_position_3d(vb_plane, size, -size, 0);
vertex_color(vb_plane, c_white, 1);
vertex_texcoord(vb_plane, 1, 0);

vertex_position_3d(vb_plane, size, size, 0);
vertex_color(vb_plane, c_white, 1);
vertex_texcoord(vb_plane, 1, 1);

//Finish building the buffer.
vertex_end(vb_plane);

testSurface = null;


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
]

firstBlendPointer = 1;
secondBlendPointer = 3;
blendModesLength = getArrayLength(blendModes);