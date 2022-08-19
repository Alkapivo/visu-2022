///@function destroyParticleTask(particleTask)
///@description Destroy ParticleTask entity.
///@param {ParticleTask} particleTask
///@throws {Exception}
///@generated {2022-08-18T22:24:59.663Z}

function destroyParticleTask(particleTask) {


	
	var particle = getParticleTaskParticle(particleTask);
	var particleSystem = getParticleTaskParticleSystem(particleTask);
	var amount = getParticleTaskAmount(particleTask);
	var timer = getParticleTaskTimer(particleTask);
	var emitterInterval = getParticleTaskEmitterInterval(particleTask);
	var emitterTimer = getParticleTaskEmitterTimer(particleTask);
	var duration = getParticleTaskDuration(particleTask);
	var positionBegin = getParticleTaskPositionBegin(particleTask);
	var positionEnd = getParticleTaskPositionEnd(particleTask);
	
	destroyPosition(positionBegin);
	setParticleTaskPositionBegin(particleTask, null);
	
	destroyPosition(positionEnd);
	setParticleTaskPositionEnd(particleTask, null);
	

	
}
