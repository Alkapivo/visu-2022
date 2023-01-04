///@description VertexBufferGroup entity

///@function createVertexBufferGroup(chunkCoord, type, objectBuffer)
///@description Constructor for VertexBufferGroup entity.
///@param {Tuple} chunkCoord
///@param {String} type
///@param {VertexObjectBuffer[]} objectBuffer
///@return {VertexBufferGroup} vertexBufferGroup 
///@throws {Exception}
///@generated {2020-07-28T15:19:07.239Z}
function createVertexBufferGroup(argument0, argument1, argument2) {

		var chunkCoord = argument0;
		var type = argument1;
		var objectBuffer = argument2;
	
		var vertexBufferGroup = createEntity(VertexBufferGroup);

		setVertexBufferGroupChunkCoord(vertexBufferGroup, assertNoOptional(chunkCoord));
		setVertexBufferGroupType(vertexBufferGroup, assertNoOptional(type));
		setVertexBufferGroupObjectBuffer(vertexBufferGroup, assertNoOptional(objectBuffer));

		return vertexBufferGroup;
	



}
///@function serializeVertexBufferGroup(vertexBufferGroup)
///@description Serialize VertexBufferGroup to JSON string.
///@param {VertexBufferGroup} vertexBufferGroup
///@return {String} vertexBufferGroupJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.492Z}
function serializeVertexBufferGroup(argument0) {

		var vertexBufferGroup = argument0;
	
		var jsonObject = createJsonObject();

		appendEntityToJsonObject(
			jsonObject,
			"chunkCoord",
			getVertexBufferGroupChunkCoord(vertexBufferGroup),
			"Tuple");
	
		appendFieldToJsonObject(
			jsonObject,
			"type",
			getVertexBufferGroupType(vertexBufferGroup));	
		appendEntityToJsonObject(
			jsonObject,
			"objectBuffer",
			getVertexBufferGroupObjectBuffer(vertexBufferGroup),
			"VertexObjectBuffer",
			Array);
	

		var vertexBufferGroupJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return vertexBufferGroupJsonString;
	



}
///@function deserializeVertexBufferGroup(jsonString)
///@description Deserialize VertexBufferGroup from JSON String to VertexBufferGroup entity.
///@param {String} jsonString
///@return {VertexBufferGroup} vertexBufferGroup 
///@throws {Exception}
///@generated {2020-07-28T15:19:07.239Z}
function deserializeVertexBufferGroup(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var chunkCoord = assertNoOptional(getJsonObjectFieldValue(jsonObject, "chunkCoord", Entity, "Tuple"));
		var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
		var objectBuffer = assertNoOptional(getJsonObjectFieldValue(jsonObject, "objectBuffer", Array, "VertexObjectBuffer"));

		destroyJsonObject(jsonObject);
	
		return createVertexBufferGroup(chunkCoord, type, objectBuffer);
	



}
///@function destroyVertexBufferGroup(vertexBufferGroup)
///@description Destroy VertexBufferGroup entity.
///@param {VertexBufferGroup} vertexBufferGroup
///@throws {Exception}
///@generated {2020-07-28T15:19:07.239Z}
function destroyVertexBufferGroup(argument0) {

		var vertexBufferGroup = argument0;
	
		var chunkCoord = getVertexBufferGroupChunkCoord(vertexBufferGroup);
		var type = getVertexBufferGroupType(vertexBufferGroup);
		var objectBuffer = getVertexBufferGroupObjectBuffer(vertexBufferGroup);
	
		destroyTuple(chunkCoord);
		setVertexBufferGroupChunkCoord(vertexBufferGroup, null);
	
		for (var index = 0; index < getArrayLength(objectBuffer); index++) {
			var entity = objectBuffer[@ index];
			destroyVertexObjectBuffer(entity);
		}
		setVertexBufferGroupObjectBuffer(vertexBufferGroup, null);
	

	



}
///@function getVertexBufferGroupChunkCoord(vertexBufferGroup)
///@description Getter.
///@param {VertexBufferGroup} vertexBufferGroup
///@return {Tuple} chunkCoord 
///@throws {Exception}
///@generated {2020-07-28T15:19:07.239Z}
function getVertexBufferGroupChunkCoord(argument0) {

		return argument0[@ 0];
	



}
///@function getVertexBufferGroupObjectBuffer(vertexBufferGroup)
///@description Getter.
///@param {VertexBufferGroup} vertexBufferGroup
///@return {VertexObjectBuffer[]} objectBuffer 
///@throws {Exception}
///@generated {2020-07-28T15:19:07.239Z}
function getVertexBufferGroupObjectBuffer(argument0) {

		return argument0[@ 2];
	



}
///@function getVertexBufferGroupType(vertexBufferGroup)
///@description Getter.
///@param {VertexBufferGroup} vertexBufferGroup
///@return {String} type 
///@throws {Exception}
///@generated {2020-07-28T15:19:07.239Z}
function getVertexBufferGroupType(argument0) {

		return argument0[@ 1];
	



}
///@function setVertexBufferGroupChunkCoord(vertexBufferGroup, chunkCoord)
///@description Setter.
///@param {VertexBufferGroup} vertexBufferGroup
///@param {Tuple} chunkCoord
///@throws {Exception}
///@generated {2020-07-28T15:19:07.239Z}
function setVertexBufferGroupChunkCoord(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
///@function setVertexBufferGroupObjectBuffer(vertexBufferGroup, objectBuffer)
///@description Setter.
///@param {VertexBufferGroup} vertexBufferGroup
///@param {VertexObjectBuffer[]} objectBuffer
///@throws {Exception}
///@generated {2020-07-28T15:19:07.239Z}
function setVertexBufferGroupObjectBuffer(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}
///@function setVertexBufferGroupType(vertexBufferGroup, type)
///@description Setter.
///@param {VertexBufferGroup} vertexBufferGroup
///@param {String} type
///@throws {Exception}
///@generated {2020-07-28T15:19:07.239Z}
function setVertexBufferGroupType(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
