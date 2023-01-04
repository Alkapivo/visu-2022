///@description GenericEntityCollection entity

///@function createGenericEntityCollection(entryType, entriesType, entries)
///@description Constructor for GenericEntityCollection entity.
///@param {EntityType} entryType
///@param {CollectionType} entriesType
///@param {EntityCollection} entries
///@return {GenericEntityCollection} genericEntityCollection 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.325Z}
function createGenericEntityCollection(argument0, argument1, argument2) {

		var entryType = argument0;
		var entriesType = argument1;
		var entries = argument2;
	
		var genericEntityCollection = createEntity(GenericEntityCollection);

		setGenericEntityCollectionEntryType(genericEntityCollection, assertNoOptional(entryType));
		setGenericEntityCollectionEntriesType(genericEntityCollection, assertNoOptional(entriesType));
		setGenericEntityCollectionEntries(genericEntityCollection, assertNoOptional(entries));

		return genericEntityCollection;
	



}
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
///@function destroyGenericEntityCollection(genericEntityCollection)
///@description Destroy GenericEntityCollection entity.
///@param {GenericEntityCollection} genericEntityCollection
///@throws {Exception}
///@generated {2020-09-28T21:11:15.325Z}
function destroyGenericEntityCollection(argument0) {

		var genericEntityCollection = argument0;
	
		var entryType = getGenericEntityCollectionEntryType(genericEntityCollection);
		var entriesType = getGenericEntityCollectionEntriesType(genericEntityCollection);
		var entries = getGenericEntityCollectionEntries(genericEntityCollection);
	

	



}
///@function getGenericEntityCollectionEntries(genericEntityCollection)
///@description Getter.
///@param {GenericEntityCollection} genericEntityCollection
///@return {EntityCollection} entries 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.325Z}
function getGenericEntityCollectionEntries(argument0) {

		return argument0[@ 2];
	



}
///@function getGenericEntityCollectionEntriesType(genericEntityCollection)
///@description Getter.
///@param {GenericEntityCollection} genericEntityCollection
///@return {CollectionType} entriesType 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.325Z}
function getGenericEntityCollectionEntriesType(argument0) {

		return argument0[@ 1];
	



}
///@function getGenericEntityCollectionEntryType(genericEntityCollection)
///@description Getter.
///@param {GenericEntityCollection} genericEntityCollection
///@return {EntityType} entryType 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.325Z}
function getGenericEntityCollectionEntryType(argument0) {

		return argument0[@ 0];
	



}
///@function setGenericEntityCollectionEntries(genericEntityCollection, entries)
///@description Setter.
///@param {GenericEntityCollection} genericEntityCollection
///@param {EntityCollection} entries
///@throws {Exception}
///@generated {2020-09-28T21:11:15.325Z}
function setGenericEntityCollectionEntries(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}
///@function setGenericEntityCollectionEntriesType(genericEntityCollection, entriesType)
///@description Setter.
///@param {GenericEntityCollection} genericEntityCollection
///@param {CollectionType} entriesType
///@throws {Exception}
///@generated {2020-09-28T21:11:15.325Z}
function setGenericEntityCollectionEntriesType(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
///@function setGenericEntityCollectionEntryType(genericEntityCollection, entryType)
///@description Setter.
///@param {GenericEntityCollection} genericEntityCollection
///@param {EntityType} entryType
///@throws {Exception}
///@generated {2020-09-28T21:11:15.325Z}
function setGenericEntityCollectionEntryType(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
