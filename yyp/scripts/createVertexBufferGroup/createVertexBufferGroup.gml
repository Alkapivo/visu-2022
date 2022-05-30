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
