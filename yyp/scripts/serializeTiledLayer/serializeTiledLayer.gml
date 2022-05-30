///@function serializeTiledLayer(tiledLayer)
///@description Serialize TiledLayer to JSON string.
///@param {TiledLayer} tiledLayer
///@return {String} tiledLayerJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.421Z}
function serializeTiledLayer(argument0) {

		var tiledLayer = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"name",
			getTiledLayerName(tiledLayer));	
		appendFieldToJsonObject(
			jsonObject,
			"opacity",
			getTiledLayerOpacity(tiledLayer));	
		appendFieldToJsonObject(
			jsonObject,
			"type",
			getTiledLayerType(tiledLayer));	
		appendFieldToJsonObject(
			jsonObject,
			"xPos",
			getTiledLayerXPos(tiledLayer));	
		appendFieldToJsonObject(
			jsonObject,
			"yPos",
			getTiledLayerYPos(tiledLayer));	
		if (isOptionalPresent(getTiledLayerProperties(tiledLayer))) {
			appendFieldToJsonObject(
				jsonObject,
				"properties",
				getTiledLayerProperties(tiledLayer),
				Map);
		}
	
		if (isOptionalPresent(getTiledLayerData(tiledLayer))) {
			appendFieldToJsonObject(
				jsonObject,
				"data",
				getTiledLayerData(tiledLayer));
		}
	
		if (isOptionalPresent(getTiledLayerWidth(tiledLayer))) {
			appendFieldToJsonObject(
				jsonObject,
				"width",
				getTiledLayerWidth(tiledLayer));
		}
	
		if (isOptionalPresent(getTiledLayerHeight(tiledLayer))) {
			appendFieldToJsonObject(
				jsonObject,
				"height",
				getTiledLayerHeight(tiledLayer));
		}
	
		if (isOptionalPresent(getTiledLayerObjects(tiledLayer))) {
			appendEntityToJsonObject(
				jsonObject,
				"objects",
				getTiledLayerObjects(tiledLayer),
				"TiledObject",
				Array);
		}
	
		if (isOptionalPresent(getTiledLayerVertexBufferGroups(tiledLayer))) {
			appendEntityToJsonObject(
				jsonObject,
				"vertexBufferGroups",
				getTiledLayerVertexBufferGroups(tiledLayer),
				"VertexBufferGroup",
				Array);
		}
	
		if (isOptionalPresent(getTiledLayerLayers(tiledLayer))) {
			appendEntityToJsonObject(
				jsonObject,
				"layers",
				getTiledLayerLayers(tiledLayer),
				"TiledLayer",
				Array);
		}
	

		var tiledLayerJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return tiledLayerJsonString;
	



}
