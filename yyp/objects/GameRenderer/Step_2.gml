 ///@description ShaderTaskPipeline, Stars

	var __isKeyPressed = injectInstanceVariable(this, "__isKeyPressed", false);
	__bktgtlich_ui_step(__isKeyPressed);
	setInstanceVariable(this, "__isKeyPressed", false);

	#region ShaderTaskPipeline
	var shaderPipelinesNamesSize = getListSize(shaderPipelinesNames);
	shaderPipeCurrentSize = 0;
	for (var index = 0; index < shaderPipelinesNamesSize; index++) {
		var shaderPipelineName = shaderPipelinesNames[| index];
		var shaderPipeline = shaderPipelines[? shaderPipelineName];
		
		var pipe = getShaderPipelinePipe(shaderPipeline);
		var buffer = getShaderPipelineBuffer(shaderPipeline);
		
		var pipeSize = getStackSize(pipe);
		
		var shaderLimit = 20;
		var shaderLimitCounter = 0;
		for (var taskIndex = 0; taskIndex < pipeSize; taskIndex++) {
			
			var task = popStack(pipe);
			shaderLimitCounter++;
			shaderPipeCurrentSize++;
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
	#endregion

	this.bpmController.update(this.bpmController);