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
