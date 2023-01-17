///@description

	#region Render particles to surfaces
	var sceneRenderer = getSceneRenderer();
	var isResizeWindowEvent = false;
	if (!isResizeWindowEvent) {
		for (var index = 0; index < getArrayLength(particleTaskPipelines); index++) {
			var destroyParticleTasks = [];
		
			var particleSystemIndex = particleSystemTypes[index];
			var particleTaskPipeline = particleTaskPipelines[particleSystemIndex];
			var particleSystem = particleSystems[particleSystemIndex];
			var particleEmitter = particleEmitters[particleSystemIndex];
			var particleSurface = particlesSurface[particleSystemIndex];
			
			if (!part_system_exists(particleSystem)) {
				particleSystem = part_system_create();
				particleSystems[particleSystemIndex] = particleSystem;
				part_system_layer(particleSystems, layer);
			}
			
			if (!part_emitter_exists(particleSystem, particleEmitter)) {
				particleEmitter = part_emitter_create(particleSystem)	
				particleEmitters[particleSystemIndex] = particleEmitter;
			}
		
			#region @override guardSurface
			if (!surface_exists(particleSurface)) {
				particleSurface = createSurface(1024, 1024, true);
				particlesSurface[particleSystemIndex] = particleSurface;
			} else {
				if ((surface_get_width(particleSurface) != 1024) || 
					(surface_get_height(particleSurface) != 1024)) {
					surface_resize(particleSurface, 1024, 1024);
				}
			}
			#endregion

			#region Surface particleSurface[particleSystemIndex]
			gpuSetSurfaceTarget(particleSurface);
			Core.GPU.renderClearColor(GM_COLOR_BLACK, 0.0);
			var particleTaskPipelineSize = getListSize(particleTaskPipeline);
			for (var particleTaskIndex = 0; particleTaskIndex < particleTaskPipelineSize; particleTaskIndex++) {
				var particleTask = particleTaskPipeline[| particleTaskIndex];
				var particleEffect = particleEffects[? getParticleTaskParticle(particleTask)];
				if (isUndefined(particleEffect)) {
					logger("Found invalid ParticleTask", LogType.ERROR);	
					destroyParticleTasks = pushArray(destroyParticleTasks, particleTaskIndex);
					continue;
				}

				var particlePositionBegin = getParticleTaskPositionBegin(particleTask);
				var particlePositionEnd = getParticleTaskPositionEnd(particleTask);
				var particleEmitterTimer = getParticleTaskEmitterTimer(particleTask);
			
				var xOffset = 0;
				var yOffset = 0;
				if (isOptionalPresent(getPlaygroundController())) {
					xOffset = getPlaygroundController().GMObject.state.grid.view.x
					yOffset = getPlaygroundController().GMObject.state.grid.view.y
				}
			
				if (particleEmitterTimer == 0.0) {
					part_emitter_region(
						particleSystem, 
						particleEmitter,
						(particlePositionBegin[0] -xOffset) * 1024,
						(particlePositionEnd[0] - xOffset) * 1024,
						(particlePositionBegin[1] - yOffset) * 1024,
						(particlePositionEnd[1] - yOffset) * 1024,
						ps_shape_rectangle, 
						ps_distr_linear
					);
					part_emitter_burst(
						particleSystem, 
						particleEmitter, 
						particleEffect, 
						getParticleTaskAmount(particleTask)
					);
				}
				particleEmitterTimer = incrementTimer(particleEmitterTimer, getParticleTaskEmitterInterval(particleTask), 1 / GAME_FPS);
				setParticleTaskEmitterTimer(particleTask, particleEmitterTimer);
		
				var particleTimer = incrementTimer(getParticleTaskTimer(particleTask), getParticleTaskDuration(particleTask), 1 / GAME_FPS);
				if (particleTimer == 0.0) {
					destroyParticleTasks = pushArray(destroyParticleTasks, particleTaskIndex);
				}
				setParticleTaskTimer(particleTask, particleTimer);
			}
			part_system_drawit(particleSystem);
			gpuResetSurfaceTarget();
			#endregion
		
			removeItemsFromList(particleTaskPipeline, destroyParticleTasks, destroyParticleTask);
		}	
	}
	#endregion