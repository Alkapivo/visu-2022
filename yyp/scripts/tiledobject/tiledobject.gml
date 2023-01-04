///@description TIledObject entity

///@function createTiledObject(type, name, texture, xPos, yPos, properties)
///@description Constructor for TiledObject entity.
///@param {String} type
///@param {Optional<String>} name
///@param {String} texture
///@param {Number} xPos
///@param {Number} yPos
///@param {Optional<Map<String::String>>} properties
///@return {TiledObject} tiledObject 
///@throws {Exception}
///@generated {2020-07-28T15:19:07.104Z}
function createTiledObject(argument0, argument1, argument2, argument3, argument4, argument5) {

		var type = argument0;
		var name = argument1;
		var texture = argument2;
		var xPos = argument3;
		var yPos = argument4;
		var properties = argument5;
	
		var tiledObject = createEntity(TiledObject);

		setTiledObjectType(tiledObject, assertNoOptional(type));
		setTiledObjectName(tiledObject, name);
		setTiledObjectTexture(tiledObject, assertNoOptional(texture));
		setTiledObjectXPos(tiledObject, assertNoOptional(xPos));
		setTiledObjectYPos(tiledObject, assertNoOptional(yPos));
		setTiledObjectProperties(tiledObject, properties);

		return tiledObject;
	



}
///@function serializeTiledObject(tiledObject)
///@description Serialize TiledObject to JSON string.
///@param {TiledObject} tiledObject
///@return {String} tiledObjectJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.465Z}
function serializeTiledObject(argument0) {

		var tiledObject = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"type",
			getTiledObjectType(tiledObject));	
		if (isOptionalPresent(getTiledObjectName(tiledObject))) {
			appendFieldToJsonObject(
				jsonObject,
				"name",
				getTiledObjectName(tiledObject));
		}
	
		appendFieldToJsonObject(
			jsonObject,
			"texture",
			getTiledObjectTexture(tiledObject));	
		appendFieldToJsonObject(
			jsonObject,
			"xPos",
			getTiledObjectXPos(tiledObject));	
		appendFieldToJsonObject(
			jsonObject,
			"yPos",
			getTiledObjectYPos(tiledObject));	
		if (isOptionalPresent(getTiledObjectProperties(tiledObject))) {
			appendFieldToJsonObject(
				jsonObject,
				"properties",
				getTiledObjectProperties(tiledObject),
				Map);
		}
	

		var tiledObjectJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return tiledObjectJsonString;
	



}
///@function deserializeTiledObject(jsonString)
///@description Deserialize TiledObject from JSON String to TiledObject entity.
///@param {String} jsonString
///@return {TiledObject} tiledObject 
///@throws {Exception}
///@generated {2020-07-28T15:19:07.105Z}
function deserializeTiledObject(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
		var name = getJsonObjectFieldValue(jsonObject, "name");
		var texture = assertNoOptional(getJsonObjectFieldValue(jsonObject, "texture"));
		var xPos = assertNoOptional(getJsonObjectFieldValue(jsonObject, "xPos"));
		var yPos = assertNoOptional(getJsonObjectFieldValue(jsonObject, "yPos"));
		var properties = getJsonObjectFieldValue(jsonObject, "properties", Map);

		destroyJsonObject(jsonObject);
	
		return createTiledObject(type, name, texture, xPos, yPos, properties);
	



}
///@function destroyTiledObject(tiledObject)
///@description Destroy TiledObject entity.
///@param {TiledObject} tiledObject
///@throws {Exception}
///@generated {2020-07-28T15:19:07.105Z}
function destroyTiledObject(argument0) {

		var tiledObject = argument0;
	
		var type = getTiledObjectType(tiledObject);
		var name = getTiledObjectName(tiledObject);
		var texture = getTiledObjectTexture(tiledObject);
		var xPos = getTiledObjectXPos(tiledObject);
		var yPos = getTiledObjectYPos(tiledObject);
		var properties = getTiledObjectProperties(tiledObject);
	
		if (isOptionalPresent(properties)) {
			destroyDataStructure(properties, Map, "Unable to destroy Map properties in TiledObject");
		}
		setTiledObjectProperties(tiledObject, null);
	

	



}
