///@function parseFieldsToParticleTask(particle, fields)
///@description Parser for GameEvent entity.
///@param {Map<String::Object>} fields
///@return {ParticleTask} particleTask
function parseFieldsToParticleTask(argument0, argument1) {

		var particle = argument0;
		var fields = argument1;
	
		var system = parseParticleSystemsStringToEnum(getValueFromMap(fields, "system", "background"));
		system = system == null ? ParticleSystems.FOREGROUND : system;
		var amount = getValueFromMap(fields, "amount", 10);
		var duration = getValueFromMap(fields, "duration", 3.5);
		var emitterInterval = getValueFromMap(fields, "emitterInterval", 3.5);
		var positionBegin = getValueFromMap(fields, "positionBegin", [ 0.5, 0,5 ]);
		positionBegin = 
			isArray(positionBegin) ? 
				(getArrayLength(positionBegin) == 2.0 ? positionBegin : [ 0.5, 0.5 ]) :
				[ 0.5, 0.5 ];
		var positionEnd = getValueFromMap(fields, "positionEnd", [ 0.5, 0.5 ]);
		positionEnd = 
			isArray(positionEnd) ? 
				(getArrayLength(positionEnd) == 2.0 ? positionEnd : [ 0.5, 0.5 ]) :
				[ 0.5, 0.5 ];
	
		return createParticleTask(
			particle,
			system,
			amount,
			0.0,
			duration,
			emitterInterval,
			0.0,
			positionBegin,
			positionEnd);
	



}
