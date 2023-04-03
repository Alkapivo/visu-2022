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
			
			if (!part_system_exists(particleSystem)) {
				particleSystem = part_system_create();
				particleSystems[particleSystemIndex] = particleSystem;
				part_system_layer(particleSystems, layer);
			}
			
			if (!part_emitter_exists(particleSystem, particleEmitter)) {
				particleEmitter = part_emitter_create(particleSystem)	
				particleEmitters[particleSystemIndex] = particleEmitter;
			}

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
						(particlePositionBegin[0]),
						(particlePositionEnd[0]),
						(particlePositionBegin[1]),
						(particlePositionEnd[1]),
						ps_shape_ellipse, 
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
		
			removeItemsFromList(particleTaskPipeline, destroyParticleTasks, destroyParticleTask);
		}	
	}
	#endregion