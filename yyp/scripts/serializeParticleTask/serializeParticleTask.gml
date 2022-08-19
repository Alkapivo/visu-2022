///@function serializeParticleTask(particleTask)
///@description Serialize ParticleTask to JSON string.
///@param {ParticleTask} particleTask
///@return {String} particleTaskJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.663Z}

function serializeParticleTask(particleTask) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"particle",
		getParticleTaskParticle(particleTask));	
	appendFieldToJsonObject(
		jsonObject,
		"particleSystem",
		getParticleTaskParticleSystem(particleTask));	
	appendFieldToJsonObject(
		jsonObject,
		"amount",
		getParticleTaskAmount(particleTask));	
	appendFieldToJsonObject(
		jsonObject,
		"timer",
		getParticleTaskTimer(particleTask));	
	appendFieldToJsonObject(
		jsonObject,
		"emitterInterval",
		getParticleTaskEmitterInterval(particleTask));	
	appendFieldToJsonObject(
		jsonObject,
		"emitterTimer",
		getParticleTaskEmitterTimer(particleTask));	
	appendFieldToJsonObject(
		jsonObject,
		"duration",
		getParticleTaskDuration(particleTask));	
	appendEntityToJsonObject(
		jsonObject,
		"positionBegin",
		getParticleTaskPositionBegin(particleTask),
		"Position");
	
	appendEntityToJsonObject(
		jsonObject,
		"positionEnd",
		getParticleTaskPositionEnd(particleTask),
		"Position");
	

	var particleTaskJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return particleTaskJsonString;
	
}
