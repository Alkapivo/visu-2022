///@description VertexObjectBuffer entity

///@function createVertexObjectBuffer(isFlat, texture, coords)
///@description Constructor for VertexObjectBuffer entity.
///@param {Boolean} isFlat
///@param {String} texture
///@param {Number[]} coords
///@return {VertexObjectBuffer} vertexObjectBuffer 
///@throws {Exception}
///@generated {2020-08-06T19:19:54.514Z}
function createVertexObjectBuffer(argument0, argument1, argument2) {

		var isFlat = argument0;
		var texture = argument1;
		var coords = argument2;
	
		var vertexObjectBuffer = createEntity(VertexObjectBuffer);

		setVertexObjectBufferIsFlat(vertexObjectBuffer, assertNoOptional(isFlat));
		setVertexObjectBufferTexture(vertexObjectBuffer, assertNoOptional(texture));
		setVertexObjectBufferCoords(vertexObjectBuffer, assertNoOptional(coords));

		return vertexObjectBuffer;
	



}
///@function serializeVertexObjectBuffer(vertexObjectBuffer)
///@description Serialize VertexObjectBuffer to JSON string.
///@param {VertexObjectBuffer} vertexObjectBuffer
///@return {String} vertexObjectBufferJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.514Z}
function serializeVertexObjectBuffer(argument0) {

		var vertexObjectBuffer = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"isFlat",
			getVertexObjectBufferIsFlat(vertexObjectBuffer));	
		appendFieldToJsonObject(
			jsonObject,
			"texture",
			getVertexObjectBufferTexture(vertexObjectBuffer));	
		appendFieldToJsonObject(
			jsonObject,
			"coords",
			getVertexObjectBufferCoords(vertexObjectBuffer),
			Array);
	

		var vertexObjectBufferJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return vertexObjectBufferJsonString;
	



}
///@function deserializeVertexObjectBuffer(jsonString)
///@description Deserialize VertexObjectBuffer from JSON String to VertexObjectBuffer entity.
///@param {String} jsonString
///@return {VertexObjectBuffer} vertexObjectBuffer 
///@throws {Exception}
///@generated {2020-08-06T19:19:54.514Z}
function deserializeVertexObjectBuffer(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var isFlat = assertNoOptional(getJsonObjectFieldValue(jsonObject, "isFlat"));
		var texture = assertNoOptional(getJsonObjectFieldValue(jsonObject, "texture"));
		var coords = assertNoOptional(getJsonObjectFieldValue(jsonObject, "coords", Array));

		destroyJsonObject(jsonObject);
	
		return createVertexObjectBuffer(isFlat, texture, coords);
	



}
///@function destroyVertexObjectBuffer(vertexObjectBuffer)
///@description Destroy VertexObjectBuffer entity.
///@param {VertexObjectBuffer} vertexObjectBuffer
///@throws {Exception}
///@generated {2020-08-06T19:19:54.514Z}
function destroyVertexObjectBuffer(argument0) {

		var vertexObjectBuffer = argument0;
	
		var isFlat = getVertexObjectBufferIsFlat(vertexObjectBuffer);
		var texture = getVertexObjectBufferTexture(vertexObjectBuffer);
		var coords = getVertexObjectBufferCoords(vertexObjectBuffer);
	
		setVertexObjectBufferCoords(vertexObjectBuffer, null);
	

	



}
///@function getVertexObjectBufferCoords(vertexObjectBuffer)
///@description Getter.
///@param {VertexObjectBuffer} vertexObjectBuffer
///@return {Number[]} coords 
///@throws {Exception}
///@generated {2020-08-06T19:21:59.500Z}
function getVertexObjectBufferCoords(argument0) {

		return argument0[@ 2];
	



}
///@function getVertexObjectBufferIsFlat(vertexObjectBuffer)
///@description Getter.
///@param {VertexObjectBuffer} vertexObjectBuffer
///@return {Boolean} isFlat 
///@throws {Exception}
///@generated {2020-08-06T19:21:59.500Z}
function getVertexObjectBufferIsFlat(argument0) {

		return argument0[@ 0];
	



}
///@function getVertexObjectBufferTexture(vertexObjectBuffer)
///@description Getter.
///@param {VertexObjectBuffer} vertexObjectBuffer
///@return {String} texture 
///@throws {Exception}
///@generated {2020-08-06T19:21:59.500Z}
function getVertexObjectBufferTexture(argument0) {

		return argument0[@ 1];
	



}
///@function setVertexObjectBufferCoords(vertexObjectBuffer, coords)
///@description Setter.
///@param {VertexObjectBuffer} vertexObjectBuffer
///@param {Number[]} coords
///@throws {Exception}
///@generated {2020-08-06T19:21:59.500Z}
function setVertexObjectBufferCoords(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}
///@function setVertexObjectBufferIsFlat(vertexObjectBuffer, isFlat)
///@description Setter.
///@param {VertexObjectBuffer} vertexObjectBuffer
///@param {Boolean} isFlat
///@throws {Exception}
///@generated {2020-08-06T19:21:59.500Z}
function setVertexObjectBufferIsFlat(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
///@function setVertexObjectBufferTexture(vertexObjectBuffer, texture)
///@description Setter.
///@param {VertexObjectBuffer} vertexObjectBuffer
///@param {String} texture
///@throws {Exception}
///@generated {2020-08-06T19:21:59.500Z}
function setVertexObjectBufferTexture(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
