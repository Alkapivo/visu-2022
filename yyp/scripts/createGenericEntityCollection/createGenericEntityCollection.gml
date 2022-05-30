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
