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
