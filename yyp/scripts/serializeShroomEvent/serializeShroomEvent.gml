///@function serializeShroomEvent(shroomEvent)
///@description Serialize ShroomEvent to JSON string.
///@param {ShroomEvent} shroomEvent
///@return {String} shroomEventJsonString 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.787Z}

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
