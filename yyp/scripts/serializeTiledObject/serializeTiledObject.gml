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
