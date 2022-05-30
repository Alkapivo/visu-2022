///@function serializeSpaacePlayer(spaacePlayer)
///@description Serialize SpaacePlayer to JSON string.
///@param {SpaacePlayer} spaacePlayer
///@return {String} spaacePlayerJsonString 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.640Z}

function serializeSpaacePlayer(spaacePlayer) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"name",
		getSpaacePlayerName(spaacePlayer));	
	appendEntityToJsonObject(
		jsonObject,
		"gridElement",
		getSpaacePlayerGridElement(spaacePlayer),
		"GridElement");
	
	appendFieldToJsonObject(
		jsonObject,
		"status",
		getSpaacePlayerStatus(spaacePlayer));	
	appendFieldToJsonObject(
		jsonObject,
		"state",
		getSpaacePlayerState(spaacePlayer),
		Map);
	
	appendFieldToJsonObject(
		jsonObject,
		"inputHandler",
		getSpaacePlayerInputHandler(spaacePlayer));	
	appendFieldToJsonObject(
		jsonObject,
		"horizontalSpeed",
		getSpaacePlayerHorizontalSpeed(spaacePlayer));	
	appendFieldToJsonObject(
		jsonObject,
		"verticalSpeed",
		getSpaacePlayerVerticalSpeed(spaacePlayer));	
	appendFieldToJsonObject(
		jsonObject,
		"collisionRadius",
		getSpaacePlayerCollisionRadius(spaacePlayer));	

	var spaacePlayerJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return spaacePlayerJsonString;
	
}
