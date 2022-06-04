///@description create()

	#macro TIANANMEN_SQUARE null

	global.isGameplayStarted = false;
	global.__deaths = 0;
	global.__score = 0;
	global.__launchapdEvents = 0;

	super();
	registerSceneController(this);
	
	#region Fields
///@public:

	///@type {?InputHandler}
	inputHandler = createInputHandler(isHandheld() ? TouchInputHandler : KeyboardInputHandler);

	///@type {Number}
	gameplayTime = 0;
	
	///@type {Struct<MidiMatrixController>}
	#region
	
	function buttonIsEnabled(button) {
		
		var isEnabled = getStructVariable(button, "isEnabled") == true;
		setStructVariable(button, "isEnabled", !isEnabled)
	}
	
	midiMatrixController = createMidiMatrixController(
		createMapFromTupleArray(
			[
			    //top left
			    createTuple(
			        "0x0",
			        {
						displayName: "screens_0x0",
			            keyboardMapping: [ "1", "5"],
			            pressed: function(button, key) {
							
							var screens = 1.0;
							logger("Set screens: {0}", LogType.INFO, screens);
							setScreensTarget(screens);	
			            }
			        }
			    ),
			    createTuple(
			        "1x0",
			        {
						displayName: "screens_0x1",
			            keyboardMapping: [ "2", "5"],
			            pressed: function(button, key) {
							
							var screens = 2.0;
							logger("Set screens: {0}", LogType.INFO, screens);
							setScreensTarget(screens);	
			            }
			        }
			    ),
			    createTuple(
			        "2x0",
			        {
						displayName: "screens_0x2",
			            keyboardMapping: [ "3", "5" ],
			            pressed: function(button, key) {
							
							var previousFactor = getScreensFactor();
							var nextFactor = fetchNextValueFromSortedAscendingArray(global.screensFactorValues, previousFactor);
							logger("Update screens factor: from {0} to {1}", LogType.INFO, previousFactor, nextFactor);
							setScreensFactor(nextFactor);
			            }
			        }
			    ),
			    createTuple(
			        "3x0",
			        {
						displayName: "top-line_0x3",
			            keyboardMapping: [ "4", "5" ],
			            pressed: function(button, key) {
							
							var topLineWidth = 0.40;
							var bottomLineWidth = 0.40;
							logger("Set topLineWidth: {0}. bottomLineWidth: {1}", LogType.INFO, topLineWidth, bottomLineWidth);
							var fieldModifierTask = createFieldModifierTask(getGridRenderer(), "topLineWidth", topLineWidth, 0.001, 1, 0)
							sendFieldModifierTask(fieldModifierTask);
							
							var fieldModifierTask = createFieldModifierTask(getGridRenderer(), "bottomLineWidth", bottomLineWidth, 0.001, 1, 0)
							sendFieldModifierTask(fieldModifierTask);
			            }
			        }
			    ),
			    createTuple(
			        "0x1",
			        {
						displayName: "screens_0x1",
			            keyboardMapping: [ "Q", "5" ],
			            pressed: function () {
							
							var screens = 3.0;
							logger("Set screens: {0}", LogType.INFO, screens);
							setScreensTarget(screens);	
			            }
			        }
			    ),
			    createTuple(
			        "1x1",
			        {
						displayName: "screens_1x1",
			            keyboardMapping: [ "W", "5" ],
			            pressed: function () {
							
							var screens = 4.0;
							logger("Set screens: {0}", LogType.INFO, screens);
							setScreensTarget(screens);	
			            }
			        }
			    ),
			    createTuple(
			        "2x1",
			        {
						displayName: "screens_2x1",
			            keyboardMapping: [ "E", "5" ],
			            pressed: function () {
							
							var previousFactor = getScreensFactor();
							var nextFactor = fetchPreviousValueFromSortedAscendingArray(global.screensFactorValues, previousFactor);
							logger("Update screens factor: from {0} to {1}", LogType.INFO, previousFactor, nextFactor);
							setScreensFactor(nextFactor);
			            }
			        }
			    ),
			    createTuple(
			        "3x1",
			        {
						displayName: "empty_0x0",
			            keyboardMapping: [ "R", "5" ],
			            pressed: function () {

							var gridSpeed = 0.0011;
							logger("Set gridSpeed to: {0}", LogType.INFO, gridSpeed);
							setInstanceVariable(getGridRenderer(), "separatorSpeed", gridSpeed);
			            }
			        }
			    ),
			    createTuple(
			        "0x2",
			        {
						displayName: "angle_0x0",
			            keyboardMapping: [ "A", "5" ],
			            pressed: function () {

							var target = 45;
							logger("Set angle target: {0}", LogType.INFO, target);
							setAngleTarget(target);
			            }
			        }
			    ),
			    createTuple(
			        "1x2",
			        {
						displayName: "angle_1x0",
			            keyboardMapping: [ "S", "5" ],
			            pressed: function () {
							
							var target = 0;
							logger("Set angle target: {0}", LogType.INFO, target);
							setAngleTarget(target);
			            }
			        }
			    ),
			    createTuple(
			        "2x2",
			        {
			            keyboardMapping: [ "D", "5" ],
			            pressed: function () {
							
							var target = 315;
							logger("Set angle target: {0}", LogType.INFO, target);
							setAngleTarget(target);
			            }
			        }
			    ),
			    createTuple(
			        "3x2",
			        {
			            keyboardMapping: [ "F", "5" ],
			            pressed: function () {
							
							var factor = 0.25;
							logger("Set angle factor: {0}", LogType.INFO, factor);
							setAngleFactor(factor);
			            }
			        }
			    ),
			    createTuple(
			        "0x3",
			        {
			            keyboardMapping: [ "Z", "5" ],
			            pressed: function () {
							
							var target = 90;
							logger("Set angle target: {0}", LogType.INFO, target);
							setAngleTarget(target);
			            }
			        }
			    ),
			    createTuple(
			        "1x3",
			        {
			            keyboardMapping: [ "X", "5" ],
			            pressed: function () {
							
							var swingGrid = getInstanceVariable(getGridRenderer(), "swingGrid");
							logger("Set swingGrid: {0}", LogType.INFO, swingGrid ? "true" : "false");
							setInstanceVariable(getGridRenderer(), "swingGrid", !(swingGrid == true));
			            }
			        }
			    ),
			    createTuple(
			        "2x3",
			        {
			            keyboardMapping: [ "C", "5" ],
			            pressed: function () {
							
							var target = 270;
							logger("Set angle target: {0}", LogType.INFO, target);
							setAngleTarget(target);
			            }
			        }
			    ),
			    createTuple(
			        "3x3",
			        {
			            keyboardMapping: [ "V", "5" ],
			            pressed: function () {
							
							var factor = 0.5;
							logger("Set angle factor: {0}", LogType.INFO, factor);
							setAngleFactor(factor);
			            }
			        }
			    ),

			    //top right
			    createTuple(
			        "4x0",
			        {
			            keyboardMapping: [ "1", "6"],
			            pressed: function () {
							
							var topLineWidth = 0.0;
							var bottomLineWidth = 1.0;
							logger("Set topLineWidth: {0}. bottomLineWidth: {1}", LogType.INFO, topLineWidth, bottomLineWidth);
							var fieldModifierTask = createFieldModifierTask(getGridRenderer(), "topLineWidth", topLineWidth, 0.001, 1, 0)
							sendFieldModifierTask(fieldModifierTask);
							
							var fieldModifierTask = createFieldModifierTask(getGridRenderer(), "bottomLineWidth", bottomLineWidth, 0.001, 1, 0)
							sendFieldModifierTask(fieldModifierTask);
			            }
			        }
			    ),
			    createTuple(
			        "5x0",
			        {
			            keyboardMapping: [ "2", "6"],
			            pressed: function () {
							
							var topLineWidth = 0.3;
							var bottomLineWidth = 0.9;
							logger("Set topLineWidth: {0}. bottomLineWidth: {1}", LogType.INFO, topLineWidth, bottomLineWidth);
							var fieldModifierTask = createFieldModifierTask(getGridRenderer(), "topLineWidth", topLineWidth, 0.001, 1, 0)
							sendFieldModifierTask(fieldModifierTask);
							
							var fieldModifierTask = createFieldModifierTask(getGridRenderer(), "bottomLineWidth", bottomLineWidth, 0.001, 1, 0)
							sendFieldModifierTask(fieldModifierTask);
			            }
			        }
			    ),
			    createTuple(
			        "6x0",
			        {
			            keyboardMapping: [ "3", "6" ],
			            pressed: function () {
							
							var topLineWidth = 0.70;
							var bottomLineWidth = 0.76;
							logger("Set topLineWidth: {0}. bottomLineWidth: {1}", LogType.INFO, topLineWidth, bottomLineWidth);
							var fieldModifierTask = createFieldModifierTask(getGridRenderer(), "topLineWidth", topLineWidth, 0.001, 1, 0)
							sendFieldModifierTask(fieldModifierTask);
							
							var fieldModifierTask = createFieldModifierTask(getGridRenderer(), "bottomLineWidth", bottomLineWidth, 0.001, 1, 0)
							sendFieldModifierTask(fieldModifierTask);
			            }
			        }
			    ),
			    createTuple(
			        "7x0",
			        {
			            keyboardMapping: [ "4", "6" ],
			            pressed: function () {
							
							var topLineWidth = 1.0;
							var bottomLineWidth = 1.0;
							logger("Set topLineWidth: {0}. bottomLineWidth: {1}", LogType.INFO, topLineWidth, bottomLineWidth);
							var fieldModifierTask = createFieldModifierTask(getGridRenderer(), "topLineWidth", topLineWidth, 0.001, 1, 0)
							sendFieldModifierTask(fieldModifierTask);
							
							var fieldModifierTask = createFieldModifierTask(getGridRenderer(), "bottomLineWidth", bottomLineWidth, 0.001, 1, 0)
							sendFieldModifierTask(fieldModifierTask);
			            }
			        }
			    ),
			    createTuple(
			        "4x1",
			        {
			            keyboardMapping: [ "Q", "6" ],
			            pressed: function () {

							var gridSpeed = 0.0022;
							logger("Set gridSpeed to: {0}", LogType.INFO, gridSpeed);
							setInstanceVariable(getGridRenderer(), "separatorSpeed", gridSpeed);
			            }
			        }
			    ),
			    createTuple(
			        "5x1",
			        {
			            keyboardMapping: [ "W", "6" ],
			            pressed: function () {

							var gridSpeed = 0.0033;
							logger("Set gridSpeed to: {0}", LogType.INFO, gridSpeed);
							setInstanceVariable(getGridRenderer(), "separatorSpeed", gridSpeed);
			            }
			        }
			    ),
			    createTuple(
			        "6x1",
			        {
			            keyboardMapping: [ "E", "6" ],
			            pressed: function () {

							var gridSpeed = 0.005;
							logger("Set gridSpeed to: {0}", LogType.INFO, gridSpeed);
							setInstanceVariable(getGridRenderer(), "separatorSpeed", gridSpeed);
			            }
			        }
			    ),
			    createTuple(
			        "7x1",
			        {
			            keyboardMapping: [ "R", "6" ],
			            pressed: function () {
							
							var gridSpeed = 0.008;
							logger("Set gridSpeed to: {0}", LogType.INFO, gridSpeed);
							setInstanceVariable(getGridRenderer(), "separatorSpeed", gridSpeed);
			            }
			        }
			    ),
			    createTuple(
			        "4x2",
			        {
			            keyboardMapping: [ "A", "6" ],
			            pressed: function () {

							var value = !getGridRendererIsGridWheelEnabled();
							logger("Set grid-wheel-enabled: {0}", LogType.INFO, value ? "true" : "false");
							setGridRendererIsGridWheelEnabled(value);
			            }
			        }
			    ),
			    createTuple(
			        "5x2",
			        {
			            keyboardMapping: [ "S", "6" ],
			            pressed: function () {

							var value = !getGridRendererIsGridFrameCleaned();
							logger("Set grid-frame-cleaned: {0}", LogType.INFO, value ? "true" : "false");
							setGridRendererIsGridFrameCleaned(value);
			            }
			        }
			    ),
			    createTuple(
			        "6x2",
			        {
			            keyboardMapping: [ "D", "6" ],
			            pressed: function () {

							var value = !getGridRendererEnableGridRendering()
							logger("Set enable-grid-rendering: {0}", LogType.INFO, value ? "true" : "false");
							setGridRendererEnableGridRendering(value);
			            }
			        }
			    ),
			    createTuple(
			        "7x2",
			        {
			            keyboardMapping: [ "F", "6" ],
			            pressed: function () {

							var value = !getGridRendererEnableGridElementsRendering()
							logger("Set enable-grid-elements-rendering: {0}", LogType.INFO, value ? "true" : "false");
							setGridRendererEnableGridElementsRendering(value);
			            }
			        }
			    ),
			    createTuple(
			        "4x3",
			        {
			            keyboardMapping: [ "Z", "6" ],
			            pressed: function () {

							var value = 120;
							logger("Send wavePulse: {0}", LogType.INFO, value);
							setInstanceVariable(getGridRenderer(), "wavePulseAmount", value); 
			            }
			        }
			    ),
			    createTuple(
			        "5x3",
			        {
			            keyboardMapping: [ "X", "6" ],
			            pressed: function () {

							var value = 60;
							logger("Send wavePulse: {0}", LogType.INFO, value);
							setInstanceVariable(getGridRenderer(), "wavePulseAmount", value); 
			            }
			        }
			    ),
			    createTuple(
			        "6x3",
			        {
			            keyboardMapping: [ "C", "6" ],
			            pressed: function () {

							var value = getInstanceVariable(getGridRenderer(), "channels");
							value = clamp(value + 1, 0, 1000);
							logger("Set channels target: {0}", LogType.INFO, value);
							setChannelsTarget(value);
			            }
			        }
			    ),
			    createTuple(
			        "7x3",
			        {
			            keyboardMapping: [ "V", "6" ],
			            pressed: function () {

							var value = getInstanceVariable(getGridRenderer(), "channels");
							value = clamp(value - 1, 0, 1000);
							logger("Set channels target: {0}", LogType.INFO, value);
							setChannelsTarget(value);
			            }
			        }
			    ),

			    //bottom left
			    createTuple(
			        "0x4",
			        {
			            displayName: "Wave",
			            keyboardMapping: [ "1", "7"],
			            pressed: function () {

			                var target = 135;
							logger("Set angle target: {0}", LogType.INFO, target);
							setAngleTarget(target);
			            }
			        }
			    ),
			    createTuple(
			        "1x4",
			        {
			            keyboardMapping: [ "2", "7"],
			            pressed: function () {

			                var target = 180;
							logger("Set angle target: {0}", LogType.INFO, target);
							setAngleTarget(target);
			            }
			        }
			    ),
			    createTuple(
			        "2x4",
			        {
			            keyboardMapping: [ "3", "7" ],
			            pressed: function () {

							var target = 225;
							logger("Set angle target: {0}", LogType.INFO, target);
							setAngleTarget(target);
			            }
			        }
			    ),
			    createTuple(
			        "3x4",
			        {
			            keyboardMapping: [ "4", "7" ],
			            pressed: function () {

							var factor = 1;
							logger("Set angle factor: {0}", LogType.INFO, factor);
							setAngleFactor(factor);
			            }
			        }
			    ),
			    createTuple(
			        "0x5",
			        {
			            keyboardMapping: [ "Q", "7" ],
			            pressed: function () {

							var texture = asset_texture_carpenter_brut_turbo_killer_1
							var speedValue = getRandomValueFromArray([ 0.0009, 0.001, 0.0011, 0.0012, 0.0013, 0.0014 ]);
							logger("Spawning shroom. {0}, {1}", LogType.INFO, getAssetName(texture, AssetTexture), speedValue);
							shroomButton(texture, speedValue);

			            }
			        }
			    ),
			    createTuple(
			        "1x5",
			        {
			            keyboardMapping: [ "W", "7" ],
			            pressed: function () {

							var texture = asset_texture_carpenter_brut_turbo_killer_2;
							var speedValue = getRandomValueFromArray([ 0.0009, 0.001, 0.0011, 0.0012, 0.0013, 0.0014 ]);
							logger("Spawning shroom. {0}, {1}", LogType.INFO, getAssetName(texture, AssetTexture), speedValue);
							shroomButton(texture, speedValue);

			            }
			        }
			    ),
			    createTuple(
			        "2x5",
			        {
			            keyboardMapping: [ "E", "7" ],
			            pressed: function () {

							var texture =asset_texture_carpenter_brut_turbo_killer_3
							var speedValue = getRandomValueFromArray([ 0.002, 0.0021, 0.0022, 0.0023, 0.0024, 0.0025 ]);
							logger("Spawning shroom. {0}, {1}", LogType.INFO, getAssetName(texture, AssetTexture), speedValue);
							shroomButton(texture, speedValue);

			            }
			        }
			    ),
			    createTuple(
			        "3x5",
			        {
			            keyboardMapping: [ "R", "7" ],
			            pressed: function () {

							var texture = asset_texture_carpenter_brut_turbo_killer_4
							var speedValue = getRandomValueFromArray([ 0.002, 0.0021, 0.0022, 0.0023, 0.0024, 0.0025 ]);
							logger("Spawning shroom. {0}, {1}", LogType.INFO, getAssetName(texture, AssetTexture), speedValue);
							shroomButton(texture, speedValue);

			            }
			        }
			    ),
			    createTuple(
			        "0x6",
			        {
			            keyboardMapping: [ "A", "7" ],
			            pressed: function () {

							var shaderEvent = createShaderEvent(
								"Mosaic",
								4.6,
								createMap(
									createTuple("amount", [ 64, 1024, 4, 0.01 ])
								)
							);
							
							
							logger("Sending shaderEvent: {0}", LogType.INFO, getShaderEventName(shaderEvent));
							sendShaderEvent(shaderEvent)
			            }
			        }
			    ),
			    createTuple(
			        "1x6",
			        {
			            keyboardMapping: [ "S", "7" ],
			            pressed: function () {

							var shaderEvent = createShaderEvent(
								"LED",
								5.2,
								createMap(
									[ "brightness", 1.0 ],
									[ "ledSize", 50 ]
								)
							);
							logger("Sending shaderEvent: {0}", LogType.INFO, getShaderEventName(shaderEvent));
							sendShaderEvent(shaderEvent)
			            }
			        }
			    ),
			    createTuple(
			        "2x6",
			        {
			            keyboardMapping: [ "D", "7" ],
			            pressed: function () {

							var shaderEvent = createShaderEvent(
								"Magnify",
								6.0,
								createMap(
									[ "positionX", [ 0.3, 0.8, 0.001 ] ],
									[ "positionY", [ 0.0, 1.0, 0.001 ] ],
									[ "radius", [ 0.25, 0.40, 0.01 ] ],
									[ "minZoom", [ 0.30, 0.60, 0.02 ] ],
									[ "maxZoom", [ 0.60, 0.90, 0.02] ])
							);
							logger("Sending shaderEvent: {0}", LogType.INFO, getShaderEventName(shaderEvent));
							sendShaderEvent(shaderEvent)
			            }
			        }
			    ),
			    createTuple(
			        "3x6",
			        {
			            keyboardMapping: [ "F", "7" ],
			            pressed: function () {

							var shaderEvent = createShaderEvent(
								"Magnify",
								3.5,
								createMap(
									[ "positionX", [ 0.8, 0.3, 0.002 ] ],
									[ "positionY", [ 1.0, 0.0, 0.001 ] ],
									[ "radius", [ 0.25, 0.40, 0.01 ] ],
									[ "minZoom", [ 0.30, 0.60, 0.02 ] ],
									[ "maxZoom", [ 0.60, 0.90, 0.02] ]
								)
							);
							logger("Sending shaderEvent: {0}", LogType.INFO, getShaderEventName(shaderEvent));
							sendShaderEvent(shaderEvent)
			            }
			        }
			    ),
			    createTuple(
			        "0x7",
			        {
			            keyboardMapping: [ "Z", "7" ],
			            pressed: function () {

							var texture = asset_texture_carpenter_brut_turbo_killer_5
							var speedValue = choose(0.0005, 0.0006, 0.0007, 0.0008, 0.0009, 0.001) * 2;
							logger("Spawning shroom. {0}, {1}", LogType.INFO, getAssetName(texture, AssetTexture), speedValue);
							shroomButton(texture, speedValue);
			            }
			        }
			    ),
			    createTuple(
			        "1x7",
			        {
			            keyboardMapping: [ "X", "7" ],
			            pressed: function () {
							
							var texture = asset_texture_carpenter_brut_turbo_killer_6
							var speedValue = choose(0.0005, 0.0006, 0.0007, 0.0008, 0.0009, 0.001) * 2;
							logger("Spawning shroom. {0}, {1}", LogType.INFO, getAssetName(texture, AssetTexture), speedValue);
							shroomButton(texture, speedValue);
			            }
			        }
			    ),
			    createTuple(
			        "2x7",
			        {
			            keyboardMapping: [ "C", "7" ],
			            pressed: function () {
							
							var texture = asset_texture_carpenter_brut_turbo_killer_7
							var speedValue = choose(0.0005, 0.0006, 0.0007, 0.0008, 0.0009, 0.001);
							logger("Spawning shroom. {0}, {1}", LogType.INFO, getAssetName(texture, AssetTexture), speedValue);
							shroomButton(texture, speedValue);
			            }
			        }
			    ),
			    createTuple(
			        "3x7",
			        {
			            keyboardMapping: [ "V", "7" ],
			            pressed: function () {

							var texture =asset_texture_carpenter_brut_turbo_killer_8
							var speedValue = choose(0.0005, 0.0006, 0.0007, 0.0008, 0.0009, 0.001);
							logger("Spawning shroom. {0}, {1}", LogType.INFO, getAssetName(texture, AssetTexture), speedValue);
							shroomButton(texture, speedValue);
			            }
			        }
			    ),

			    //bottom right
			    createTuple(
			        "4x4",
			        {
			            displayName: "Background",
			            keyboardMapping: [ "1", "8"],
			            pressed: function () {

							//todo move to function
							var color = colorHashToGMColor("#0B0F10");
							logger("Set colorGridBackground to: {0}", LogType.INFO, gmColorToColorHash(color));
							setInstanceVariable(getGridRenderer(), "colorGridBackground", color);
							setInstanceVariable(getGameRenderer(), "background", getRandomValueFromArray([
								asset_texture_carpenter_brut_turbo_killer_bkg_1
							]));
			            }
			        }
			    ),
			    createTuple(
			        "5x4",
			        {
						displayName: "Background",
			            keyboardMapping: [ "2", "8"],
			            pressed: function () {

			                var color = colorHashToGMColor("#5c0c47");
							logger("Set colorGridBackground to: {0}", LogType.INFO, gmColorToColorHash(color));
							setInstanceVariable(getGridRenderer(), "colorGridBackground", color);
							setInstanceVariable(getGameRenderer(), "background", getRandomValueFromArray([
								asset_texture_carpenter_brut_turbo_killer_bkg_2
							]));
			            }
			        }
			    ),
			    createTuple(
			        "6x4",
			        {
						displayName: "Background",
			            keyboardMapping: [ "3", "8" ],
			            pressed: function () {

			            	var color = colorHashToGMColor("#750517");
							logger("Set colorGridBackground to: {0}", LogType.INFO, gmColorToColorHash(color));
							setInstanceVariable(getGridRenderer(), "colorGridBackground", color);
							setInstanceVariable(getGameRenderer(), "background", getRandomValueFromArray([
								asset_texture_carpenter_brut_turbo_killer_bkg_3
							]));
			            }
			        }
			    ),
			    createTuple(
			        "7x4",
			        {
						displayName: "Background",
			            keyboardMapping: [ "4", "8" ],
			            pressed: function () {

			            	var color = colorHashToGMColor("#190B24");
							logger("Set colorGridBackground to: {0}", LogType.INFO, gmColorToColorHash(color));
							setInstanceVariable(getGridRenderer(), "colorGridBackground", color);
							setInstanceVariable(getGameRenderer(), "background", getRandomValueFromArray([
								asset_texture_carpenter_brut_turbo_killer_bkg_4
							]));
							
			            }
			        }
			    ),
			    createTuple(
			        "4x5",
			        {
			            keyboardMapping: [ "Q", "8" ],
			            pressed: function () {

							logger("Sending bkt glitch event", LogType.INFO);
							setInstanceVariable(getGameRenderer(), "__isKeyPressed", true);
			            }
			        }
			    ),
			    createTuple(
			        "5x5",
			        {
			            keyboardMapping: [ "W", "8" ],
			            pressed: function () {
							
							logger("Update enableLyricsRenderer", LogType.INFO);
							getLyricsRenderer().enableLyricsRenderer = !getLyricsRenderer().enableLyricsRenderer;

			            }
			        }
			    ),
			    createTuple(
			        "6x5",
			        {
			            keyboardMapping: [ "E", "8" ],
			            pressed: function () {

							logger("Remove shader from pipeline main", LogType.INFO);
							popStack(getShaderPipelinePipe(fetchShaderPipelineByName("main")))
			            }
			        }
			    ),
			    createTuple(
			        "7x5",
			        {
			            keyboardMapping: [ "R", "8" ],
			            pressed: function () {

							setInstanceVariable(getLyricsRenderer(), "lain01", false);
							logger("Send lyrics", LogType.INFO);
							pushStack(
								getLyricsRenderer().lyricsTaskPipeline,
								createLyricsEvent(
									global.__lyrics,
									2048, 
									0.11
								)
							);
			            }
			        }
			    ),
			    createTuple(
			        "4x6",
			        {
			            keyboardMapping: [ "A", "8" ],
			            pressed: function () {
							
							var shaderEvent = createShaderEvent(
								"Ripple",
								6.8,
								createMap(
									[ "positionX", 0.5 ],
						            [ "positionY", 0.5 ],
						            [ "amount", [ 20, 80, 0.3 ] ],
						            [ "distortion", 80, 600, 0.4 ],
						            [ "speed", [ 3, 8, 0.02 ] ],
						            [ "time", [ 0, 1000, 0.1 ] ]
								)
							);
							logger("Sending shaderEvent: {0}", LogType.INFO, getShaderEventName(shaderEvent));
							sendShaderEvent(shaderEvent);
			            }
			        }
			    ),
			    createTuple(
			        "5x6",
			        {
			            keyboardMapping: [ "S", "8" ],
			            pressed: function () {

							var shaderEvent = createShaderEvent(
								"Wave",
								3.9,
								createMap(
									[ "amount", [ 15, 25, 0.05 ] ],
									[ "distortion", [ 30, 45, 0.05 ] ],
									[ "speed", [ 2 ] ],
									[ "time",  [ 0, 1000, 0.01 ] ]
								)
							);
							logger("Sending shaderEvent: {0}", LogType.INFO, getShaderEventName(shaderEvent));
							sendShaderEvent(shaderEvent);
			            }
			        }
			    ),
			    createTuple(
			        "6x6",
			        {
			            keyboardMapping: [ "D", "8" ],
			            pressed: function () {
							
							var shaderEvent = createShaderEvent(
								"Thermal",
								4.4,
								createMap()
							);
							logger("Sending shaderEvent: {0}", LogType.INFO, getShaderEventName(shaderEvent));
							sendShaderEvent(shaderEvent);
			            }
			        }
			    ),
			    createTuple(
			        "7x6",
			        {
			            keyboardMapping: [ "F", "8" ],
			            pressed: function () {
							
							var shaderEvent = createShaderEvent(
								"Ripple",
								6.8,
								createMap(
									[ "positionX", 0.5 ],
						            [ "positionY", [ 0.3, 0.8, 0.002 ] ],
						            [ "amount", [ 30, 40, 0.2 ] ],
						            [ "distortion", 40, 400, 0.2 ],
						            [ "speed", [ 1, 5, 0.02 ] ],
						            [ "time", [ 0, 1000, 0.1 ] ]
								)
							);
							logger("Sending shaderEvent: {0}", LogType.INFO, getShaderEventName(shaderEvent));
							sendShaderEvent(shaderEvent);
			            }
			        }
			    ),
			    createTuple(
			        "4x7",
			        {
			            keyboardMapping: [ "Z", "8" ],
			            pressed: function () {

							var result = Core.Collections._Array.getRandom([
								{
								    firstBlendPointer: 1,
								    secondBlendPointer: 0
								},
								{
								    firstBlendPointer: 0,
								    secondBlendPointer: 1
								},
								{
								    firstBlendPointer: 2,
								    secondBlendPointer: 1
								},
								{
								    firstBlendPointer: 9,
								    secondBlendPointer: 0
								},
								{
								    firstBlendPointer: 7,
								    secondBlendPointer: 1
								}
							]);

							setInstanceVariable(getGridRenderer(), "firstBlendPointer", result.firstBlendPointer);
							setInstanceVariable(getGridRenderer(), "secondBlendPointer", result.secondBlendPointer);
							logger("set Blend modes: {0}x{1}", LogType.INFO, result.firstBlendPointer, result.secondBlendPointer);
			            }
			        }
			    ),
			    createTuple(
			        "5x7",
			        {
			            keyboardMapping: [ "X", "8" ],
			            pressed: function () {
							
							try {
								var eventsRecorder = getGameController().midiMatrixController.eventsRecorder;
								if isStruct(eventsRecorder.getCurrentRecording(eventsRecorder)) {
								
									eventsRecorder.stopRecording(eventsRecorder);	
								} else {
								
									eventsRecorder.startRecording(eventsRecorder);	
								}
							} catch(exception) {
								logger(exception.message, LogType.INFO);
								printStackTrace();
							}
			            }
			        }
			    ),
			    createTuple(
			        "6x7",
			        {
			            keyboardMapping: [ "C", "8" ],
			            pressed: function () {

							try {
								var eventsRecorder = getGameController().midiMatrixController.eventsRecorder;
								var text = Core.File.read({ withDialog: true });
								var eventsRecording = eventsRecorder.parseRecording(eventsRecorder, text);
								var eventsPlayer = getGameController().midiMatrixController.eventsPlayer;
								eventsPlayer.play(eventsPlayer, eventsRecording);
							} catch(exception) {
								logger(exception.message, LogType.INFO);
								printStackTrace();
							}
			            }
			        }
			    ),
			    createTuple(
			        "7x7",
			        {
			            keyboardMapping: [ "V", "8" ],
			            pressed: function () {

							var shrooms = getInstanceVariable(getShroomManager(), "shrooms");
							if (isDataStructure(shrooms, List)) {
							
								var size = Core.Collections._List.size(shrooms);
								print(size, "eeeeE")
								if (size > 0) {
									
									Core.Collections._List.pop(shrooms);	
								}
							}
			            }
			        }
			    )
			]
		)
	);
	#endregion

	///@type {String}
	baseRecording = Core.File.read({ path: "data", filename: "carpenter_brut_05.json", withDialog: false });
	
///@private:

	///@type {Number} in seconds
	isGameplayStarted = false;
	
	mouseCounter = 0;
	
	///@type {Boolean}
	isOSTResolved = false;
	
	#endregion
	
	#region Dependencies
	inject(BossManager);
	inject(LyricsRenderer);
	inject(GridRenderer);
	inject(HandheldRenderer);
	inject(PlayerManager);
	inject(ShroomManager);
	inject(BulletManager);
	inject(ShroomEmitterManager);
	inject(GameRenderer);
	
	jsUtilBootComplete(); // hide loading div
	#endregion	
	
