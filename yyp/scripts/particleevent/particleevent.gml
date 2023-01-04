///@description ParticleEvent entity

///@function createParticleEvent(particle, fields)
///@description Constructor for ParticleEvent entity.
///@param {String} particle
///@param {Map<String::any>} fields
///@return {ParticleEvent} particleEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.653Z}

function createParticleEvent(particle, fields) {

	var particleEvent = createEntity(ParticleEvent);

	setParticleEventParticle(particleEvent, assertNoOptional(particle));
	setParticleEventFields(particleEvent, assertNoOptional(fields));

	return particleEvent;
	
}
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
///@function destroyParticleEvent(particleEvent)
///@description Destroy ParticleEvent entity.
///@param {ParticleEvent} particleEvent
///@throws {Exception}
///@generated {2022-08-18T22:24:59.653Z}

function destroyParticleEvent(particleEvent) {


	
	var particle = getParticleEventParticle(particleEvent);
	var fields = getParticleEventFields(particleEvent);
	
	destroyDataStructure(fields, Map, "Unable to destroy Map fields in ParticleEvent");
	setParticleEventFields(particleEvent, null);
	

	
}
///@function getParticleEventFields(particleEvent)
///@description Getter.
///@param {ParticleEvent} particleEvent
///@return {Map<String::any>} fields 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.653Z}

function getParticleEventFields(particleEvent) {

	return particleEvent[@ 1];
	
}
///@function getParticleEventParticle(particleEvent)
///@description Getter.
///@param {ParticleEvent} particleEvent
///@return {String} particle 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.653Z}

function getParticleEventParticle(particleEvent) {

	return particleEvent[@ 0];
	
}
///@function setParticleEventFields(particleEvent, fields)
///@description Setter.
///@param {ParticleEvent} particleEvent
///@param {Map<String::any>} fields
///@throws {Exception}
///@generated {2022-08-18T22:24:59.653Z}

function setParticleEventFields(particleEvent, fields) {

	particleEvent[@ 1] = fields;
	
}
///@function setParticleEventParticle(particleEvent, particle)
///@description Setter.
///@param {ParticleEvent} particleEvent
///@param {String} particle
///@throws {Exception}
///@generated {2022-08-18T22:24:59.653Z}

function setParticleEventParticle(particleEvent, particle) {

	particleEvent[@ 0] = particle;
	
}
