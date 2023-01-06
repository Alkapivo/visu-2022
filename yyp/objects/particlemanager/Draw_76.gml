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
				particleSurface = createSurface(global.viewWidth, global.viewHeight, true);
				particlesSurface[particleSystemIndex] = particleSurface;
			} else {
				if ((surface_get_width(particleSurface) != global.viewWidth) || 
					(surface_get_height(particleSurface) != global.viewHeight)) {
					surface_resize(particleSurface, global.viewWidth, global.viewHeight);
				}
			}
			#endregion

			#region Surface particleSurface[particleSystemIndex]
			gpuSetSurfaceTarget(particleSurface);
			drawClear(COLOR_TRANSPARENT);
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
			
				if (particleEmitterTimer == 0.0) {
					part_emitter_region(
						particleSystem, 
						particleEmitter,
						particlePositionBegin[0] * global.viewWidth, 
						particlePositionEnd[0] * global.viewWidth, 
						particlePositionBegin[1] * global.viewHeight, 
						particlePositionEnd[1] * global.viewHeight, 
						ps_shape_rectangle, 
						ps_distr_linear);
					part_emitter_burst(
						particleSystem, 
						particleEmitter, 
						particleEffect, 
						getParticleTaskAmount(particleTask));
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