///@function destroyParticleEvent(particleEvent)
///@description Destroy ParticleEvent entity.
///@param {ParticleEvent} particleEvent
///@throws {Exception}
///@generated {2021-08-25T13:56:53.596Z}

function destroyParticleEvent(particleEvent) {


	
	var particle = getParticleEventParticle(particleEvent);
	var fields = getParticleEventFields(particleEvent);
	
	destroyDataStructure(fields, Map, "Unable to destroy Map fields in ParticleEvent");
	setParticleEventFields(particleEvent, null);
	

	
}
