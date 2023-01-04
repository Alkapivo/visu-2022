///@description TiledLayer entity

///@function createTiledLayer(name, opacity, type, xPos, yPos, properties, data, width, height, objects, vertexBufferGroups, layers)
///@description Constructor for TiledLayer entity.
///@param {String} name
///@param {Number} opacity
///@param {String} type
///@param {Number} xPos
///@param {Number} yPos
///@param {Optional<Map<String::String>>} properties
///@param {Optional<String>} data
///@param {Optional<Integer>} width
///@param {Optional<Integer>} height
///@param {Optional<TiledObject[]>} objects
///@param {Optional<VertexBufferGroup[]>} vertexBufferGroups
///@param {Optional<TiledLayer[]>} layers
///@return {TiledLayer} tiledLayer 
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function createTiledLayer(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11) {

		var name = argument0;
		var opacity = argument1;
		var type = argument2;
		var xPos = argument3;
		var yPos = argument4;
		var properties = argument5;
		var data = argument6;
		var width = argument7;
		var height = argument8;
		var objects = argument9;
		var vertexBufferGroups = argument10;
		var layers = argument11;
	
		var tiledLayer = createEntity(TiledLayer);

		setTiledLayerName(tiledLayer, assertNoOptional(name));
		setTiledLayerOpacity(tiledLayer, assertNoOptional(opacity));
		setTiledLayerType(tiledLayer, assertNoOptional(type));
		setTiledLayerXPos(tiledLayer, assertNoOptional(xPos));
		setTiledLayerYPos(tiledLayer, assertNoOptional(yPos));
		setTiledLayerProperties(tiledLayer, properties);
		setTiledLayerData(tiledLayer, data);
		setTiledLayerWidth(tiledLayer, width);
		setTiledLayerHeight(tiledLayer, height);
		setTiledLayerObjects(tiledLayer, objects);
		setTiledLayerVertexBufferGroups(tiledLayer, vertexBufferGroups);
		setTiledLayerLayers(tiledLayer, layers);

		return tiledLayer;
	



}
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
///@function deserializeTiledLayer(jsonString)
///@description Deserialize TiledLayer from JSON String to TiledLayer entity.
///@param {String} jsonString
///@return {TiledLayer} tiledLayer 
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function deserializeTiledLayer(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
		var opacity = assertNoOptional(getJsonObjectFieldValue(jsonObject, "opacity"));
		var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
		var xPos = assertNoOptional(getJsonObjectFieldValue(jsonObject, "xPos"));
		var yPos = assertNoOptional(getJsonObjectFieldValue(jsonObject, "yPos"));
		var properties = getJsonObjectFieldValue(jsonObject, "properties", Map);
		var data = getJsonObjectFieldValue(jsonObject, "data");
		var width = getJsonObjectFieldValue(jsonObject, "width");
		var height = getJsonObjectFieldValue(jsonObject, "height");
		var objects = getJsonObjectFieldValue(jsonObject, "objects", Array, "TiledObject");
		var vertexBufferGroups = getJsonObjectFieldValue(jsonObject, "vertexBufferGroups", Array, "VertexBufferGroup");
		var layers = getJsonObjectFieldValue(jsonObject, "layers", Array, "TiledLayer");

		destroyJsonObject(jsonObject);
	
		return createTiledLayer(name, opacity, type, xPos, yPos, properties, data, width, height, objects, vertexBufferGroups, layers);
	



}
///@function destroyTiledLayer(tiledLayer)
///@description Destroy TiledLayer entity.
///@param {TiledLayer} tiledLayer
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function destroyTiledLayer(argument0) {

		var tiledLayer = argument0;
	
		var name = getTiledLayerName(tiledLayer);
		var opacity = getTiledLayerOpacity(tiledLayer);
		var type = getTiledLayerType(tiledLayer);
		var xPos = getTiledLayerXPos(tiledLayer);
		var yPos = getTiledLayerYPos(tiledLayer);
		var properties = getTiledLayerProperties(tiledLayer);
		var data = getTiledLayerData(tiledLayer);
		var width = getTiledLayerWidth(tiledLayer);
		var height = getTiledLayerHeight(tiledLayer);
		var objects = getTiledLayerObjects(tiledLayer);
		var vertexBufferGroups = getTiledLayerVertexBufferGroups(tiledLayer);
		var layers = getTiledLayerLayers(tiledLayer);
	
		if (isOptionalPresent(properties)) {
			destroyDataStructure(properties, Map, "Unable to destroy Map properties in TiledLayer");
		}
		setTiledLayerProperties(tiledLayer, null);
	
		if (isOptionalPresent(objects)) {
			for (var index = 0; index < getArrayLength(objects); index++) {
				var entity = objects[@ index];
				destroyTiledObject(entity);
			}
		}
		setTiledLayerObjects(tiledLayer, null);
	
		if (isOptionalPresent(vertexBufferGroups)) {
			for (var index = 0; index < getArrayLength(vertexBufferGroups); index++) {
				var entity = vertexBufferGroups[@ index];
				destroyVertexBufferGroup(entity);
			}
		}
		setTiledLayerVertexBufferGroups(tiledLayer, null);
	
		if (isOptionalPresent(layers)) {
			for (var index = 0; index < getArrayLength(layers); index++) {
				var entity = layers[@ index];
				destroyTiledLayer(entity);
			}
		}
		setTiledLayerLayers(tiledLayer, null);
	

	



}
///@function getTiledLayerData(tiledLayer)
///@description Getter.
///@param {TiledLayer} tiledLayer
///@return {Optional<String>} data 
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function getTiledLayerData(argument0) {

		return argument0[@ 6];
	



}
///@function getTiledLayerHeight(tiledLayer)
///@description Getter.
///@param {TiledLayer} tiledLayer
///@return {Optional<Integer>} height 
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function getTiledLayerHeight(argument0) {

		return argument0[@ 8];
	



}
///@function getTiledLayerLayers(tiledLayer)
///@description Getter.
///@param {TiledLayer} tiledLayer
///@return {Optional<TiledLayer[]>} layers 
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function getTiledLayerLayers(argument0) {

		return argument0[@ 11];
	



}
///@function getTiledLayerName(tiledLayer)
///@description Getter.
///@param {TiledLayer} tiledLayer
///@return {String} name 
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function getTiledLayerName(argument0) {

		return argument0[@ 0];
	



}
///@function getTiledLayerObjects(tiledLayer)
///@description Getter.
///@param {TiledLayer} tiledLayer
///@return {Optional<TiledObject[]>} objects 
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function getTiledLayerObjects(argument0) {

		return argument0[@ 9];
	



}
///@function getTiledLayerOpacity(tiledLayer)
///@description Getter.
///@param {TiledLayer} tiledLayer
///@return {Number} opacity 
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function getTiledLayerOpacity(argument0) {

		return argument0[@ 1];
	



}
///@function getTiledLayerProperties(tiledLayer)
///@description Getter.
///@param {TiledLayer} tiledLayer
///@return {Optional<Map<String::String>>} properties 
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function getTiledLayerProperties(argument0) {

		return argument0[@ 5];
	



}
///@function getTiledLayerType(tiledLayer)
///@description Getter.
///@param {TiledLayer} tiledLayer
///@return {String} type 
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function getTiledLayerType(argument0) {

		return argument0[@ 2];
	



}
///@function getTiledLayerVertexBufferGroups(tiledLayer)
///@description Getter.
///@param {TiledLayer} tiledLayer
///@return {Optional<VertexBufferGroup[]>} vertexBufferGroups 
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function getTiledLayerVertexBufferGroups(argument0) {

		return argument0[@ 10];
	



}
///@function getTiledLayerWidth(tiledLayer)
///@description Getter.
///@param {TiledLayer} tiledLayer
///@return {Optional<Integer>} width 
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function getTiledLayerWidth(argument0) {

		return argument0[@ 7];
	



}
///@function getTiledLayerXPos(tiledLayer)
///@description Getter.
///@param {TiledLayer} tiledLayer
///@return {Number} xPos 
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function getTiledLayerXPos(argument0) {

		return argument0[@ 3];
	



}
///@function getTiledLayerYPos(tiledLayer)
///@description Getter.
///@param {TiledLayer} tiledLayer
///@return {Number} yPos 
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function getTiledLayerYPos(argument0) {

		return argument0[@ 4];
	



}
///@function setTiledLayerData(tiledLayer, data)
///@description Setter.
///@param {TiledLayer} tiledLayer
///@param {Optional<String>} data
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function setTiledLayerData(argument0, argument1) {

		argument0[@ 6] = argument1;
	



}
///@function setTiledLayerHeight(tiledLayer, height)
///@description Setter.
///@param {TiledLayer} tiledLayer
///@param {Optional<Integer>} height
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function setTiledLayerHeight(argument0, argument1) {

		argument0[@ 8] = argument1;
	



}
///@function setTiledLayerLayers(tiledLayer, layers)
///@description Setter.
///@param {TiledLayer} tiledLayer
///@param {Optional<TiledLayer[]>} layers
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function setTiledLayerLayers(argument0, argument1) {

		argument0[@ 11] = argument1;
	



}
///@function setTiledLayerName(tiledLayer, name)
///@description Setter.
///@param {TiledLayer} tiledLayer
///@param {String} name
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function setTiledLayerName(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
///@function setTiledLayerObjects(tiledLayer, objects)
///@description Setter.
///@param {TiledLayer} tiledLayer
///@param {Optional<TiledObject[]>} objects
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function setTiledLayerObjects(argument0, argument1) {

		argument0[@ 9] = argument1;
	



}
///@function setTiledLayerOpacity(tiledLayer, opacity)
///@description Setter.
///@param {TiledLayer} tiledLayer
///@param {Number} opacity
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function setTiledLayerOpacity(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
///@function setTiledLayerProperties(tiledLayer, properties)
///@description Setter.
///@param {TiledLayer} tiledLayer
///@param {Optional<Map<String::String>>} properties
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function setTiledLayerProperties(argument0, argument1) {

		argument0[@ 5] = argument1;
	



}
///@function setTiledLayerType(tiledLayer, type)
///@description Setter.
///@param {TiledLayer} tiledLayer
///@param {String} type
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function setTiledLayerType(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}
///@function setTiledLayerVertexBufferGroups(tiledLayer, vertexBufferGroups)
///@description Setter.
///@param {TiledLayer} tiledLayer
///@param {Optional<VertexBufferGroup[]>} vertexBufferGroups
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function setTiledLayerVertexBufferGroups(argument0, argument1) {

		argument0[@ 10] = argument1;
	



}
///@function setTiledLayerWidth(tiledLayer, width)
///@description Setter.
///@param {TiledLayer} tiledLayer
///@param {Optional<Integer>} width
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function setTiledLayerWidth(argument0, argument1) {

		argument0[@ 7] = argument1;
	



}
///@function setTiledLayerXPos(tiledLayer, xPos)
///@description Setter.
///@param {TiledLayer} tiledLayer
///@param {Number} xPos
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function setTiledLayerXPos(argument0, argument1) {

		argument0[@ 3] = argument1;
	



}
///@function setTiledLayerYPos(tiledLayer, yPos)
///@description Setter.
///@param {TiledLayer} tiledLayer
///@param {Number} yPos
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function setTiledLayerYPos(argument0, argument1) {

		argument0[@ 4] = argument1;
	



}
