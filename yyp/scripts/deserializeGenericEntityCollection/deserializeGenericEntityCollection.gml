///@function deserializeGenericEntityCollection(jsonString)
///@description Deserialize GenericEntityCollection from JSON String to GenericEntityCollection entity.
///@param {String} jsonString
///@return {GenericEntityCollection} genericEntityCollection 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.325Z}
function deserializeGenericEntityCollection(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var entryType = assertNoOptional(getJsonObjectFieldValue(jsonObject, "entryType"));
		var entriesType = assertNoOptional(getJsonObjectFieldValue(jsonObject, "entriesType"));
		var entries = assertNoOptional(getJsonObjectFieldValue(jsonObject, "entries"));

		destroyJsonObject(jsonObject);
	
		return createGenericEntityCollection(entryType, entriesType, entries);
	



}
