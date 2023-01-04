///@description BossEvent entity

///@function createBossEvent(type)
///@description Constructor for BossEvent entity.
///@param {String} type
///@return {BossEvent} bossEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.547Z}

function createBossEvent(type) {

	var bossEvent = createEntity(BossEvent);

	setBossEventType(bossEvent, assertNoOptional(type));

	return bossEvent;
	
}
///@function serializeBossEvent(bossEvent)
///@description Serialize BossEvent to JSON string.
///@param {BossEvent} bossEvent
///@return {String} bossEventJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.547Z}

function serializeBossEvent(bossEvent) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"type",
		getBossEventType(bossEvent));	

	var bossEventJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return bossEventJsonString;
	
}
///@function deserializeBossEvent(jsonString)
///@description Deserialize BossEvent from JSON String to BossEvent entity.
///@param {String} jsonString
///@return {BossEvent} bossEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.547Z}

function deserializeBossEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));

	destroyJsonObject(jsonObject);
	
	return createBossEvent(type);
	
}
///@function destroyBossEvent(bossEvent)
///@description Destroy BossEvent entity.
///@param {BossEvent} bossEvent
///@throws {Exception}
///@generated {2022-08-18T22:24:59.547Z}

function destroyBossEvent(bossEvent) {


	
	var type = getBossEventType(bossEvent);
	

	
}
///@function getBossEventType(bossEvent)
///@description Getter.
///@param {BossEvent} bossEvent
///@return {String} type 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.547Z}

function getBossEventType(bossEvent) {

	return bossEvent[@ 0];
	
}
///@function setBossEventType(bossEvent, type)
///@description Setter.
///@param {BossEvent} bossEvent
///@param {String} type
///@throws {Exception}
///@generated {2022-08-18T22:24:59.547Z}

function setBossEventType(bossEvent, type) {

	bossEvent[@ 0] = type;
	
}
