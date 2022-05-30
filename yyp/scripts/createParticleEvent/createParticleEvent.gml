///@function createParticleEvent(particle, fields)
///@description Constructor for ParticleEvent entity.
///@param {String} particle
///@param {Map<String::any>} fields
///@return {ParticleEvent} particleEvent 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.596Z}

function createParticleEvent(particle, fields) {

	var particleEvent = createEntity(ParticleEvent);

	setParticleEventParticle(particleEvent, assertNoOptional(particle));
	setParticleEventFields(particleEvent, assertNoOptional(fields));

	return particleEvent;
	
}
