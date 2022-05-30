///@function createShaderEvent(name, duration, data)
///@description Constructor for ShaderEvent entity.
///@param {String} name
///@param {Number} duration
///@param {Map<String::any>} data
///@return {ShaderEvent} shaderEvent 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.677Z}

function createShaderEvent(name, duration, data) {

	var shaderEvent = createEntity(ShaderEvent);

	setShaderEventName(shaderEvent, assertNoOptional(name));
	setShaderEventDuration(shaderEvent, assertNoOptional(duration));
	setShaderEventData(shaderEvent, assertNoOptional(data));

	return shaderEvent;
	
}
