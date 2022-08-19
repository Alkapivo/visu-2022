///@function deserializeParticleEvent(jsonString)
///@description Deserialize ParticleEvent from JSON String to ParticleEvent entity.
///@param {String} jsonString
///@return {ParticleEvent} particleEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.653Z}

function deserializeParticleEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var particle = assertNoOptional(getJsonObjectFieldValue(jsonObject, "particle"));
	var fields = assertNoOptional(getJsonObjectFieldValue(jsonObject, "fields", Map));

	destroyJsonObject(jsonObject);
	
	return createParticleEvent(particle, fields);
	
}
