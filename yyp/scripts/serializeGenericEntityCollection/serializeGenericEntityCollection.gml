///@function serializeGenericEntityCollection(genericEntityCollection)
///@description Serialize GenericEntityCollection to JSON string.
///@param {GenericEntityCollection} genericEntityCollection
///@return {String} genericEntityCollectionJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.055Z}
function serializeGenericEntityCollection(argument0) {

		var genericEntityCollection = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"entryType",
			getGenericEntityCollectionEntryType(genericEntityCollection));	
		appendFieldToJsonObject(
			jsonObject,
			"entriesType",
			getGenericEntityCollectionEntriesType(genericEntityCollection));	
		appendFieldToJsonObject(
			jsonObject,
			"entries",
			getGenericEntityCollectionEntries(genericEntityCollection));	

		var genericEntityCollectionJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return genericEntityCollectionJsonString;
	



}
