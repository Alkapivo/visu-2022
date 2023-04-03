///@description 

	super();

	for (var index = 0; index < getArrayLength(particleTaskPipelines); index++) {
		var particleTaskPipeline = particleTaskPipelines[index];
		for (var particleIndex = 0; particleIndex < getListSize(particleTaskPipeline); particleIndex++) {
			var particleTask = particleTaskPipeline[| particleIndex];
			destroyParticleTask(particleTask);	
		}
		destroyDataStructure(particleTaskPipeline, List, "Unable to destroy particleTaskPipeline");
	}

	for (var key = mapFirst(particleEffects); iteratorFinish(key); key = mapNext(particleEffects, key)) {
		var particle = particleEffects[? key];
		
		// TODO destroyParticle
		if (part_type_exists(particle)) {
			part_type_destroy(particle);	
		}
	}
	destroyDataStructure(particleEffects, Map, "Unable to destroy particleEffects");
	
	for (var index = 0; index < getArrayLength(particleEmitters); index++) {
		var particleSystem = particleSystems[index];
		
		if (!part_system_exists(particleSystem)) {
			logger("Particle system {0} doesn't exist. Possible memory leak", LogType.ERROR, parseParticleSystemsEnumToString(index));
			continue;
		}
		var particleEmitter = particleEmitters[index];
				
		// TODO destroyParticleEmitter
		if (part_emitter_exists(particleSystem, particleEmitter)) {
			part_emitter_destroy(particleSystem, particleEmitter);	
		}
	}
	
	for (var index = 0; index < getArrayLength(particleSystems); index++) {
		particleSystem = particleSystems[index];
		part_emitter_destroy_all(particleSystem);
		part_system_destroy(particleSystem);
	}
	
	part_emitter_destroy_all(starsSystem);
	part_system_destroy(starsSystem);