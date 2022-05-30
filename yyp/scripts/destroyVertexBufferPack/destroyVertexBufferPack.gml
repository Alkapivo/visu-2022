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
