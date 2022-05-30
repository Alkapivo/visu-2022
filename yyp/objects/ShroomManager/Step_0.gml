///@description

	super();
	
	if (global.demo) {
		
		templateTimer = incrementTimer(templateTimer, 2.66);
		if (timerFinished(templateTimer)) {
			var templateNameIndex = clamp(round(random(getArrayLength(templateNames) - 1)), 0, getArrayLength(templateNames) - 1);								
			currentTemplate = templateNames[templateNameIndex];
			setInstanceVariable(getSceneRenderer(), "__currentTemplate", getInstanceVariable(getShroomManager(), "currentTemplate"));
			logger("Current shroom shader template: {0}", LogType.INFO, currentTemplate);
		}
	}
		
	#region Shroom reactor
	var destroyShrooms = [];
	var shroomsSize = getListSize(shrooms);
	for (var index = 0; index < shroomsSize; index++) {
		var shroom = shrooms[| index];
		var shroomGridElement = getShroomGridElement(shroom);
		var shroomPosition = getGridElementPosition(shroomGridElement);
		
		#region Resovle Status
		var shroomState = getShroomState(shroom);
		var shroomStatus = getValueFromMap(shroomState, "status", "run");
	
		switch (shroomStatus) {
			case "run":
			
				#region Movement
				var speedValue = getShroomSpeedValue(shroom);
				var gridSpeed = getInstanceVariable(getGridRenderer(), "separatorSpeed");
				speedValue = speedValue * (gridSpeed / 0.005);
				
				var movedVerticalPosition = fetchMovedVerticalPositionOnGrid(
					getPositionVertical(shroomPosition), 
	 				speedValue);
				setPositionVertical(shroomPosition, movedVerticalPosition);
				
				
				var horizontalSpeed = getValueFromMap(shroomState, "horizontalSpeed", choose(1, -1) * (random(6.66) / 1000));
				var movedHorizontalPosition = getPositionHorizontal(shroomPosition) + applyDeltaTime(horizontalSpeed);
				setPositionHorizontal(shroomPosition, movedHorizontalPosition);
				
				if ((movedVerticalPosition >= -1.5) &&
					(movedVerticalPosition <= 1.5)) {
						
					sendGridElementRenderRequest(shroomGridElement);
				} else {
					destroyShrooms = pushArray(destroyShrooms, index);
				}
				#endregion
				
				break;
			case "end":
			
				#region Initialize
				var endSpriteSet = getValueFromMap(shroomState, "endSpriteSet", false);
				if (!endSpriteSet) {
					
					#region Fields
					var shroomTypeName = "good";
					var shroomRandomShader = true;
					var shroomShaderTemplatesNames = [];
					var shroomShaderTemplates = [];
					#endregion
					
					#region Resolve type
					switch (shroomTypeName) {
						case "good":
							var positions = fetchGridElementParticlePositions(shroomGridElement, shroomPosition);
							var particleTask = createParticleTask(
								"particle_score",
								ParticleSystems.FOREGROUND,
								10,
								0.0,
								0.4,
								0.05,
								0.0,
								positions[0],
								positions[1]);
							sendParticleTask(particleTask);
							break;
						case "default":
						case "bad":
							var positions = fetchGridElementParticlePositions(shroomGridElement, shroomPosition);
							var particleTask = createParticleTask(
								"particle_explosion",
								ParticleSystems.FOREGROUND,
								20,
								0.0,
								0.4,
								0.4,
								0.0,
								positions[0],
								positions[1]);
							sendParticleTask(particleTask);
							var gridRenderer = getGridRenderer();
							
							var isKilledByBullet = getValueFromMap(shroomState, "isKilledByBullet", false);
							if (isOptionalPresent(gridRenderer)) {
								var shroomTypeShake = getValueFromMap(shroomType, "shake", (isKilledByBullet ? 4 : 1) * (pi * 6));
								gridRenderer.cameraShake = shroomTypeShake;
							}
							break;
					}
					#endregion
					
					#region Resolve shader
					var shaderEventTemplate = undefined;
					if (shroomRandomShader) {
						
						var templateName = getRandomValueFromArray(getMapKeys(shroomShaderEventTemplates));
						var shaderEventTemplate = shroomShaderEventTemplates[? templateName];
					} else {
						var shroomShaderTemplatesSize= getArrayLength(shroomShaderTemplates);
						var shroomShaderTemplatesNamesSize = getArrayLength(shroomShaderTemplatesNames);
						var choosenIndex = floor(random(shroomShaderTemplatesSize + shroomShaderTemplatesNamesSize));
						if (shroomShaderTemplatesSize > 0) || (shroomShaderTemplatesNamesSize > 0) {
							if (choosenIndex < shroomShaderTemplatesSize) {
								shaderEventTemplate = shroomShaderTemplates[choosenIndex];
							} else {
								var templateName = shroomShaderTemplatesNames[choosenIndex - shroomShaderTemplatesSize];	
								shaderEventTemplate = shroomShaderEventTemplates[? templateName];
							}
						}
					}
					
					#region Send Shader Event
					/*
					var isKilledByBullet = getValueFromMap(shroomState, "isKilledByBullet", false)
					if ((!isUndefined(shaderEventTemplate)) && (!isKilledByBullet)) {
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
					*/
					#endregion
					
					#endregion
				
					#region State persistence
					shroomState[? "endSpriteSet"] = true;
					#endregion
				}
				#endregion
				
				#region Movement
				var movedVerticalPosition = fetchMovedVerticalPositionOnGrid(
					getPositionVertical(shroomPosition), 
					-1 * getShroomSpeedValue(shroom) * 0.5);
				setPositionVertical(shroomPosition, movedVerticalPosition);
								
				if ((movedVerticalPosition >= 0.0) &&
					(movedVerticalPosition <= 1.5)) {
					//sendGridElementRenderRequest(shroomGridElement);
				} else {
					destroyShrooms = pushArray(destroyShrooms, index);
				}
				#endregion
				
				var dieTimer = getValueFromMap(shroomState, "dieTimer", 0);
				dieTimer = incrementTimer(dieTimer, 0.6 * GAME_FPS);
				if (dieTimer == 0.0) {
					destroyShrooms = pushArray(destroyShrooms, index);
					break;
				}
				shroomState[? "dieTimer"] = dieTimer;
				
				break;
		}

		#endregion
	}
	
	removeItemsFromList(shrooms, destroyShrooms, destroyShroom);
	#endregion
	
