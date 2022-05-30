///@function deserializeLayerGroup(jsonString)
///@description Deserialize LayerGroup from JSON String to LayerGroup entity.
///@param {String} jsonString
///@return {LayerGroup} layerGroup 
///@throws {Exception}
///@generated {2020-07-28T15:19:08.406Z}
function deserializeLayerGroup(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var layerId = assertNoOptional(getJsonObjectFieldValue(jsonObject, "layerId"));
		var tilemap = assertNoOptional(getJsonObjectFieldValue(jsonObject, "tilemap"));

		destroyJsonObject(jsonObject);
	
		return createLayerGroup(layerId, tilemap);
	



}
