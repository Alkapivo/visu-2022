///@description

	super();
	
	#region Fields
	
///@public
	///@type {List<ParticleTask>[]}
	particleTaskPipelines = [];
		
	
///@private:
	///@type {ParticleSystems[]}
	particleSystemTypes = [
		ParticleSystems.BACKGROUND,
		ParticleSystems.FOREGROUND,
	]
	
	///@type {Surface}
	particlesSurface = [
		createSurface(1024, 1024),
		createSurface(1024, 1024),
	]
	
	///@type {ParticleSystem[]}
	particleSystems = [];

	///@type {Map<String::Particle}
	particleEffects = createMap();

	///@type {ParticleEmitter[]}
	particleEmitters = [];
	
	#endregion
	
	#region Particles initialization
	particleSystems = createArray(getArrayLength(particleSystemTypes));
	particleEmitters = createArray(getArrayLength(particleSystemTypes));
	particleTaskPipelines = createArray(getArrayLength(particleSystemTypes));
	for (var index = 0; index < getArrayLength(particleSystems); index++) {
		var particleSystem = part_system_create();
		part_system_layer(particleSystem, layer);
		part_system_automatic_draw(particleSystem, false);
		particleSystems[index] = particleSystem;
		particleEmitters[index] = part_emitter_create(particleSystem);
		particleTaskPipelines[index] = createList();
	}
	
	initializeParticleEffectDevHorizon();
	initializeParticleEffectExplosion();
	initializeParticleEffectScore();
	initializeParticleEffectFusion();
	initializeParticleEffectGUIScoreUp();
	initializeParticleEffectGUIScoreDown();
	initializeParticleEffectSnow();
	particleShroomExplosion()
	
	/// TODO initialzie
	starsSystem = part_system_create();
	part_system_layer(starsSystem, layer);
	starsEmitter = part_emitter_create(starsSystem);
	starsEffect = part_type_create();
	part_type_shape(starsEffect, pt_shape_line);
	part_type_size(starsEffect, 1, 2, 0.02, 0.20);
	part_type_scale(starsEffect, 0.10, 0.02);
	part_type_orientation(starsEffect, 0, 0, 0, 0, 1);
	part_type_color3(starsEffect, 14155774, 16754431, 16777215);
	part_type_alpha3(starsEffect, 0.33, 0.33, 0.33);
	part_type_blend(starsEffect, 0);
	part_type_life(starsEffect, 400, 700);
	part_type_speed(starsEffect, 0.10, 3.8, 0.01, 0);
	part_type_direction(starsEffect, 0, 360, 0, 0);
	part_type_gravity(starsEffect, 0, 0);
	#endregion
