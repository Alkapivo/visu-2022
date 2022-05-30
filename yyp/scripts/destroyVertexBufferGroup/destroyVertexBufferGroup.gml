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
