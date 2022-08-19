///@function serializeVisuPlayer(visuPlayer)
///@description Serialize VisuPlayer to JSON string.
///@param {VisuPlayer} visuPlayer
///@return {String} visuPlayerJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.693Z}

function serializeVisuPlayer(visuPlayer) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"name",
		getVisuPlayerName(visuPlayer));	
	appendEntityToJsonObject(
		jsonObject,
		"gridElement",
		getVisuPlayerGridElement(visuPlayer),
		"GridElement");
	
	appendFieldToJsonObject(
		jsonObject,
		"status",
		getVisuPlayerStatus(visuPlayer));	
	appendFieldToJsonObject(
		jsonObject,
		"state",
		getVisuPlayerState(visuPlayer),
		Map);
	
	appendFieldToJsonObject(
		jsonObject,
		"inputHandler",
		getVisuPlayerInputHandler(visuPlayer));	
	appendFieldToJsonObject(
		jsonObject,
		"horizontalSpeed",
		getVisuPlayerHorizontalSpeed(visuPlayer));	
	appendFieldToJsonObject(
		jsonObject,
		"verticalSpeed",
		getVisuPlayerVerticalSpeed(visuPlayer));	
	appendFieldToJsonObject(
		jsonObject,
		"collisionRadius",
		getVisuPlayerCollisionRadius(visuPlayer));	

	var visuPlayerJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return visuPlayerJsonString;
	
}
