///@description Boss entity

///@function createBoss(type, state, handler)
///@description Constructor for Boss entity.
///@param {BossType} type
///@param {Map<String::any>} state
///@param {AssetScript} handler
///@return {Boss} boss 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.534Z}

function createBoss(type, state, handler) {

	var boss = createEntity(Boss);

	setBossType(boss, assertNoOptional(type));
	setBossState(boss, assertNoOptional(state));
	setBossHandler(boss, assertNoOptional(handler));

	return boss;
	
}
///@function serializeBoss(boss)
///@description Serialize Boss to JSON string.
///@param {Boss} boss
///@return {String} bossJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.534Z}

function serializeBoss(boss) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"type",
		getBossType(boss));	
	appendFieldToJsonObject(
		jsonObject,
		"state",
		getBossState(boss),
		Map);
	
	appendFieldToJsonObject(
		jsonObject,
		"handler",
		getBossHandler(boss));	

	var bossJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return bossJsonString;
	
}
///@function deserializeBoss(jsonString)
///@description Deserialize Boss from JSON String to Boss entity.
///@param {String} jsonString
///@return {Boss} boss 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.535Z}

function deserializeBoss(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
	var state = assertNoOptional(getJsonObjectFieldValue(jsonObject, "state", Map));
	var handler = assertNoOptional(getJsonObjectFieldValue(jsonObject, "handler"));

	destroyJsonObject(jsonObject);
	
	return createBoss(type, state, handler);
	
}
///@function destroyBoss(boss)
///@description Destroy Boss entity.
///@param {Boss} boss
///@throws {Exception}
///@generated {2022-08-18T22:24:59.535Z}

function destroyBoss(boss) {


	
	var type = getBossType(boss);
	var state = getBossState(boss);
	var handler = getBossHandler(boss);
	
	destroyDataStructure(state, Map, "Unable to destroy Map state in Boss");
	setBossState(boss, null);
	

	
}

///@function getBossHandler(boss)
///@description Getter.
///@param {Boss} boss
///@return {AssetScript} handler 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.535Z}

function getBossHandler(boss) {

	return boss[@ 2];
	
}

///@function getBossState(boss)
///@description Getter.
///@param {Boss} boss
///@return {Map<String::any>} state 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.535Z}

function getBossState(boss) {

	return boss[@ 1];
	
}
///@function getBossType(boss)
///@description Getter.
///@param {Boss} boss
///@return {BossType} type 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.535Z}

function getBossType(boss) {

	return boss[@ 0];
	
}

///@function setBossHandler(boss, handler)
///@description Setter.
///@param {Boss} boss
///@param {AssetScript} handler
///@throws {Exception}
///@generated {2022-08-18T22:24:59.536Z}

function setBossHandler(boss, handler) {

	boss[@ 2] = handler;
	
}

///@function setBossState(boss, state)
///@description Setter.
///@param {Boss} boss
///@param {Map<String::any>} state
///@throws {Exception}
///@generated {2022-08-18T22:24:59.536Z}

function setBossState(boss, state) {

	boss[@ 1] = state;
	
}
///@function setBossType(boss, type)
///@description Setter.
///@param {Boss} boss
///@param {BossType} type
///@throws {Exception}
///@generated {2022-08-18T22:24:59.536Z}

function setBossType(boss, type) {

	boss[@ 0] = type;
	
}
