///@function parseParticleSystemsEnumToString(particleSystems)
///@description Enum to String parser. Return null if particleSystems is invalid.
///@param {ParticleSystems} particleSystems
///@return {Optional<String>} particleSystemsString
function parseParticleSystemsEnumToString(argument0) {

		var particleSystems = argument0;
	
		var particleSystemsString = null;
		switch (particleSystems) {
			case ParticleSystems.BACKGROUND:
				particleSystemsString = "background";
				break;
			case ParticleSystems.FOREGROUND:
				particleSystemsString = "foreground";
				break;
		}
	
		return particleSystemsString;
	



}
