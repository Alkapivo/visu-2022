///@function serializeShroomEmitter(shroomEmitter)
///@description Serialize ShroomEmitter to JSON string.
///@param {ShroomEmitter} shroomEmitter
///@return {String} shroomEmitterJsonString 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.747Z}

function serializeShroomEmitter(shroomEmitter) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"timer",
		getShroomEmitterTimer(shroomEmitter));	
	appendEntityToJsonObject(
		jsonObject,
		"positionBegin",
		getShroomEmitterPositionBegin(shroomEmitter),
		"Position");
	
	appendEntityToJsonObject(
		jsonObject,
		"positionEnd",
		getShroomEmitterPositionEnd(shroomEmitter),
		"Position");
	
	appendFieldToJsonObject(
		jsonObject,
		"duration",
		getShroomEmitterDuration(shroomEmitter));	
	appendFieldToJsonObject(
		jsonObject,
		"amount",
		getShroomEmitterAmount(shroomEmitter));	
	appendFieldToJsonObject(
		jsonObject,
		"interval",
		getShroomEmitterInterval(shroomEmitter));	
	appendEntityToJsonObject(
		jsonObject,
		"templates",
		getShroomEmitterTemplates(shroomEmitter),
		"ShroomTemplate",
		Array);
	

	var shroomEmitterJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return shroomEmitterJsonString;
	
}
