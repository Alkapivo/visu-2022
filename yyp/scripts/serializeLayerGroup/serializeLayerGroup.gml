///@function serializeLayerGroup(layerGroup)
///@description Serialize LayerGroup to JSON string.
///@param {LayerGroup} layerGroup
///@return {String} layerGroupJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:40.744Z}
function serializeLayerGroup(argument0) {

		var layerGroup = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"layerId",
			getLayerGroupLayerId(layerGroup));	
		appendFieldToJsonObject(
			jsonObject,
			"tilemap",
			getLayerGroupTilemap(layerGroup));	

		var layerGroupJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return layerGroupJsonString;
	



}
