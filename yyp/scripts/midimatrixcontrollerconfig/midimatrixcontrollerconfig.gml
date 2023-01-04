function generateDefaultMidiMatrixController() {

	var launchpadJsonString = isHtml5()
		? html5EmbeddedLaunchpadLayout()
		: Core.File.read({ 
			path: "data", 
			filename: "launchpad-layout.json", 
		withDialog: false 
		});
	
	var config = parseJsonLaunchpadLayout(launchpadJsonString);
	return createMidiMatrixController(config)
	//return _generateDefaultMidiMatrixController()
}


function _generateDefaultMidiMatrixController() {
	
	return createMidiMatrixController(
		createMapFromTupleArray(
			[
			    //top left
			    createTuple(
			        "0x0",
			        {
						displayName: "screens_0x0",
			            keyboardMapping: [ "1", "5"],
			            pressed: function(button, key) {
							
							actionSetScreensTarget(1.0)	
			            }
			        }
			    ),
			    createTuple(
			        "1x0",
			        {
						displayName: "screens_0x1",
			            keyboardMapping: [ "2", "5"],
			            pressed: function(button, key) {
							
							actionSetScreensTarget(2.0)	
			            }
			        }
			    ),
			    createTuple(
			        "2x0",
			        {
						displayName: "screens_0x2",
			            keyboardMapping: [ "3", "5" ],
			            pressed: function(button, key) {
							
							actionSetScreensTarget(3.0)
			            }
			        }
			    ),
			    createTuple(
			        "3x0",
			        {
						displayName: "top-line_0x3",
			            keyboardMapping: [ "4", "5" ],
			            pressed: function(button, key) {
							
							actionSetScreensTarget(4.0)
			            }
			        }
			    ),
			    createTuple(
			        "0x1",
			        {
						displayName: "screens_0x1",
			            keyboardMapping: [ "Q", "5" ],
			            pressed: function () {
							
							actionSetScreenFactor(0.001)
			            }
			        }
			    ),
			    createTuple(
			        "1x1",
			        {
						displayName: "screens_1x1",
			            keyboardMapping: [ "W", "5" ],
			            pressed: function () {
							
							actionSetScreenFactor(0.004)
			            }
			        }
			    ),
			    createTuple(
			        "2x1",
			        {
						displayName: "screens_2x1",
			            keyboardMapping: [ "E", "5" ],
			            pressed: function () {
							
							actionSetScreenFactor(0.05)
			            }
			        }
			    ),
			    createTuple(
			        "3x1",
			        {
						displayName: "empty_0x0",
			            keyboardMapping: [ "R", "5" ],
			            pressed: function () {

							actionSetScreenFactor(0.075)
			            }
			        }
			    ),
			    createTuple(
			        "0x2",
			        {
						displayName: "angle_0x0",
			            keyboardMapping: [ "A", "5" ],
			            pressed: function () {

							actionSetAngleTarget(90);
			            }
			        }
			    ),
			    createTuple(
			        "1x2",
			        {
						displayName: "angle_1x0",
			            keyboardMapping: [ "S", "5" ],
			            pressed: function () {
							
							actionSetAngleTarget(-90);
			            }
			        }
			    ),
			    createTuple(
			        "2x2",
			        {
			            keyboardMapping: [ "D", "5" ],
			            pressed: function () {
							
							actionSetAngleTarget(45);
			            }
			        }
			    ),
			    createTuple(
			        "3x2",
			        {
			            keyboardMapping: [ "F", "5" ],
			            pressed: function () {
							
							actionSetAngleTarget(-45);
			            }
			        }
			    ),
			    createTuple(
			        "0x3",
			        {
			            keyboardMapping: [ "Z", "5" ],
			            pressed: function () {
							
							actionSetAngleFactor(0.11)
			            }
			        }
			    ),
			    createTuple(
			        "1x3",
			        {
			            keyboardMapping: [ "X", "5" ],
			            pressed: function () {
							
							actionSetAngleFactor(0.33)
			            }
			        }
			    ),
			    createTuple(
			        "2x3",
			        {
			            keyboardMapping: [ "C", "5" ],
			            pressed: function () {
							
							actionSetAngleFactor(0.77)
			            }
			        }
			    ),
			    createTuple(
			        "3x3",
			        {
			            keyboardMapping: [ "V", "5" ],
			            pressed: function () {
							
							actionSetAngleFactor(1.61)
			            }
			        }
			    ),

			    //top right
			    createTuple(
			        "4x0",
			        {
			            keyboardMapping: [ "1", "6"],
			            pressed: function () {
							
							actionSwitchEnableGridRendering()
			            }
			        }
			    ),
			    createTuple(
			        "5x0",
			        {
			            keyboardMapping: [ "2", "6"],
			            pressed: function () {
							
							actionSwitchEnableLyricsRendering() 
			            }
			        }
			    ),
			    createTuple(
			        "6x0",
			        {
			            keyboardMapping: [ "3", "6" ],
			            pressed: function () {
							
							actionLoadRecordingFromFile()
			            }
			        }
			    ),
			    createTuple(
			        "7x0",
			        {
			            keyboardMapping: [ "4", "6" ],
			            pressed: function () {
							
							actionStartRecordingToFile()
			            }
			        }
			    ),
			    createTuple(
			        "4x1",
			        {
			            keyboardMapping: [ "Q", "6" ],
			            pressed: function () {

							actionSwitchEnableGridFrameCleaned()
			            }
			        }
			    ),
			    createTuple(
			        "5x1",
			        {
			            keyboardMapping: [ "W", "6" ],
			            pressed: function () {

							actionSwitchEnableGridColorWheel()
			            }
			        }
			    ),
			    createTuple(
			        "6x1",
			        {
			            keyboardMapping: [ "E", "6" ],
			            pressed: function () {

							actionSwitchChangeGameplay()
			            }
			        }
			    ),
			    createTuple(
			        "7x1",
			        {
			            keyboardMapping: [ "R", "6" ],
			            pressed: function () {
							
							actionRemoveLastShader()
			            }
			        }
			    ),
			    createTuple(
			        "4x2",
			        {
			            keyboardMapping: [ "A", "6" ],
			            pressed: function () {

							actionSetGridTopLineWidth(0.36, 0.001);
							actionSetGridBottomLineWidth(0.37, 0.001);
							actionSetGridXScale(0.85, 0.0008);
							actionSetGridYScale(0.85, 0.0008);
			            }
			        }
			    ),
			    createTuple(
			        "5x2",
			        {
			            keyboardMapping: [ "S", "6" ],
			            pressed: function () {
							
							actionSetGridTopLineWidth(0.37, 0.001);
							actionSetGridBottomLineWidth(0.69, 0.001);
							actionSetGridXScale(0.90, 0.0008);
							actionSetGridYScale(0.90, 0.0008);
			            }
			        }
			    ),
			    createTuple(
			        "6x2",
			        {
			            keyboardMapping: [ "D", "6" ],
			            pressed: function () {
							
							actionSetGridTopLineWidth(0.70, 0.001);
							actionSetGridBottomLineWidth(0.96, 0.001);
							actionSetGridXScale(0.95, 0.0008);
							actionSetGridYScale(0.95, 0.0008);
			            }
			        }
			    ),
			    createTuple(
			        "7x2",
			        {
			            keyboardMapping: [ "F", "6" ],
			            pressed: function () {

							actionSetGridTopLineWidth(0.89, 0.001);
							actionSetGridBottomLineWidth(0.93, 0.001);
							actionSetGridXScale(1.03, 0.0008);
							actionSetGridYScale(1.03, 0.0008);
			            }
			        }
			    ),
			    createTuple(
			        "4x3",
			        {
			            keyboardMapping: [ "Z", "6" ],
			            pressed: function () {
							
							actionSetGridSpeed(0.002);
			            }
			        }
			    ),
			    createTuple(
			        "5x3",
			        {
			            keyboardMapping: [ "X", "6" ],
			            pressed: function () {
							
							actionSetGridSpeed(0.003);
			            }
			        }
			    ),
			    createTuple(
			        "6x3",
			        {
			            keyboardMapping: [ "C", "6" ],
			            pressed: function () {

							actionSetGridSpeed(0.005);
			            }
			        }
			    ),
			    createTuple(
			        "7x3",
			        {
			            keyboardMapping: [ "V", "6" ],
			            pressed: function () {

							actionSetGridSpeed(0.0075);
			            }
			        }
			    ),

			    //bottom left
			    createTuple(
			        "0x4",
			        {
			            displayName: "Mosaic",
			            keyboardMapping: [ "1", "7"],
			            pressed: function () {

			                actionStartShader("Mosaic-1", 5.6);
			            }
			        }
			    ),
			    createTuple(
			        "1x4",
			        {
			            keyboardMapping: [ "2", "7"],
			            pressed: function () {

			               actionStartShader("LED-1", 6.0);
			            }
			        }
			    ),
			    createTuple(
			        "2x4",
			        {
			            keyboardMapping: [ "3", "7" ],
			            pressed: function () {

							actionStartShader("LED-2", 6.0);
			            }
			        }
			    ),
			    createTuple(
			        "3x4",
			        {
			            keyboardMapping: [ "4", "7" ],
			            pressed: function () {
							
							actionStartShader("Magnify-1", 6.2);
			            }
			        }
			    ),
			    createTuple(
			        "0x5",
			        {
			            keyboardMapping: [ "Q", "7" ],
			            pressed: function () {

							actionStartShader("Ripple-1", 6.8);
			            }
			        }
			    ),
			    createTuple(
			        "1x5",
			        {
			            keyboardMapping: [ "W", "7" ],
			            pressed: function () {

							actionStartShader("Wave-1", 4.9);
			            }
			        }
			    ),
			    createTuple(
			        "2x5",
			        {
			            keyboardMapping: [ "E", "7" ],
			            pressed: function () {

							actionStartShader("Revert", 4.4);
			            }
			        }
			    ),
			    createTuple(
			        "3x5",
			        {
			            keyboardMapping: [ "R", "7" ],
			            pressed: function () {

							actionStartShader("Ripple-2", 6.8);
			            }
			        }
			    ),
			    createTuple(
			        "0x6",
			        {
			            keyboardMapping: [ "A", "7" ],
			            pressed: function () {

							actionSetSpawnHRange(0.05, 0.2);
							actionSetSpawnVRange(0.3, 0.45);
			            }
			        }
			    ),
			    createTuple(
			        "1x6",
			        {
			            keyboardMapping: [ "S", "7" ],
			            pressed: function () {

							actionSetSpawnHRange(0.3, 0.45);
							actionSetSpawnVRange(0.55, 0.7);
			            }
			        }
			    ),
			    createTuple(
			        "2x6",
			        {
			            keyboardMapping: [ "D", "7" ],
			            pressed: function () {

							actionSetSpawnHRange(0.55, 0.7);
							actionSetSpawnVRange(0.3, 0.45);
			            }
			        }
			    ),
			    createTuple(
			        "3x6",
			        {
			            keyboardMapping: [ "F", "7" ],
			            pressed: function () {

							actionSetSpawnHRange(0.8, 0.95);
							actionSetSpawnVRange(0.05, 0.2);
			            }
			        }
			    ),
			    createTuple(
			        "0x7",
			        {
			            keyboardMapping: [ "Z", "7" ],
			            pressed: function () {
							
							actionSpawnShroom("shroom-01");
			            }
			        }
			    ),
			    createTuple(
			        "1x7",
			        {
			            keyboardMapping: [ "X", "7" ],
			            pressed: function () {
							
							actionSpawnShroom("shroom-02");
			            }
			        }
			    ),
			    createTuple(
			        "2x7",
			        {
			            keyboardMapping: [ "C", "7" ],
			            pressed: function () {
							
							actionSpawnShroom("shroom-03");
			            }
			        }
			    ),
			    createTuple(
			        "3x7",
			        {
			            keyboardMapping: [ "V", "7" ],
			            pressed: function () {

							actionSpawnShroom("shroom-04");
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

							actionSpawnGridPulse(150.0)
			            }
			        }
			    ),
			    createTuple(
			        "5x4",
			        {
						displayName: "Background",
			            keyboardMapping: [ "2", "8"],
			            pressed: function () {

			                actionSpawnGridPulse(60.0)
			            }
			        }
			    ),
			    createTuple(
			        "6x4",
			        {
						displayName: "Background",
			            keyboardMapping: [ "3", "8" ],
			            pressed: function () {

							actionAddGridChannels(-1.0, 0.05)
			            }
			        }
			    ),
			    createTuple(
			        "7x4",
			        {
						displayName: "Background",
			            keyboardMapping: [ "4", "8" ],
			            pressed: function () {

							actionAddGridChannels(1.0, 0.05)
			            }
			        }
			    ),
			    createTuple(
			        "4x5",
			        {
			            keyboardMapping: [ "Q", "8" ],
			            pressed: function () {

							actionSetBackgroundColor("background_color_01")
							actionSetBackgroundTexture("background_texture_01")
			            }
			        }
			    ),
			    createTuple(
			        "5x5",
			        {
			            keyboardMapping: [ "W", "8" ],
			            pressed: function () {
							
							actionSetBackgroundColor("background_color_02")
							actionSetBackgroundTexture("background_texture_02")
							
			            }
			        }
			    ),
			    createTuple(
			        "6x5",
			        {
			            keyboardMapping: [ "E", "8" ],
			            pressed: function () {

							actionSetBackgroundColor("background_color_03")
							actionSetForegroundTexture("background_texture_03")
			            }
			        }
			    ),
			    createTuple(
			        "7x5",
			        {
			            keyboardMapping: [ "R", "8" ],
			            pressed: function () {

							actionSetBackgroundColor("background_color_04")
							actionSetForegroundTexture("background_texture_04")
			            }
			        }
			    ),
			    createTuple(
			        "4x6",
			        {
			            keyboardMapping: [ "A", "8" ],
			            pressed: function () {
							
							actionSetSpawnHRange(0.0, 1.0);
							actionSetSpawnVRange(0.0, 1.0) 
			            }
			        }
			    ),
			    createTuple(
			        "5x6",
			        {
			            keyboardMapping: [ "S", "8" ],
			            pressed: function () {

							actionSetSpawnSpeed(0.002, 0.003);
			            }
			        }
			    ),
			    createTuple(
			        "6x6",
			        {
			            keyboardMapping: [ "D", "8" ],
			            pressed: function () {
							
							actionSetSpawnSpeed(0.006, 0.007)
			            }
			        }
			    ),
			    createTuple(
			        "7x6",
			        {
			            keyboardMapping: [ "F", "8" ],
			            pressed: function () {
														
							actionSpawnRandomGlitch();
			            }
			        }
			    ),
			    createTuple(
			        "4x7",
			        {
			            keyboardMapping: [ "Z", "8" ],
			            pressed: function () {
							
							actionSpawnShroom("shroom-05");
			            }
			        }
			    ),
			    createTuple(
			        "5x7",
			        {
			            keyboardMapping: [ "X", "8" ],
			            pressed: function () {
							
							actionSpawnShroom("shroom-06");
			            }
			        }
			    ),
			    createTuple(
			        "6x7",
			        {
			            keyboardMapping: [ "C", "8" ],
			            pressed: function () {
							
							actionSpawnShroom("shroom-07");
			            }
			        }
			    ),
			    createTuple(
			        "7x7",
			        {
			            keyboardMapping: [ "V", "8" ],
			            pressed: function () {

							actionSpawnShroom("shroom-08");
			            }
			        }
			    )
			]
		)
	);
}