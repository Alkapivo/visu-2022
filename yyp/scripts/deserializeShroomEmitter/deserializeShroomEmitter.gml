///@function deserializeShroomEmitter(jsonString)
///@description Deserialize ShroomEmitter from JSON String to ShroomEmitter entity.
///@param {String} jsonString
///@return {ShroomEmitter} shroomEmitter 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.747Z}

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
