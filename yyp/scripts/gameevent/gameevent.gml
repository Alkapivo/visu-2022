///@description GameEvent entity

///@function createGameEvent(time, type, entity)
///@description Constructor for GameEvent entity.
///@param {Number} time
///@param {String} type
///@param {any} entity
///@return {GameEvent} gameEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.582Z}

function createGameEvent(time, type, entity) {

	var gameEvent = createEntity(GameEvent);

	setGameEventTime(gameEvent, assertNoOptional(time));
	setGameEventType(gameEvent, assertNoOptional(type));
	setGameEventEntity(gameEvent, assertNoOptional(entity));

	return gameEvent;
	
}
///@function serializeGameEvent(gameEvent)
///@description Serialize GameEvent to JSON string.
///@param {GameEvent} gameEvent
///@return {String} gameEventJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.582Z}

function serializeGameEvent(gameEvent) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"time",
		getGameEventTime(gameEvent));	
	appendFieldToJsonObject(
		jsonObject,
		"type",
		getGameEventType(gameEvent));	
	appendFieldToJsonObject(
		jsonObject,
		"entity",
		getGameEventEntity(gameEvent));	

	var gameEventJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return gameEventJsonString;
	
}
///@function deserializeGameEvent(jsonString)
///@description Deserialize GameEvent from JSON String to GameEvent entity.
///@param {String} jsonString
///@return {GameEvent} gameEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.582Z}

function deserializeGameEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var time = assertNoOptional(getJsonObjectFieldValue(jsonObject, "time"));
	var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
	var entity = assertNoOptional(getJsonObjectFieldValue(jsonObject, "entity"));

	destroyJsonObject(jsonObject);
	
	return createGameEvent(time, type, entity);
	
}
///@function destroyGameEvent(gameEvent)
///@description Destroy GameEvent entity.
///@param {GameEvent} gameEvent
///@generated {2019-10-23T07:40:07.811Z}
///@override
function destroyGameEvent(argument0) {

		var gameEvent = argument0;
	
	#region @override Destroy GameEvent
		var type = getGameEventType(gameEvent);
		var entity = getGameEventEntity(gameEvent);
		var destroyScript = getAssetIndex("destroy" + type, AssetScript);
		if (!isOptionalPresent(destroyScript)) {
			throwException(createException(NotImplementedException, stringParams("Cannot find destroy script for type {0}", type), runtimeExceptionHandler));
		}
		runScript(destroyScript, entity);
	#endregion
	



}
///@function getGameEventEntity(gameEvent)
///@description Getter.
///@param {GameEvent} gameEvent
///@return {any} entity 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.582Z}

function getGameEventEntity(gameEvent) {

	return gameEvent[@ 2];
	
}
///@function getGameEventTime(gameEvent)
///@description Getter.
///@param {GameEvent} gameEvent
///@return {Number} time 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.582Z}

function getGameEventTime(gameEvent) {

	return gameEvent[@ 0];
	
}
///@function getGameEventType(gameEvent)
///@description Getter.
///@param {GameEvent} gameEvent
///@return {String} type 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.582Z}

function getGameEventType(gameEvent) {

	return gameEvent[@ 1];
	
}
///@function setGameEventEntity(gameEvent, entity)
///@description Setter.
///@param {GameEvent} gameEvent
///@param {any} entity
///@throws {Exception}
///@generated {2022-08-18T22:24:59.582Z}

function setGameEventEntity(gameEvent, entity) {

	gameEvent[@ 2] = entity;
	
}
///@function setGameEventTime(gameEvent, time)
///@description Setter.
///@param {GameEvent} gameEvent
///@param {Number} time
///@throws {Exception}
///@generated {2022-08-18T22:24:59.582Z}

function setGameEventTime(gameEvent, time) {

	gameEvent[@ 0] = time;
	
}
///@function setGameEventType(gameEvent, type)
///@description Setter.
///@param {GameEvent} gameEvent
///@param {String} type
///@throws {Exception}
///@generated {2022-08-18T22:24:59.582Z}

function setGameEventType(gameEvent, type) {

	gameEvent[@ 1] = type;
	
}
