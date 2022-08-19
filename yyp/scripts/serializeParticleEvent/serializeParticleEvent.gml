///@function serializeParticleEvent(particleEvent)
///@description Serialize ParticleEvent to JSON string.
///@param {ParticleEvent} particleEvent
///@return {String} particleEventJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.653Z}

function serializeParticleEvent(particleEvent) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"particle",
		getParticleEventParticle(particleEvent));	
	appendFieldToJsonObject(
		jsonObject,
		"fields",
		getParticleEventFields(particleEvent),
		Map);
	

	var particleEventJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return particleEventJsonString;
	
}
