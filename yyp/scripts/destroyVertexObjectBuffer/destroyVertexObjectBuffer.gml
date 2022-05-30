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
