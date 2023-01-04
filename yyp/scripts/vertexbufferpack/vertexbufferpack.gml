///@description VertexBufferPack entity

///@function createVertexBufferPack(textureGroup, vertexBuffer, vertexFormat)
///@description Constructor for VertexBufferPack entity.
///@param {Texture} textureGroup
///@param {VertexBuffer} vertexBuffer
///@param {VertexFormat} vertexFormat
///@return {VertexBufferPack} vertexBufferPack 
///@throws {Exception}
///@generated {2020-08-06T16:38:03.154Z}
function createVertexBufferPack(argument0, argument1, argument2) {

		var textureGroup = argument0;
		var vertexBuffer = argument1;
		var vertexFormat = argument2;
	
		var vertexBufferPack = createEntity(VertexBufferPack);

		setVertexBufferPackTextureGroup(vertexBufferPack, assertNoOptional(textureGroup));
		setVertexBufferPackVertexBuffer(vertexBufferPack, assertNoOptional(vertexBuffer));
		setVertexBufferPackVertexFormat(vertexBufferPack, assertNoOptional(vertexFormat));

		return vertexBufferPack;
	



}
///@function serializeVertexBufferPack(vertexBufferPack)
///@description Serialize VertexBufferPack to JSON string.
///@param {VertexBufferPack} vertexBufferPack
///@return {String} vertexBufferPackJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.020Z}
function serializeVertexBufferPack(argument0) {

		var vertexBufferPack = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"textureGroup",
			getVertexBufferPackTextureGroup(vertexBufferPack));	
		appendFieldToJsonObject(
			jsonObject,
			"vertexBuffer",
			getVertexBufferPackVertexBuffer(vertexBufferPack));	
		appendFieldToJsonObject(
			jsonObject,
			"vertexFormat",
			getVertexBufferPackVertexFormat(vertexBufferPack));	

		var vertexBufferPackJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return vertexBufferPackJsonString;
	



}
///@function deserializeVertexBufferPack(jsonString)
///@description Deserialize VertexBufferPack from JSON String to VertexBufferPack entity.
///@param {String} jsonString
///@return {VertexBufferPack} vertexBufferPack 
///@throws {Exception}
///@generated {2020-08-06T16:38:03.154Z}
function deserializeVertexBufferPack(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var textureGroup = assertNoOptional(getJsonObjectFieldValue(jsonObject, "textureGroup"));
		var vertexBuffer = assertNoOptional(getJsonObjectFieldValue(jsonObject, "vertexBuffer"));
		var vertexFormat = assertNoOptional(getJsonObjectFieldValue(jsonObject, "vertexFormat"));

		destroyJsonObject(jsonObject);
	
		return createVertexBufferPack(textureGroup, vertexBuffer, vertexFormat);
	



}
///@function destroyVertexBufferPack(vertexBufferPack)
///@description Destroy VertexBufferPack entity.
///@param {VertexBufferPack} vertexBufferPack
///@throws {Exception}
///@generated {2020-08-06T16:38:33.328Z}
///@override
function destroyVertexBufferPack(argument0) {

		var vertexBufferPack = argument0;
	
		var textureGroup = getVertexBufferPackTextureGroup(vertexBufferPack);
		var vertexBuffer = getVertexBufferPackVertexBuffer(vertexBufferPack);
		var vertexFormat = getVertexBufferPackVertexFormat(vertexBufferPack);
	
	#region @override destroy vertexBuffer and vertexFormat
		vertex_delete_buffer(vertexBuffer);
		vertex_format_delete(vertexFormat);
	#endregion
	

	



}
///@function getVertexBufferPackTextureGroup(vertexBufferPack)
///@description Getter.
///@param {VertexBufferPack} vertexBufferPack
///@return {Texture} textureGroup 
///@throws {Exception}
///@generated {2020-07-28T15:19:08.556Z}
function getVertexBufferPackTextureGroup(argument0) {

		return argument0[@ 0];
	



}
///@function getVertexBufferPackVertexBuffer(vertexBufferPack)
///@description Getter.
///@param {VertexBufferPack} vertexBufferPack
///@return {VertexBuffer} vertexBuffer 
///@throws {Exception}
///@generated {2020-08-06T10:21:13.169Z}
function getVertexBufferPackVertexBuffer(argument0) {

		return argument0[@ 1];
	



}
///@function getVertexBufferPackVertexFormat(vertexBufferPack)
///@description Getter.
///@param {VertexBufferPack} vertexBufferPack
///@return {VertexFormat} vertexFormat 
///@throws {Exception}
///@generated {2020-08-06T16:38:03.154Z}
function getVertexBufferPackVertexFormat(argument0) {

		return argument0[@ 2];
	



}
///@function setVertexBufferPackTextureGroup(vertexBufferPack, textureGroup)
///@description Setter.
///@param {VertexBufferPack} vertexBufferPack
///@param {Texture} textureGroup
///@throws {Exception}
///@generated {2020-07-28T15:19:08.556Z}
function setVertexBufferPackTextureGroup(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
///@function setVertexBufferPackVertexBuffer(vertexBufferPack, vertexBuffer)
///@description Setter.
///@param {VertexBufferPack} vertexBufferPack
///@param {VertexBuffer} vertexBuffer
///@throws {Exception}
///@generated {2020-08-06T10:21:13.169Z}
function setVertexBufferPackVertexBuffer(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
///@function setVertexBufferPackVertexFormat(vertexBufferPack, vertexFormat)
///@description Setter.
///@param {VertexBufferPack} vertexBufferPack
///@param {VertexFormat} vertexFormat
///@throws {Exception}
///@generated {2020-08-06T16:38:03.154Z}
function setVertexBufferPackVertexFormat(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}
