///@function createParticleTask(particle, particleSystem, amount, timer, duration, emitterInterval, emitterTimer, positionBegin, positionEnd)
///@description Create ParticleTask entity.
///@param {ParticleEffect} particle
///@param {ParticleSystems} particleSystem
///@param {Integer} amount
///@param {Number} timer
///@param {Number} duration
///@param {Number} emitterInterval
///@param {Number} emitterTimer
///@param {Position} positionBegin
///@param {Position} positionEnd
///@return {ParticleTask} particleTask 
///@generated {2019-11-05T15:50:13.099Z}
function createParticleTask(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {

		var particleTask = array_create(9);

		setParticleTaskParticle(particleTask, argument0);
		setParticleTaskParticleSystem(particleTask, argument1);
		setParticleTaskAmount(particleTask, argument2);
		setParticleTaskTimer(particleTask, argument3);
		setParticleTaskDuration(particleTask, argument4);
		setParticleTaskEmitterInterval(particleTask, argument5);
		setParticleTaskEmitterTimer(particleTask, argument6);
		setParticleTaskPositionBegin(particleTask, argument7);
		setParticleTaskPositionEnd(particleTask, argument8);

		return particleTask;
	



}

///@function destroyParticleTask(particleTask)
///@description Destroy ParticleTask entity.
///@param {ParticleTask} particleTask
///@generated {2019-11-05T15:50:13.100Z}
function destroyParticleTask(argument0) {

		var particleTask = argument0;
	
		var positionBegin = getParticleTaskPositionBegin(particleTask);
		var positionEnd = getParticleTaskPositionEnd(particleTask);
	
		destroyPosition(positionBegin);

		destroyPosition(positionEnd);

	



}

///@function getParticleTaskParticle(particleTask)
///@description Getter.
///@param {ParticleTask} particleTask
///@return {ParticleEffect} particle 
///@generated {2019-11-05T15:40:22.710Z}
function getParticleTaskParticle(argument0) {

		return argument0[@ 0];
	



}

///@function getParticleTaskParticleSystem(particleTask)
///@description Getter.
///@param {ParticleTask} particleTask
///@return {ParticleSystems} particleSystem 
///@generated {2019-11-05T15:40:22.711Z}
function getParticleTaskParticleSystem(argument0) {

		return argument0[@ 1];
	



}

///@function getParticleTaskAmount(particleTask)
///@description Getter.
///@param {ParticleTask} particleTask
///@return {Integer} amount 
///@generated {2019-11-05T15:40:22.711Z}
function getParticleTaskAmount(argument0) {

		return argument0[@ 2];
	



}

///@function getParticleTaskTimer(particleTask)
///@description Getter.
///@param {ParticleTask} particleTask
///@return {Number} timer 
///@generated {2019-11-05T15:40:22.711Z}
function getParticleTaskTimer(argument0) {

		return argument0[@ 3];
	



}

///@function getParticleTaskDuration(particleTask)
///@description Getter.
///@param {ParticleTask} particleTask
///@return {Number} duration 
///@generated {2019-11-05T15:40:22.711Z}
function getParticleTaskDuration(argument0) {

		return argument0[@ 4];
	



}

///@function getParticleTaskEmitterInterval(particleTask)
///@description Getter.
///@param {ParticleTask} particleTask
///@return {Number} emitterInterval 
///@generated {2019-11-05T15:46:39.078Z}
function getParticleTaskEmitterInterval(argument0) {

		return argument0[@ 5];
	



}

///@function getParticleTaskEmitterTimer(particleTask)
///@description Getter.
///@param {ParticleTask} particleTask
///@return {Number} emitterTimer 
///@generated {2019-11-05T15:50:13.100Z}
function getParticleTaskEmitterTimer(argument0) {

		return argument0[@ 6];
	



}

///@function getParticleTaskPositionBegin(particleTask)
///@description Getter.
///@param {ParticleTask} particleTask
///@return {Position} positionBegin 
///@generated {2019-11-05T15:50:13.100Z}
function getParticleTaskPositionBegin(argument0) {

		return argument0[@ 7];
	



}

///@function getParticleTaskPositionEnd(particleTask)
///@description Getter.
///@param {ParticleTask} particleTask
///@return {Position} positionEnd 
///@generated {2019-11-05T15:50:13.100Z}
function getParticleTaskPositionEnd(argument0) {

		return argument0[@ 8];
	



}

///@function setParticleTaskParticle(particleTask, particle)
///@description Setter.
///@param {ParticleTask} particleTask
///@param {ParticleEffect} particle
///@generated {2019-11-05T15:40:22.711Z}
function setParticleTaskParticle(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}

///@function setParticleTaskParticleSystem(particleTask, particleSystem)
///@description Setter.
///@param {ParticleTask} particleTask
///@param {ParticleSystems} particleSystem
///@generated {2019-11-05T15:40:22.711Z}
function setParticleTaskParticleSystem(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}

///@function setParticleTaskAmount(particleTask, amount)
///@description Setter.
///@param {ParticleTask} particleTask
///@param {Integer} amount
///@generated {2019-11-05T15:40:22.711Z}
function setParticleTaskAmount(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}

///@function setParticleTaskTimer(particleTask, timer)
///@description Setter.
///@param {ParticleTask} particleTask
///@param {Number} timer
///@generated {2019-11-05T15:40:22.711Z}
function setParticleTaskTimer(argument0, argument1) {

		argument0[@ 3] = argument1;
	



}

///@function setParticleTaskDuration(particleTask, duration)
///@description Setter.
///@param {ParticleTask} particleTask
///@param {Number} duration
///@generated {2019-11-05T15:40:22.711Z}
function setParticleTaskDuration(argument0, argument1) {

		argument0[@ 4] = argument1;
	



}

///@function setParticleTaskEmitterInterval(particleTask, emitterInterval)
///@description Setter.
///@param {ParticleTask} particleTask
///@param {Number} emitterInterval
///@generated {2019-11-05T15:46:39.079Z}
function setParticleTaskEmitterInterval(argument0, argument1) {

		argument0[@ 5] = argument1;
	



}

///@function setParticleTaskEmitterTimer(particleTask, emitterTimer)
///@description Setter.
///@param {ParticleTask} particleTask
///@param {Number} emitterTimer
///@generated {2019-11-05T15:50:13.100Z}
function setParticleTaskEmitterTimer(argument0, argument1) {

		argument0[@ 6] = argument1;
	



}

///@function setParticleTaskPositionBegin(particleTask, positionBegin)
///@description Setter.
///@param {ParticleTask} particleTask
///@param {Position} positionBegin
///@generated {2019-11-05T15:50:13.100Z}
function setParticleTaskPositionBegin(argument0, argument1) {

		argument0[@ 7] = argument1;
	



}

///@function setParticleTaskPositionEnd(particleTask, positionEnd)
///@description Setter.
///@param {ParticleTask} particleTask
///@param {Position} positionEnd
///@generated {2019-11-05T15:50:13.100Z}
function setParticleTaskPositionEnd(argument0, argument1) {

		argument0[@ 8] = argument1;
	



}












