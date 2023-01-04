///@description LayerGroup entity

///@function createLayerGroup(layerId, tilemap)
///@description Constructor for LayerGroup entity.
///@param {Layer} layerId
///@param {Tilemap} tilemap
///@return {LayerGroup} layerGroup 
///@throws {Exception}
///@generated {2020-07-28T15:19:08.406Z}
function createLayerGroup(argument0, argument1) {

		var layerId = argument0;
		var tilemap = argument1;
	
		var layerGroup = createEntity(LayerGroup);

		setLayerGroupLayerId(layerGroup, assertNoOptional(layerId));
		setLayerGroupTilemap(layerGroup, assertNoOptional(tilemap));

		return layerGroup;
	



}
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
///@function destroyLayerGroup(layerGroup)
///@description Destroy LayerGroup entity.
///@param {LayerGroup} layerGroup
///@throws {Exception}
///@generated {2020-07-28T15:19:08.406Z}
function destroyLayerGroup(argument0) {

		var layerGroup = argument0;
	
		var layerId = getLayerGroupLayerId(layerGroup);
		var tilemap = getLayerGroupTilemap(layerGroup);
	

	



}
///@function getLayerGroupLayerId(layerGroup)
///@description Getter.
///@param {LayerGroup} layerGroup
///@return {Layer} layerId 
///@throws {Exception}
///@generated {2020-07-28T15:19:08.406Z}
function getLayerGroupLayerId(argument0) {

		return argument0[@ 0];
	



}
///@function getLayerGroupTilemap(layerGroup)
///@description Getter.
///@param {LayerGroup} layerGroup
///@return {Tilemap} tilemap 
///@throws {Exception}
///@generated {2020-07-28T15:19:08.406Z}
function getLayerGroupTilemap(argument0) {

		return argument0[@ 1];
	



}
///@function setLayerGroupLayerId(layerGroup, layerId)
///@description Setter.
///@param {LayerGroup} layerGroup
///@param {Layer} layerId
///@throws {Exception}
///@generated {2020-07-28T15:19:08.406Z}
function setLayerGroupLayerId(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
///@function setLayerGroupTilemap(layerGroup, tilemap)
///@description Setter.
///@param {LayerGroup} layerGroup
///@param {Tilemap} tilemap
///@throws {Exception}
///@generated {2020-07-28T15:19:08.406Z}
function setLayerGroupTilemap(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
