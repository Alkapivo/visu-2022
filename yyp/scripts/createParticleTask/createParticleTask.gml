///@function createParticleTask(particle, particleSystem, amount, timer, emitterInterval, emitterTimer, duration, positionBegin, positionEnd)
///@description Constructor for ParticleTask entity.
///@param {ParticleEffect} particle
///@param {ParticleSystem} particleSystem
///@param {Integer} amount
///@param {Number} timer
///@param {Number} emitterInterval
///@param {Number} emitterTimer
///@param {Number} duration
///@param {Position} positionBegin
///@param {Position} positionEnd
///@return {ParticleTask} particleTask 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.663Z}

function createParticleTask(particle, particleSystem, amount, timer, emitterInterval, emitterTimer, duration, positionBegin, positionEnd) {

	var particleTask = createEntity(ParticleTask);

	setParticleTaskParticle(particleTask, assertNoOptional(particle));
	setParticleTaskParticleSystem(particleTask, assertNoOptional(particleSystem));
	setParticleTaskAmount(particleTask, assertNoOptional(amount));
	setParticleTaskTimer(particleTask, assertNoOptional(timer));
	setParticleTaskEmitterInterval(particleTask, assertNoOptional(emitterInterval));
	setParticleTaskEmitterTimer(particleTask, assertNoOptional(emitterTimer));
	setParticleTaskDuration(particleTask, assertNoOptional(duration));
	setParticleTaskPositionBegin(particleTask, assertNoOptional(positionBegin));
	setParticleTaskPositionEnd(particleTask, assertNoOptional(positionEnd));

	return particleTask;
	
}
