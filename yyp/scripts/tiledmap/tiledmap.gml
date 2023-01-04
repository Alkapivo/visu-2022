///@description TiledMap entity

///@function createTiledMap(name, width, height, layers, tileWidth, tileHeight, compressMethod)
///@description Constructor for TiledMap entity.
///@param {String} name
///@param {Number} width
///@param {Number} height
///@param {TiledLayer[]} layers
///@param {Integer} tileWidth
///@param {Integer} tileHeight
///@param {TiledCompressMethod} compressMethod
///@return {TiledMap} tiledMap 
///@throws {Exception}
///@generated {2020-07-28T15:19:06.721Z}
function createTiledMap(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

		var name = argument0;
		var width = argument1;
		var height = argument2;
		var layers = argument3;
		var tileWidth = argument4;
		var tileHeight = argument5;
		var compressMethod = argument6;
	
		var tiledMap = createEntity(TiledMap);

		setTiledMapName(tiledMap, assertNoOptional(name));
		setTiledMapWidth(tiledMap, assertNoOptional(width));
		setTiledMapHeight(tiledMap, assertNoOptional(height));
		setTiledMapLayers(tiledMap, assertNoOptional(layers));
		setTiledMapTileWidth(tiledMap, assertNoOptional(tileWidth));
		setTiledMapTileHeight(tiledMap, assertNoOptional(tileHeight));
		setTiledMapCompressMethod(tiledMap, assertNoOptional(compressMethod));

		return tiledMap;
	



}
///@function serializeTiledMap(tiledMap)
///@description Serialize TiledMap to JSON string.
///@param {TiledMap} tiledMap
///@return {String} tiledMapJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.445Z}
function serializeTiledMap(argument0) {

		var tiledMap = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"name",
			getTiledMapName(tiledMap));	
		appendFieldToJsonObject(
			jsonObject,
			"width",
			getTiledMapWidth(tiledMap));	
		appendFieldToJsonObject(
			jsonObject,
			"height",
			getTiledMapHeight(tiledMap));	
		appendEntityToJsonObject(
			jsonObject,
			"layers",
			getTiledMapLayers(tiledMap),
			"TiledLayer",
			Array);
	
		appendFieldToJsonObject(
			jsonObject,
			"tileWidth",
			getTiledMapTileWidth(tiledMap));	
		appendFieldToJsonObject(
			jsonObject,
			"tileHeight",
			getTiledMapTileHeight(tiledMap));	
		appendFieldToJsonObject(
			jsonObject,
			"compressMethod",
			getTiledMapCompressMethod(tiledMap));	

		var tiledMapJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return tiledMapJsonString;
	



}
///@function deserializeTiledMap(jsonString)
///@description Deserialize TiledMap from JSON String to TiledMap entity.
///@param {String} jsonString
///@return {TiledMap} tiledMap 
///@throws {Exception}
///@generated {2020-07-28T15:19:06.721Z}
function deserializeTiledMap(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
		var width = assertNoOptional(getJsonObjectFieldValue(jsonObject, "width"));
		var height = assertNoOptional(getJsonObjectFieldValue(jsonObject, "height"));
		var layers = assertNoOptional(getJsonObjectFieldValue(jsonObject, "layers", Array, "TiledLayer"));
		var tileWidth = assertNoOptional(getJsonObjectFieldValue(jsonObject, "tileWidth"));
		var tileHeight = assertNoOptional(getJsonObjectFieldValue(jsonObject, "tileHeight"));
		var compressMethod = assertNoOptional(getJsonObjectFieldValue(jsonObject, "compressMethod"));

		destroyJsonObject(jsonObject);
	
		return createTiledMap(name, width, height, layers, tileWidth, tileHeight, compressMethod);
	



}
///@function destroyTiledMap(tiledMap)
///@description Destroy TiledMap entity.
///@param {TiledMap} tiledMap
///@throws {Exception}
///@generated {2020-07-28T15:19:06.721Z}
function destroyTiledMap(argument0) {

		var tiledMap = argument0;
	
		var name = getTiledMapName(tiledMap);
		var width = getTiledMapWidth(tiledMap);
		var height = getTiledMapHeight(tiledMap);
		var layers = getTiledMapLayers(tiledMap);
		var tileWidth = getTiledMapTileWidth(tiledMap);
		var tileHeight = getTiledMapTileHeight(tiledMap);
		var compressMethod = getTiledMapCompressMethod(tiledMap);
	
		for (var index = 0; index < getArrayLength(layers); index++) {
			var entity = layers[@ index];
			destroyTiledLayer(entity);
		}
		setTiledMapLayers(tiledMap, null);
	

	



}
///@function getTiledMapCompressMethod(tiledMap)
///@description Getter.
///@param {TiledMap} tiledMap
///@return {TiledCompressMethod} compressMethod 
///@throws {Exception}
///@generated {2020-07-28T15:19:06.721Z}
function getTiledMapCompressMethod(argument0) {

		return argument0[@ 6];
	



}
///@function getTiledMapHeight(tiledMap)
///@description Getter.
///@param {TiledMap} tiledMap
///@return {Number} height 
///@throws {Exception}
///@generated {2020-07-28T15:19:06.721Z}
function getTiledMapHeight(argument0) {

		return argument0[@ 2];
	



}
///@function getTiledMapLayers(tiledMap)
///@description Getter.
///@param {TiledMap} tiledMap
///@return {TiledLayer[]} layers 
///@throws {Exception}
///@generated {2020-07-28T15:19:06.721Z}
function getTiledMapLayers(argument0) {

		return argument0[@ 3];
	



}
///@function getTiledMapName(tiledMap)
///@description Getter.
///@param {TiledMap} tiledMap
///@return {String} name 
///@throws {Exception}
///@generated {2020-07-28T15:19:06.721Z}
function getTiledMapName(argument0) {

		return argument0[@ 0];
	



}
///@function getTiledMapTileHeight(tiledMap)
///@description Getter.
///@param {TiledMap} tiledMap
///@return {Integer} tileHeight 
///@throws {Exception}
///@generated {2020-07-28T15:19:06.721Z}
function getTiledMapTileHeight(argument0) {

		return argument0[@ 5];
	



}
///@function getTiledMapTileWidth(tiledMap)
///@description Getter.
///@param {TiledMap} tiledMap
///@return {Integer} tileWidth 
///@throws {Exception}
///@generated {2020-07-28T15:19:06.721Z}
function getTiledMapTileWidth(argument0) {

		return argument0[@ 4];
	



}
///@function getTiledMapWidth(tiledMap)
///@description Getter.
///@param {TiledMap} tiledMap
///@return {Number} width 
///@throws {Exception}
///@generated {2020-07-28T15:19:06.721Z}
function getTiledMapWidth(argument0) {

		return argument0[@ 1];
	



}
///@function setTiledMapCompressMethod(tiledMap, compressMethod)
///@description Setter.
///@param {TiledMap} tiledMap
///@param {TiledCompressMethod} compressMethod
///@throws {Exception}
///@generated {2020-07-28T15:19:06.721Z}
function setTiledMapCompressMethod(argument0, argument1) {

		argument0[@ 6] = argument1;
	



}
///@function setTiledMapHeight(tiledMap, height)
///@description Setter.
///@param {TiledMap} tiledMap
///@param {Number} height
///@throws {Exception}
///@generated {2020-07-28T15:19:06.721Z}
function setTiledMapHeight(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}
///@function setTiledMapLayers(tiledMap, layers)
///@description Setter.
///@param {TiledMap} tiledMap
///@param {TiledLayer[]} layers
///@throws {Exception}
///@generated {2020-07-28T15:19:06.721Z}
function setTiledMapLayers(argument0, argument1) {

		argument0[@ 3] = argument1;
	



}
///@function setTiledMapName(tiledMap, name)
///@description Setter.
///@param {TiledMap} tiledMap
///@param {String} name
///@throws {Exception}
///@generated {2020-07-28T15:19:06.721Z}
function setTiledMapName(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
///@function setTiledMapTileHeight(tiledMap, tileHeight)
///@description Setter.
///@param {TiledMap} tiledMap
///@param {Integer} tileHeight
///@throws {Exception}
///@generated {2020-07-28T15:19:06.721Z}
function setTiledMapTileHeight(argument0, argument1) {

		argument0[@ 5] = argument1;
	



}
///@function setTiledMapTileWidth(tiledMap, tileWidth)
///@description Setter.
///@param {TiledMap} tiledMap
///@param {Integer} tileWidth
///@throws {Exception}
///@generated {2020-07-28T15:19:06.721Z}
function setTiledMapTileWidth(argument0, argument1) {

		argument0[@ 4] = argument1;
	



}
///@function setTiledMapWidth(tiledMap, width)
///@description Setter.
///@param {TiledMap} tiledMap
///@param {Number} width
///@throws {Exception}
///@generated {2020-07-28T15:19:06.721Z}
function setTiledMapWidth(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
