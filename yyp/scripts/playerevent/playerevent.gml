///@description PlayerEvent entity

///@function createPlayerEvent(fields)
///@description Constructor for PlayerEvent entity.
///@param {Map<String::any>} fields
///@return {PlayerEvent} playerEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.723Z}

function createPlayerEvent(fields) {

	var playerEvent = createEntity(PlayerEvent);

	setPlayerEventFields(playerEvent, assertNoOptional(fields));

	return playerEvent;
	
}
///@function serializePlayerEvent(playerEvent)
///@description Serialize PlayerEvent to JSON string.
///@param {PlayerEvent} playerEvent
///@return {String} playerEventJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.723Z}

function serializePlayerEvent(playerEvent) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"fields",
		getPlayerEventFields(playerEvent),
		Map);
	

	var playerEventJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return playerEventJsonString;
	
}
///@function deserializePlayerEvent(jsonString)
///@description Deserialize PlayerEvent from JSON String to PlayerEvent entity.
///@param {String} jsonString
///@return {PlayerEvent} playerEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.723Z}

function deserializePlayerEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var fields = assertNoOptional(getJsonObjectFieldValue(jsonObject, "fields", Map));

	destroyJsonObject(jsonObject);
	
	return createPlayerEvent(fields);
	
}
///@function destroyPlayerEvent(playerEvent)
///@description Destroy PlayerEvent entity.
///@param {PlayerEvent} playerEvent
///@throws {Exception}
///@generated {2022-08-18T22:24:59.723Z}

function destroyPlayerEvent(playerEvent) {


	
	var fields = getPlayerEventFields(playerEvent);
	
	destroyDataStructure(fields, Map, "Unable to destroy Map fields in PlayerEvent");
	setPlayerEventFields(playerEvent, null);
	

	
}
///@function getPlayerEventFields(playerEvent)
///@description Getter.
///@param {PlayerEvent} playerEvent
///@return {Map<String::any>} fields 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.723Z}

function getPlayerEventFields(playerEvent) {

	return playerEvent[@ 0];
	
}
///@function setPlayerEventFields(playerEvent, fields)
///@description Setter.
///@param {PlayerEvent} playerEvent
///@param {Map<String::any>} fields
///@throws {Exception}
///@generated {2022-08-18T22:24:59.723Z}

function setPlayerEventFields(playerEvent, fields) {

	playerEvent[@ 0] = fields;
	
}
