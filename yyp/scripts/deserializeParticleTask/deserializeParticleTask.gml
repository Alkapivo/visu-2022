///@function deserializeParticleTask(jsonString)
///@description Deserialize ParticleTask from JSON String to ParticleTask entity.
///@param {String} jsonString
///@return {ParticleTask} particleTask 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.607Z}

function deserializeParticleTask(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var particle = assertNoOptional(getJsonObjectFieldValue(jsonObject, "particle"));
	var particleSystem = assertNoOptional(getJsonObjectFieldValue(jsonObject, "particleSystem"));
	var amount = assertNoOptional(getJsonObjectFieldValue(jsonObject, "amount"));
	var timer = assertNoOptional(getJsonObjectFieldValue(jsonObject, "timer"));
	var emitterInterval = assertNoOptional(getJsonObjectFieldValue(jsonObject, "emitterInterval"));
	var emitterTimer = assertNoOptional(getJsonObjectFieldValue(jsonObject, "emitterTimer"));
	var duration = assertNoOptional(getJsonObjectFieldValue(jsonObject, "duration"));
	var positionBegin = assertNoOptional(getJsonObjectFieldValue(jsonObject, "positionBegin", Entity, "Position"));
	var positionEnd = assertNoOptional(getJsonObjectFieldValue(jsonObject, "positionEnd", Entity, "Position"));

	destroyJsonObject(jsonObject);
	
	return createParticleTask(particle, particleSystem, amount, timer, emitterInterval, emitterTimer, duration, positionBegin, positionEnd);
	
}
