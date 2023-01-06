///@function createParticleManager([layerId])
///@description Constructor.
///@param {Layer} [layerId]
///@return {ParticleManager} particleManager
function createParticleManager() {

	var class = ParticleManager;
	var instanceLayer = argument_count > 0 ? argument[0] : getSystemLayer();
	
	var instance = defaultContextInstanceConstructor(class, "ParticleManager", instanceLayer);
	
	return instance;
	



}

///@function getParticleManager()
///@description Geter
///@return {Optional<ParticleManager>} particleManager
function getParticleManager() {

	return global.particleManagerContext;


}

///@function initializeParticleEffectDevHorizon()
///@description Particle Effect handler.
function initializeParticleEffectDevHorizon() {

	var particleEffectName = "particle_devhorizon";
	var particleEffect = part_type_create();
	var particleEffects = getParticleManager().particleEffects;
	
	part_type_shape(particleEffect, pt_shape_star);
	part_type_sprite(particleEffect, asset_texture_particle_devhorizon, 1, 0, 0);
	part_type_size(particleEffect, 0, 0.10, 0.02, 0.02);
	part_type_scale(particleEffect, 0.88, 1);
	part_type_orientation(particleEffect, 0, 0, 0, 0, 1);
	part_type_color3(particleEffect, 8263422, 16735833, 16777215);
	part_type_alpha3(particleEffect, 0.80, 0.50, 1);
	part_type_blend(particleEffect, 0);
	part_type_life(particleEffect, 40, 60);
	part_type_speed(particleEffect, 0.10, 1.0, 0.01, 0.02);
	part_type_direction(particleEffect, -45, 312, 0.50, 0.10);
	part_type_gravity(particleEffect, 0, 0);
	
	addToMap(particleEffects, particleEffectName, particleEffect);
	



}

///@function initializeparticleEffectExplosion()
///@description Particle Effect handler.
function initializeParticleEffectExplosion() {

	var particleEffectName = "particle_explosion";
	var particleEffect = part_type_create();
	var particleEffects = getParticleManager().particleEffects;
	
	part_type_shape(particleEffect, pt_shape_flare);
	part_type_size(particleEffect, 1, 1, 0.40, 0);
	part_type_scale(particleEffect, 0.10, 0.10);
	part_type_orientation(particleEffect, 0, 0, 0, 0, 0);
	part_type_color3(particleEffect, 9240575, 4763895, 255);
	part_type_alpha3(particleEffect, 0.53, 0.70, 0.86);
	part_type_blend(particleEffect, 0);
	part_type_life(particleEffect, 1, 50);
	part_type_speed(particleEffect, 1, 4, 0, 0);
	part_type_direction(particleEffect, 0, 360, 0, 0);
	part_type_gravity(particleEffect, 0, 0);
	
	addToMap(particleEffects, particleEffectName, particleEffect);
	



}


///@function initializeParticleEffectFusion()
///@description Particle Effect handler.
function initializeParticleEffectFusion() {

	var particleEffectName = "particle_fusion";
	var particleEffect = part_type_create();
	var particleEffects = getParticleManager().particleEffects;
	
	particleEffect = part_type_create();
	part_type_shape(particleEffect, pt_shape_spark);
	part_type_size(particleEffect, 0.10, 1.40, 0, 0);
	part_type_scale(particleEffect, 0.66, 1);
	part_type_orientation(particleEffect, 0, 360, 1, 0.10, 0);
	part_type_color3(particleEffect, 269770, 8388863, 16777215);
	part_type_alpha3(particleEffect, 0.70, 0.48, 1);
	part_type_blend(particleEffect, 1);
	part_type_life(particleEffect, 80, 80);
	part_type_speed(particleEffect, 0.50, 10, 0.01, 0.02);
	part_type_direction(particleEffect, 0, 360, 3, 0.20);
	part_type_gravity(particleEffect, 0, 0);
	
	addToMap(particleEffects, particleEffectName, particleEffect);
	



}

///@function initializeparticleEffectGUIScoreDown()
///@description Particle Effect handler.
function initializeParticleEffectGUIScoreDown() {

	var particleEffectName = "particle_gui_score_down";
	var particleEffect = part_type_create();
	var particleEffects = getParticleManager().particleEffects;
	
	part_type_shape(particleEffect, pt_shape_flare);
	part_type_size(particleEffect, 1, 1, 0.40, 0);
	part_type_scale(particleEffect, 0.10, 0.10);
	part_type_orientation(particleEffect, 0, 0, 0, 0, 0);
	part_type_color3(particleEffect, 9240575, 4763895, 255);
	part_type_alpha3(particleEffect, 0.9, 0.9, 0.9);
	part_type_blend(particleEffect, 0);
	part_type_life(particleEffect, 1, 50);
	part_type_speed(particleEffect, 1, 4, 0, 0);
	part_type_direction(particleEffect, 0, 360, 0, 0);
	part_type_gravity(particleEffect, 0, 0);
	
	addToMap(particleEffects, particleEffectName, particleEffect);
	



}

///@function initializeParticleEffectGUIScoreUp()
///@description Particle Effect handler.
function initializeParticleEffectGUIScoreUp() {

	var particleEffectName = "particle_gui_score_up";
	
	var particleEffect = part_type_create();
	var particleEffects = getParticleManager().particleEffects;
	
	part_type_shape(particleEffect, pt_shape_star);
	part_type_size(particleEffect, 1, 1, 0.20, 0);
	part_type_scale(particleEffect, 0.1, 0.1);
	part_type_orientation(particleEffect, 0, 360, 1, 0.10, 0);
	part_type_color3(particleEffect, 8453888, 65280, 8388863);
	part_type_alpha3(particleEffect, 0.60, 0.30, 0.31);
	part_type_blend(particleEffect, 1);
	part_type_life(particleEffect, 10, 50);
	part_type_speed(particleEffect, 0.20, 2.40, 0.02, 0);
	part_type_direction(particleEffect, 0, 360, 0, 0);
	part_type_gravity(particleEffect, 0, 88);
	
	addToMap(particleEffects, particleEffectName, particleEffect);
	



}

///@function initializeParticleEffectScore()
///@description Particle Effect handler.
function initializeParticleEffectScore() {

	var particleEffectName = "particle_score";
	
	var particleEffect = part_type_create();
	var particleEffects = getParticleManager().particleEffects;
	
	part_type_shape(particleEffect, pt_shape_star);
	part_type_size(particleEffect, 1, 1, 0.20, 0);
	part_type_scale(particleEffect, 0.1, 0.1);
	part_type_orientation(particleEffect, 0, 360, 1, 0.10, 0);
	part_type_color3(particleEffect, 8453888, 65280, 8388863);
	part_type_alpha3(particleEffect, 0.60, 0.30, 0.31);
	part_type_blend(particleEffect, 1);
	part_type_life(particleEffect, 10, 50);
	part_type_speed(particleEffect, 0.20, 0.40, 0, 0);
	part_type_direction(particleEffect, 0, 360, 0, 0);
	part_type_gravity(particleEffect, 0, 88);
	
	addToMap(particleEffects, particleEffectName, particleEffect);
	



}

///@function initializeParticleEffectSnow()
///@description Particle Effect handler.
function initializeParticleEffectSnow() {

	var particleEffectName = "particle_snow";
	
	var particleEffect = part_type_create();
	var particleEffects = getParticleManager().particleEffects;
	
	part_type_shape(particleEffect, pt_shape_snow);
	part_type_size(particleEffect, 1, 5, 0.01, 0);
	part_type_scale(particleEffect, 0.1, 0.1);
	part_type_orientation(particleEffect, 0, 360, 1, 0, 0);
	part_type_color3(particleEffect, 16777215, 16777215, 16762508);
	part_type_alpha3(particleEffect, 1, 0.70, 0.21);
	part_type_blend(particleEffect, 0);
	part_type_life(particleEffect, 150, 250);
	part_type_speed(particleEffect, 0.01, 0.10, 0.01, 0);
	part_type_direction(particleEffect, 270, 345, 0, 0);
	part_type_gravity(particleEffect, 0.03, 270);

	
	addToMap(particleEffects, particleEffectName, particleEffect);
	



}

///@function initializeParticleEffectSnow()
///@description Particle Effect handler.
function particleShroomExplosion() {

	var particleEffectName = "particle_shroom_explosion";
	
	var particleEffect = part_type_create();
	var particleEffects = getParticleManager().particleEffects;
	
	part_type_shape(particleEffect, pt_shape_sphere);
	part_type_size(particleEffect, 0.15, 1, 0.40, 0);
	part_type_scale(particleEffect, 0.10, 0.13);
	part_type_orientation(particleEffect, 0, 0, 0, 0, 0);
	part_type_color3(particleEffect, 65280, 16711680, 255);
	part_type_alpha3(particleEffect, 0.58, 1, 0);
	part_type_blend(particleEffect, 1);
	part_type_life(particleEffect, 20, 60);
	part_type_speed(particleEffect, 1, 4, 0, 0);
	part_type_direction(particleEffect, 0, 360, 0, 0);
	part_type_gravity(particleEffect, 0.22, 90);

	
	addToMap(particleEffects, particleEffectName, particleEffect);
}

///@function parseFieldsToParticleTask(particle, fields)
///@description Parser for GameEvent entity.
///@param {Map<String::Object>} fields
///@return {ParticleTask} particleTask
function parseFieldsToParticleTask(particle, fields) {
	
	var system = parseParticleSystemsStringToEnum(getValueFromMap(fields, "system", ParticleSystems.FOREGROUND));
	var amount = getValueFromMap(fields, "amount", 10);
	var duration = getValueFromMap(fields, "duration", 3.5);
	var emitterInterval = getValueFromMap(fields, "emitterInterval", 3.5);
	var positionBegin = getValueFromMap(fields, "positionBegin", [ 0.5, 0,5 ]);
	positionBegin = 
		isArray(positionBegin) ? 
			(getArrayLength(positionBegin) == 2.0 ? positionBegin : [ 0.5, 0.5 ]) :
			[ 0.5, 0.5 ];
	var positionEnd = getValueFromMap(fields, "positionEnd", [ 0.5, 0.5 ]);
	positionEnd = 
		isArray(positionEnd) ? 
			(getArrayLength(positionEnd) == 2.0 ? positionEnd : [ 0.5, 0.5 ]) :
			[ 0.5, 0.5 ];
	
	return createParticleTask(
		particle,
		system,
		amount,
		0.0,
		duration,
		emitterInterval,
		0.0,
		positionBegin,
		positionEnd
	);
}
