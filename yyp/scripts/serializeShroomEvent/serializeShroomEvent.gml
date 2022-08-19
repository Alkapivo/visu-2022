///@function serializeShroomEvent(shroomEvent)
///@description Serialize ShroomEvent to JSON string.
///@param {ShroomEvent} shroomEvent
///@return {String} shroomEventJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.912Z}

function serializeShroomEvent(shroomEvent) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"fields",
		getShroomEventFields(shroomEvent),
		Map);
	

	var shroomEventJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return shroomEventJsonString;
	
}
