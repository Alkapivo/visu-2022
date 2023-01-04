///@description GenericEntity entity

///@function createGenericEntity(type, object)
///@description Constructor for GenericEntity entity.
///@param {EntityType} type
///@param {Entity} object
///@return {GenericEntity} genericEntity 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.211Z}
function createGenericEntity(argument0, argument1) {

		var type = argument0;
		var object = argument1;
	
		var genericEntity = createEntity(GenericEntity);

		setGenericEntityType(genericEntity, assertNoOptional(type));
		setGenericEntityObject(genericEntity, assertNoOptional(object));

		return genericEntity;
	



}
///@function serializeGenericEntity(genericEntity)
///@description Serialize GenericEntity to JSON string.
///@param {GenericEntity} genericEntity
///@return {String} genericEntityJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.039Z}
function serializeGenericEntity(argument0) {

		var genericEntity = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"type",
			getGenericEntityType(genericEntity));	
		appendFieldToJsonObject(
			jsonObject,
			"object",
			getGenericEntityObject(genericEntity));	

		var genericEntityJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return genericEntityJsonString;
	



}
///@function deserializeGenericEntity(jsonString)
///@description Deserialize GenericEntity from JSON String to GenericEntity entity.
///@param {String} jsonString
///@return {GenericEntity} genericEntity 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.212Z}
function deserializeGenericEntity(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
		var object = assertNoOptional(getJsonObjectFieldValue(jsonObject, "object"));

		destroyJsonObject(jsonObject);
	
		return createGenericEntity(type, object);
	



}
///@function destroyGenericEntity(genericEntity)
///@description Destroy GenericEntity entity.
///@param {GenericEntity} genericEntity
///@throws {Exception}
///@generated {2020-09-28T21:11:15.212Z}
function destroyGenericEntity(argument0) {

		var genericEntity = argument0;
	
		var type = getGenericEntityType(genericEntity);
		var object = getGenericEntityObject(genericEntity);
	

	



}

///@function getGenericEntityObject(genericEntity)
///@description Getter.
///@param {GenericEntity} genericEntity
///@return {Entity} object 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.212Z}
function getGenericEntityObject(argument0) {

		return argument0[@ 1];
	



}
///@function getGenericEntityType(genericEntity)
///@description Getter.
///@param {GenericEntity} genericEntity
///@return {EntityType} type 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.212Z}
function getGenericEntityType(argument0) {

		return argument0[@ 0];
	



}

///@function setGenericEntityObject(genericEntity, object)
///@description Setter.
///@param {GenericEntity} genericEntity
///@param {Entity} object
///@throws {Exception}
///@generated {2020-09-28T21:11:15.212Z}
function setGenericEntityObject(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
///@function setGenericEntityType(genericEntity, type)
///@description Setter.
///@param {GenericEntity} genericEntity
///@param {EntityType} type
///@throws {Exception}
///@generated {2020-09-28T21:11:15.212Z}
function setGenericEntityType(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
