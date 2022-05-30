///@function deserializeSystemEvent(jsonString)
///@description Deserialize SystemEvent from JSON String to SystemEvent entity.
///@param {String} jsonString
///@return {SystemEvent} systemEvent 
///@throws {Exception}
///@generated {2020-10-11T13:39:40.747Z}
function deserializeSystemEvent(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
		var timer = assertNoOptional(getJsonObjectFieldValue(jsonObject, "timer"));
		var data = getJsonObjectFieldValue(jsonObject, "data", Entity, "ArrayMap");

		destroyJsonObject(jsonObject);
	
		return createSystemEvent(type, timer, data);
	



}
