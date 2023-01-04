///@description ShroomEmitter entity

///@function createShroomEmitter(timer, positionBegin, positionEnd, duration, amount, interval, templates)
///@description Constructor for ShroomEmitter entity.
///@param {Number} timer
///@param {Position} positionBegin
///@param {Position} positionEnd
///@param {Number} duration
///@param {Integer} amount
///@param {Number} interval
///@param {ShroomTemplate[]} templates
///@return {ShroomEmitter} shroomEmitter 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.804Z}

function createShroomEmitter(timer, positionBegin, positionEnd, duration, amount, interval, templates) {

	var shroomEmitter = createEntity(ShroomEmitter);

	setShroomEmitterTimer(shroomEmitter, assertNoOptional(timer));
	setShroomEmitterPositionBegin(shroomEmitter, assertNoOptional(positionBegin));
	setShroomEmitterPositionEnd(shroomEmitter, assertNoOptional(positionEnd));
	setShroomEmitterDuration(shroomEmitter, assertNoOptional(duration));
	setShroomEmitterAmount(shroomEmitter, assertNoOptional(amount));
	setShroomEmitterInterval(shroomEmitter, assertNoOptional(interval));
	setShroomEmitterTemplates(shroomEmitter, assertNoOptional(templates));

	return shroomEmitter;
	
}
///@function serializeShroomEmitter(shroomEmitter)
///@description Serialize ShroomEmitter to JSON string.
///@param {ShroomEmitter} shroomEmitter
///@return {String} shroomEmitterJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.804Z}

function serializeShroomEmitter(shroomEmitter) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"timer",
		getShroomEmitterTimer(shroomEmitter));	
	appendEntityToJsonObject(
		jsonObject,
		"positionBegin",
		getShroomEmitterPositionBegin(shroomEmitter),
		"Position");
	
	appendEntityToJsonObject(
		jsonObject,
		"positionEnd",
		getShroomEmitterPositionEnd(shroomEmitter),
		"Position");
	
	appendFieldToJsonObject(
		jsonObject,
		"duration",
		getShroomEmitterDuration(shroomEmitter));	
	appendFieldToJsonObject(
		jsonObject,
		"amount",
		getShroomEmitterAmount(shroomEmitter));	
	appendFieldToJsonObject(
		jsonObject,
		"interval",
		getShroomEmitterInterval(shroomEmitter));	
	appendEntityToJsonObject(
		jsonObject,
		"templates",
		getShroomEmitterTemplates(shroomEmitter),
		"ShroomTemplate",
		Array);
	

	var shroomEmitterJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return shroomEmitterJsonString;
	
}
///@function deserializeShroomEmitter(jsonString)
///@description Deserialize ShroomEmitter from JSON String to ShroomEmitter entity.
///@param {String} jsonString
///@return {ShroomEmitter} shroomEmitter 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.804Z}

function deserializeShroomEmitter(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var timer = assertNoOptional(getJsonObjectFieldValue(jsonObject, "timer"));
	var positionBegin = assertNoOptional(getJsonObjectFieldValue(jsonObject, "positionBegin", Entity, "Position"));
	var positionEnd = assertNoOptional(getJsonObjectFieldValue(jsonObject, "positionEnd", Entity, "Position"));
	var duration = assertNoOptional(getJsonObjectFieldValue(jsonObject, "duration"));
	var amount = assertNoOptional(getJsonObjectFieldValue(jsonObject, "amount"));
	var interval = assertNoOptional(getJsonObjectFieldValue(jsonObject, "interval"));
	var templates = assertNoOptional(getJsonObjectFieldValue(jsonObject, "templates", Array, "ShroomTemplate"));

	destroyJsonObject(jsonObject);
	
	return createShroomEmitter(timer, positionBegin, positionEnd, duration, amount, interval, templates);
	
}
///@function destroyShroomEmitter(shroomEmitter)
///@description Destroy ShroomEmitter entity.
///@param {ShroomEmitter} shroomEmitter
///@throws {Exception}
///@generated {2022-08-18T22:24:59.804Z}

function destroyShroomEmitter(shroomEmitter) {


	
	var timer = getShroomEmitterTimer(shroomEmitter);
	var positionBegin = getShroomEmitterPositionBegin(shroomEmitter);
	var positionEnd = getShroomEmitterPositionEnd(shroomEmitter);
	var duration = getShroomEmitterDuration(shroomEmitter);
	var amount = getShroomEmitterAmount(shroomEmitter);
	var interval = getShroomEmitterInterval(shroomEmitter);
	var templates = getShroomEmitterTemplates(shroomEmitter);
	
	destroyPosition(positionBegin);
	setShroomEmitterPositionBegin(shroomEmitter, null);
	
	destroyPosition(positionEnd);
	setShroomEmitterPositionEnd(shroomEmitter, null);
	
	for (var index = 0; index < getArrayLength(templates); index++) {
		var entity = templates[@ index];
		destroyShroomTemplate(entity);
	}
	setShroomEmitterTemplates(shroomEmitter, null);
	

	
}
///@function getShroomEmitterAmount(shroomEmitter)
///@description Getter.
///@param {ShroomEmitter} shroomEmitter
///@return {Integer} amount 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.804Z}

function getShroomEmitterAmount(shroomEmitter) {

	return shroomEmitter[@ 4];
	
}
///@function getShroomEmitterDuration(shroomEmitter)
///@description Getter.
///@param {ShroomEmitter} shroomEmitter
///@return {Number} duration 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.804Z}

function getShroomEmitterDuration(shroomEmitter) {

	return shroomEmitter[@ 3];
	
}

///@function getShroomEmitterInterval(shroomEmitter)
///@description Getter.
///@param {ShroomEmitter} shroomEmitter
///@return {Number} interval 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.804Z}

function getShroomEmitterInterval(shroomEmitter) {

	return shroomEmitter[@ 5];
	
}
///@function getShroomEmitterNextTemplateIdx(shroomEmitter, nextTemplateIdx)
///@description Getter.
///@param {ShroomEmitter} shroomEmitter
///@creted {2020-08-02T22:56:20.593Z}
///@author krulig
function getShroomEmitterNextTemplateIdx(argument0) {

		return argument0[@ 7];
	



}
///@function getShroomEmitterPositionBegin(shroomEmitter)
///@description Getter.
///@param {ShroomEmitter} shroomEmitter
///@return {Position} positionBegin 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.804Z}

function getShroomEmitterPositionBegin(shroomEmitter) {

	return shroomEmitter[@ 1];
	
}
///@function getShroomEmitterPositionEnd(shroomEmitter)
///@description Getter.
///@param {ShroomEmitter} shroomEmitter
///@return {Position} positionEnd 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.804Z}

function getShroomEmitterPositionEnd(shroomEmitter) {

	return shroomEmitter[@ 2];
	
}
///@function getShroomEmitterTemplates(shroomEmitter)
///@description Getter.
///@param {ShroomEmitter} shroomEmitter
///@return {ShroomTemplate[]} templates 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.804Z}

function getShroomEmitterTemplates(shroomEmitter) {

	return shroomEmitter[@ 6];
	
}
///@function getShroomEmitterTimer(shroomEmitter)
///@description Getter.
///@param {ShroomEmitter} shroomEmitter
///@return {Number} timer 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.804Z}

function getShroomEmitterTimer(shroomEmitter) {

	return shroomEmitter[@ 0];
	
}
///@function setShroomEmitterAmount(shroomEmitter, amount)
///@description Setter.
///@param {ShroomEmitter} shroomEmitter
///@param {Integer} amount
///@throws {Exception}
///@generated {2022-08-18T22:24:59.804Z}

function setShroomEmitterAmount(shroomEmitter, amount) {

	shroomEmitter[@ 4] = amount;
	
}
///@function setShroomEmitterDuration(shroomEmitter, duration)
///@description Setter.
///@param {ShroomEmitter} shroomEmitter
///@param {Number} duration
///@throws {Exception}
///@generated {2022-08-18T22:24:59.804Z}

function setShroomEmitterDuration(shroomEmitter, duration) {

	shroomEmitter[@ 3] = duration;
	
}

///@function setShroomEmitterInterval(shroomEmitter, interval)
///@description Setter.
///@param {ShroomEmitter} shroomEmitter
///@param {Number} interval
///@throws {Exception}
///@generated {2022-08-18T22:24:59.804Z}

function setShroomEmitterInterval(shroomEmitter, interval) {

	shroomEmitter[@ 5] = interval;
	
}
///@function setShroomEmitterNextTemplateIdx(shroomEmitter, nextTemplateIdx)
///@description Setter.
///@param {ShroomEmitter} shroomEmitter
///@param {Number} nextTemplateIdx
///@creted {2020-08-02T22:56:20.593Z}
///@author krulig
function setShroomEmitterNextTemplateIdx(argument0, argument1) {

		argument0[@ 7] = argument1;
	


}
///@function setShroomEmitterPositionBegin(shroomEmitter, positionBegin)
///@description Setter.
///@param {ShroomEmitter} shroomEmitter
///@param {Position} positionBegin
///@throws {Exception}
///@generated {2022-08-18T22:24:59.804Z}

function setShroomEmitterPositionBegin(shroomEmitter, positionBegin) {

	shroomEmitter[@ 1] = positionBegin;
	
}
///@function setShroomEmitterPositionEnd(shroomEmitter, positionEnd)
///@description Setter.
///@param {ShroomEmitter} shroomEmitter
///@param {Position} positionEnd
///@throws {Exception}
///@generated {2022-08-18T22:24:59.804Z}

function setShroomEmitterPositionEnd(shroomEmitter, positionEnd) {

	shroomEmitter[@ 2] = positionEnd;
	
}
///@function setShroomEmitterTemplates(shroomEmitter, templates)
///@description Setter.
///@param {ShroomEmitter} shroomEmitter
///@param {ShroomTemplate[]} templates
///@throws {Exception}
///@generated {2022-08-18T22:24:59.804Z}

function setShroomEmitterTemplates(shroomEmitter, templates) {

	shroomEmitter[@ 6] = templates;
	
}
///@function setShroomEmitterTimer(shroomEmitter, timer)
///@description Setter.
///@param {ShroomEmitter} shroomEmitter
///@param {Number} timer
///@throws {Exception}
///@generated {2022-08-18T22:24:59.804Z}

function setShroomEmitterTimer(shroomEmitter, timer) {

	shroomEmitter[@ 0] = timer;
	
}
