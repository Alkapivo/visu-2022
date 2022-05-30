///@function appendSpriteToVertexBuffer(vertexBuffer, texture, depthOffset, uvs, xPos, yPos, width, height, color, alpha, isFlat)
///@description Append Sprite quad to vertexBuffer.
///@param {VertexBuffer} vertexBuffer
///@param {AssetTexture} texture
///@param {Number} depthOffset
///@param {Number[]} uvs
///@param {Number} xPos
///@param {Number} yPos
///@param {Number} width
///@param {Number} height
///@param {GMColor} color
///@param {Number} alpha
///@param {Boolean} isFlat
function appendSpriteToVertexBuffer(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10) {

		var vertexBuffer = argument0;
		var textureAsset = argument1;
		var depthOffset = argument2;
		var uvs = argument3;
		var xPos = argument4;
		var yPos = argument5;
		var width = argument6;
		var height = argument7;
		var color = argument8;
		var alpha = argument9;
		var isFlat = argument10;
	
		var texture = sprite_get_texture(textureAsset, 0);
		var shaderModifier = 1.0;
		var textureHeight = isFlat ? 0.0 : sprite_get_height(textureAsset) * shaderModifier;
	
		var textureAssetName = getAssetName(textureAsset, AssetTexture);
		if ((stringContains(textureAssetName, "wall")) ||
			(stringContains(textureAssetName, "window")) ||
			(stringContains(textureAssetName, "door"))) {
			depthOffset += 12;
		}
	
	
		var xStart = xPos;
		var yStart = yPos;
		var xEnd = xPos + width;
		var yEnd = yPos + height;
	
		var uStart = uvs[0];
		var vStart = uvs[1];
		var uEnd = uvs[2];
		var vEnd = uvs[3];
			
		vertex_position_3d(vertexBuffer, xStart, yStart, depthOffset - textureHeight);
		vertex_texcoord(vertexBuffer, uStart, vStart);
		vertex_color(vertexBuffer, color, alpha);
			
		vertex_position_3d(vertexBuffer, xEnd, yStart, depthOffset - textureHeight);
		vertex_texcoord(vertexBuffer, uEnd, vStart);
		vertex_color(vertexBuffer, color, alpha);
			
		vertex_position_3d(vertexBuffer, xStart, yEnd, depthOffset);
		vertex_texcoord(vertexBuffer, uStart, vEnd);
		vertex_color(vertexBuffer, color, alpha);
			
		vertex_position_3d(vertexBuffer, xStart, yEnd, depthOffset);
		vertex_texcoord(vertexBuffer, uStart, vEnd);
		vertex_color(vertexBuffer, color, alpha);
			
		vertex_position_3d(vertexBuffer, xEnd, yStart, depthOffset - textureHeight);
		vertex_texcoord(vertexBuffer, uEnd, vStart);
		vertex_color(vertexBuffer, color, alpha);
	
		vertex_position_3d(vertexBuffer, xEnd, yEnd, depthOffset);
		vertex_texcoord(vertexBuffer, uEnd, vEnd);
		vertex_color(vertexBuffer, color, alpha);
			
	



}
