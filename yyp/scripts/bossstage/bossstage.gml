///@description BossStage entity

///@function createBossStage(name, timer, duration)
///@description Constructor for BossStage entity.
///@param {String} name
///@param {Number} timer
///@param {Number} duration
///@return {BossStage} bossStage 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.554Z}

function createBossStage(name, timer, duration) {

	var bossStage = createEntity(BossStage);

	setBossStageName(bossStage, assertNoOptional(name));
	setBossStageTimer(bossStage, assertNoOptional(timer));
	setBossStageDuration(bossStage, assertNoOptional(duration));

	return bossStage;
	
}
///@function serializeBossStage(bossStage)
///@description Serialize BossStage to JSON string.
///@param {BossStage} bossStage
///@return {String} bossStageJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.554Z}

function serializeBossStage(bossStage) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"name",
		getBossStageName(bossStage));	
	appendFieldToJsonObject(
		jsonObject,
		"timer",
		getBossStageTimer(bossStage));	
	appendFieldToJsonObject(
		jsonObject,
		"duration",
		getBossStageDuration(bossStage));	

	var bossStageJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return bossStageJsonString;
	
}
///@function deserializeBossStage(jsonString)
///@description Deserialize BossStage from JSON String to BossStage entity.
///@param {String} jsonString
///@return {BossStage} bossStage 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.554Z}

function deserializeBossStage(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
	var timer = assertNoOptional(getJsonObjectFieldValue(jsonObject, "timer"));
	var duration = assertNoOptional(getJsonObjectFieldValue(jsonObject, "duration"));

	destroyJsonObject(jsonObject);
	
	return createBossStage(name, timer, duration);
	
}
///@function destroyBossStage(bossStage)
///@description Destroy BossStage entity.
///@param {BossStage} bossStage
///@throws {Exception}
///@generated {2022-08-18T22:24:59.554Z}

function destroyBossStage(bossStage) {


	
	var name = getBossStageName(bossStage);
	var timer = getBossStageTimer(bossStage);
	var duration = getBossStageDuration(bossStage);
	

	
}
///@function getBossStageDuration(bossStage)
///@description Getter.
///@param {BossStage} bossStage
///@return {Number} duration 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.554Z}

function getBossStageDuration(bossStage) {

	return bossStage[@ 2];
	
}
///@function getBossStageName(bossStage)
///@description Getter.
///@param {BossStage} bossStage
///@return {String} name 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.554Z}

function getBossStageName(bossStage) {

	return bossStage[@ 0];
	
}
///@function getBossStageTimer(bossStage)
///@description Getter.
///@param {BossStage} bossStage
///@return {Number} timer 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.554Z}

function getBossStageTimer(bossStage) {

	return bossStage[@ 1];
	
}
///@function setBossStageDuration(bossStage, duration)
///@description Setter.
///@param {BossStage} bossStage
///@param {Number} duration
///@throws {Exception}
///@generated {2022-08-18T22:24:59.554Z}

function setBossStageDuration(bossStage, duration) {

	bossStage[@ 2] = duration;
	
}
///@function setBossStageName(bossStage, name)
///@description Setter.
///@param {BossStage} bossStage
///@param {String} name
///@throws {Exception}
///@generated {2022-08-18T22:24:59.554Z}

function setBossStageName(bossStage, name) {

	bossStage[@ 0] = name;
	
}
///@function setBossStageTimer(bossStage, timer)
///@description Setter.
///@param {BossStage} bossStage
///@param {Number} timer
///@throws {Exception}
///@generated {2022-08-18T22:24:59.554Z}

function setBossStageTimer(bossStage, timer) {

	bossStage[@ 1] = timer;
	
}
