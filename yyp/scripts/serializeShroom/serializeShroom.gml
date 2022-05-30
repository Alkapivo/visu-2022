///@function serializeShroom(shroom)
///@description Serialize Shroom to JSON string.
///@param {Shroom} shroom
///@return {String} shroomJsonString 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.721Z}

function serializeShroom(shroom) {

	var jsonObject = createJsonObject();

	appendEntityToJsonObject(
		jsonObject,
		"gridElement",
		getShroomGridElement(shroom),
		"GridElement");
	
	appendFieldToJsonObject(
		jsonObject,
		"radius",
		getShroomRadius(shroom));	
	appendFieldToJsonObject(
		jsonObject,
		"speedValue",
		getShroomSpeedValue(shroom));	
	appendFieldToJsonObject(
		jsonObject,
		"state",
		getShroomState(shroom),
		Map);
	
	if (isOptionalPresent(getShroomText(shroom))) {
		appendFieldToJsonObject(
			jsonObject,
			"text",
			getShroomText(shroom));
	}
	
	appendFieldToJsonObject(
		jsonObject,
		"updateHandler",
		getShroomUpdateHandler(shroom));	
	if (isOptionalPresent(getShroomBulletCollisionHandler(shroom))) {
		appendFieldToJsonObject(
			jsonObject,
			"bulletCollisionHandler",
			getShroomBulletCollisionHandler(shroom));
	}
	
	if (isOptionalPresent(getShroomPlayerCollisionHandler(shroom))) {
		appendFieldToJsonObject(
			jsonObject,
			"playerCollisionHandler",
			getShroomPlayerCollisionHandler(shroom));
	}
	

	var shroomJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return shroomJsonString;
	
}
