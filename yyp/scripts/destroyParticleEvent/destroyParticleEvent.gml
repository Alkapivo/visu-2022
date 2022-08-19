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
