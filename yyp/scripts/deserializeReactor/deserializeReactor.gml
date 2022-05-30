///@function deserializeReactor(jsonString)
///@description Deserialize Reactor from JSON String to Reactor entity.
///@param {String} jsonString
///@return {Reactor} reactor 
///@throws {Exception}
///@generated {2020-09-16T10:38:11.478Z}
///@override
function deserializeReactor(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
		var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
	
	#region @override
		var data = createEmptyOptional();
		switch (type) {
			case ReactorType_LIST:
				data = assertNoOptional(getJsonObjectFieldValue(jsonObject, "data", List, getEntityClassName(type)));
				break;
			case ReactorType_MAP:
				data = assertNoOptional(getJsonObjectFieldValue(jsonObject, "data", Map, getEntityClassName(type)));
				break;
			default:
				logger("Found unsupported type in pipeline. Raw: {0}", LogType.ERROR, type);
				break;
		}
	#endregion
	
		var elementType = assertNoOptional(getJsonObjectFieldValue(jsonObject, "elementType"));
		var iterator = assertNoOptional(getJsonObjectFieldValue(jsonObject, "iterator"));
		var isGCRequired = assertNoOptional(getJsonObjectFieldValue(jsonObject, "isGCRequired"));

		destroyJsonObject(jsonObject);
	
		return createReactor(name, data, type, elementType, iterator, isGCRequired);
	



}
