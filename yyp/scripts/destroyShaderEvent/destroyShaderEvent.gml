///@function destroyShaderEvent(shaderEvent)
///@description Destroy ShaderEvent entity.
///@param {ShaderEvent} shaderEvent
///@throws {Exception}
///@generated {2022-08-18T22:24:59.731Z}

function destroyShaderEvent(shaderEvent) {


	
	var name = getShaderEventName(shaderEvent);
	var duration = getShaderEventDuration(shaderEvent);
	var data = getShaderEventData(shaderEvent);
	
	destroyDataStructure(data, Map, "Unable to destroy Map data in ShaderEvent");
	setShaderEventData(shaderEvent, null);
	

	
}
