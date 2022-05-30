///@function parseParticleSystemsStringToEnum(particleSystemsString)
///@description Enum to String parser. Return null if particleSystemsString is invalid.
///@param {String} particleSystemsString
///@return {Optional<ParticleSystems>} particleSystems
function parseParticleSystemsStringToEnum(argument0) {

		var particleSystemsString = argument0;
	
		var particleSystems = null;
		switch (particleSystemsString) {
			case "background":
				particleSystems = ParticleSystems.BACKGROUND;
				break;
			case "foreground":
				particleSystems = ParticleSystems.FOREGROUND;
				break;
		}
	
		return particleSystems;
	



}
