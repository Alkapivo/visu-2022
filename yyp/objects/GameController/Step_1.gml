///@description updateBegin()

	resolveGameplayTime(this);

	this.midiMatrixController.update(this.midiMatrixController);
	
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
	
	var demoShroomGen = function(__context) {
			
		var __shroomSizeTimer = injectInstanceVariable(this, "shroomSizeTimer", 0);
		__shroomSizeTimer = incrementTimer(__shroomSizeTimer, 1.0, (1.0 / GAME_FPS) * 0.33);
		setInstanceVariable(this, "shroomSizeTimer", __shroomSizeTimer);
		if (timerFinished(__shroomSizeTimer)) {
	
			global.shroomSize = clamp(global.shroomSize + 0.2, 0.0, 16.0);
		}
	
		if (global.demo) {
			
			var randomTimer = injectInstanceVariable(this, "kremowka", 0);
			randomTimer = incrementTimer(randomTimer, 0.67);
			setInstanceVariable(this, "kremowka", randomTimer);
			if (timerFinished(randomTimer)) {
		
				var shroomSize = global.shroomSize;
				var amount = clamp(irandom(ceil(shroomSize)), 1, shroomSize);
				for(var index = 0; index < amount; index++) {
			
					var __sprite = getRandomValueFromArray([ asset_alka_glitch_01 ]);
					var shroomTemplate = createShroomTemplate(
						createSprite(__sprite, irandom(sprite_get_number(__sprite)), 1.0, 1.0, 1.0, 0.0, c_white),
						createMap(), 
						[ 0.004, 0.0041, 0.0042, 0.0043, 0.0044 ],
						[ createTuple(GridElementInfoType.RAINBOW, colorHashToColor("#00ff00ff"))]
					);
		
					spawnShroom(
						shroomTemplate, 
						createPosition(
							irandom(100) / 100.0, 
							choose(-0.2, -0.15, -0.1, -0.05, 0.01)
						)
					);
				}
			}
		}
	};
	
	var sewerslvtDiscordArt = function(context, arts) {
	
	// routine
		
		var isDispatched = false;
		var artTimer = injectInstanceVariable(context, "__artTimer", 0.0);
		var artTimerDuration = injectInstanceVariable(context, "__artTimerDuration", 0.0);
		artTimer = incrementTimer(artTimer, artTimerDuration);
		if (timerFinished(artTimer)) {
			
			artTimerDuration = getRandomValueFromArray([
				1.0, 1.5, 1.0,
				random(3) / 1.0, random(3) / 2.0, random(3) / 3.0
			]);
			
			setInstanceVariable(context, "__artTimerDuration", artTimerDuration);
			isDispatched = true;
		}
		setInstanceVariable(context, "__artTimer", artTimer);
		
		if (isDispatched) {
		
			setInstanceVariable(getGameRenderer(), "__isKeyPressed", true);
		
			var amount = getRandomValueFromArray([
				1, 1, 1, 1, 1, 1, 2, 2, 3 //d9 roll
			]);
			
			for(var index = 0; index < amount; index++) {
			
				var __sprite = getRandomValueFromArray(arts);
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
						0.0020, 0.0021, 0.0022, 
						0.0060, 0.0050, 0.0040,
					],
					[ createTuple(GridElementInfoType.RAINBOW, colorHashToColor("#00ff00ff"))]
				);
		
				spawnShroom(
					shroomTemplate, 
					createPosition(
						irandom(100) / 100.0, 
						getRandomValueFromArray([
							-1.0, -0.75, -0.5,
							-0.66, -0.33, 0.01
						])
					)
				);
			}	
		}	
	}
	
	//demoShroomGen(this);
	if (global.demo) {
		
		sewerslvtDiscordArt(
			this, 
			[ 
				asset_texture_alka_glitch_01,
				asset_texture_alka_glitch_01,
				asset_texture_alka_glitch_01,
				asset_texture_alka_glitch_01,
				asset_texture_alka_glitch_01,
				asset_texture_alka_glitch_01
			]
		);
	}
	
	#region isGameplayStarted
	
	if (!isGameplayStarted) {
	
		if (mouse_check_button_pressed(mb_any)) {
			
			mouseCounter++;
		}
		
		if (mouseCounter >= 2) {
		
			isGameplayStarted = true;
		}
	}
	
	if (global.isGameplayStarted) {
		
		if (!isOSTResolved) {
		
			isOSTResolved = true;
			try {
				
				var eventsPlayer = getGameController().midiMatrixController.eventsPlayer;
				var eventsRecorder = getGameController().midiMatrixController.eventsRecorder;
				var text = getGameController().baseRecording;
				var eventsRecording = eventsRecorder.parseRecording(eventsRecorder, text);
				eventsPlayer.play(eventsPlayer, eventsRecording);
				
				//var package = package_carpenter_brut_turbo_killer();
				//Core.PackageManager.applyPackage(package);
				
			} catch (exception) {
			
				logger(exception.message, LogType.ERROR);
				printStackTrace();
			}
		}
	
		if (keyboard_check_pressed(ord("B"))) {
		
			debugSpawnShroom();
		}
	}
	
	global.isGameplayStarted = isGameplayStarted;
	
	#endregion