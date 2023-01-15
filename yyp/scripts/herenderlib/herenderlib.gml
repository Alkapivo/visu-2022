///@function drawClear(color)
///@description Wrapper for draw_clear and draw_clear_alpha
///@param {Color} color
function drawClear(argument0) {

		var color = argument0;
	
		draw_clear_alpha(
			colorToGMColor(color),
			getColorAlpha(color));
	



}

///@function drawLine(xBegin, yBegin, xEnd, yEnd, [width])
///@description Wrapper for drawLine
///@param {Number} xBegin
///@param {Number} yBegin
///@param {Number} xEnd
///@param {Number} yEnd
///@param {Number} [width]
function drawLine() {

		if (argument_count < 4) {
			logger("drawLine must have at least 4 arguments provided.", LogType.ERROR);
			return;	
		}

		var xBegin = argument[0];
		var yBegin = argument[1];
		var xEnd = argument[2];
		var yEnd = argument[3];
		var width = argument_count > 4 ? argument[4] : 1.0;
	
		// TODO add antyaliasing
		draw_line_width(
			xBegin,
			yBegin,
			xEnd,
			yEnd,
			width);
	



}

function drawShakeText() {
	/*
	 * argument0 - text
	 * argument1 - color
	 * argument2 - halign
	 * argument3 - valign
	 * argument4 - font
	 * argument5 - pos x
	 * argument6 - pos y
	 * argument7 - shakeX
	 * argument8 - shakeY
	 */


}

///@function drawSprite(sprite, xPosition, yPosition, [xScale], [yScale], [alpha], [angle], [color])
///@description Wrapper for draw_sprite and Sprite entity. Draw animated sprite (side effect, mutate sprite).
///@param {Sprite} sprite
///@param {Number} xPosition
///@param {Number} yPosition
///@param {Number} [xScale]
///@param {Number} [yScale]
///@param {Number} [alpha]
///@param {Number} [angle]
///@param {Number} [color]
function drawSprite() {

		if (argument_count < 3) {
			logger("drawSprite must have at least 3 arguments provided", LogType.ERROR);
			return;
		}

		var sprite = argument[0];
		var xPosition = argument[1];
		var yPosition = argument[2];
		var xScale = argument_count > 3 ? argument[3] : 1.0;
		var yScale = argument_count > 4 ? argument[4] : 1.0;
		var alpha = argument_count > 5 ? argument[5] : 1.0;
		var angle = argument_count > 6 ? argument[6] : 0.0;
		var color = argument_count > 7 ? argument[7] : c_white;
	
		var spriteIndex = getSpriteAssetIndex(sprite);
		var spriteFrames = sprite_get_number(spriteIndex);
		var animationSpeed = sprite_get_speed(spriteIndex);
		var currentFrame = clamp(0, getSpriteCurrentFrame(sprite), spriteFrames);
	
		// TODO draw_sprite_general
		draw_sprite_ext(
			spriteIndex, 
			currentFrame, 
			xPosition, 
			yPosition,
			xScale,
			yScale,
			angle,
			color,
			alpha);
		
		setSpriteCurrentFrame(sprite, incrementTimer(currentFrame, spriteFrames, animationSpeed / GAME_FPS));
	



}

///@function _renderSprite(sprite, xPosition, yPosition, [xScale], [yScale], [alpha], [angle], [color])
///@description Wrapper for draw_sprite and Sprite entity. Draw animated sprite (side effect, mutate sprite).
///@param {Sprite} sprite
///@param {Number} xPosition
///@param {Number} yPosition
///@param {Number} [xScale]
///@param {Number} [yScale]
///@param {Number} [alpha]
///@param {Number} [angle]
///@param {Number} [color]
function _renderSprite(sprite, xPosition, yPosition) {

	var xScale = getSpriteXScale(sprite);
	var yScale = getSpriteYScale(sprite);
	var alpha = getSpriteAlpha(sprite);
	var angle = getSpriteAngle(sprite);
	var color = getSpriteColor(sprite);
	var spriteIndex = getSpriteAssetIndex(sprite);
	var spriteFrames = sprite_get_number(spriteIndex);
	var animationSpeed = sprite_get_speed(spriteIndex);
	var currentFrame = clamp(0, getSpriteCurrentFrame(sprite), spriteFrames);
	setSpriteCurrentFrame(sprite, incrementTimer(currentFrame, spriteFrames, animationSpeed / GAME_FPS));
		
	draw_sprite_ext(
		spriteIndex, 
		currentFrame, 
		xPosition, 
		yPosition,
		xScale,
		yScale,
		angle,
		color,
		alpha
	);
}

///@function drawSpritePolygon(sprite, polygon2D, alpha)
///@description Wrapper for draw_sprite_pos.
///@param {Sprite} sprite
///@param {Tuple[]} polygon2D length must be 4
///@param {Number} alpha (normalized)
function drawSpritePolygon(argument0, argument1, argument2) {

		var sprite = argument0;
		var polygon2D = argument1;
		var alpha = argument2;
	
		if (getArrayLength(polygon2D) != 4) {
			// TODO Refactor after GML Update
			logger("Polygon2D length must be 4 in drawSpritePolygon", LogType.ERROR);
			return;
		}
	
		var spriteIndex = getSpriteAssetIndex(sprite);
		var spriteFrames = sprite_get_number(spriteIndex);
		var animationSpeed = sprite_get_speed(spriteIndex);
		var currentFrame = clamp(0, getSpriteCurrentFrame(sprite), spriteFrames);
	
		// TODO Refactor after GML Update
		var p1 = polygon2D[0];
		var p2 = polygon2D[1];
		var p3 = polygon2D[2];
		var p4 = polygon2D[3];
	
		draw_sprite_pos(
			spriteIndex,
			currentFrame,
			p1[0], p1[1],
			p2[0], p2[1],
			p3[0], p3[1],
			p4[0], p4[1],
			alpha);
	
		setSpriteCurrentFrame(sprite, incrementTimer(currentFrame, spriteFrames, animationSpeed / GAME_FPS));
	



}

///@function drawSurface(surface, xPosition, yPosition, [xScale], [yScale], [angle], [alpha], [blendColors], [origin], [textureBegin], [textureEnd])
///@description Wrapper for draw_surface_general with surface origin.
///@param {Surface} surface
///@param {Integer} [xPosition=0]
///@param {Integer} [yPosition=0]
///@param {Number} [xScale]
///@param {Number} [yScale]
///@param {Number} [angle] in degree
///@param {Number} [alpha] normalized
///@param {GMColor[]} [blendColors] can be one color or array of four. Corner order: [ top-left, top-right, bottom-right, bottom-left ]
///@param {Position} [origin] normalized
///@param {Position} [textureBegin] normalized
///@param {Position} [textureEnd] normalized
function drawSurface() {

		///checkArgumentCount(1, argument_count, drawSurface);
	
		var surface = argument[0];
		var xPosition = argument_count > 1? argument[1] : 0.0;
		var yPosition = argument_count > 2 ? argument[2] : 0.0;
		var xScale = argument_count > 3 ? argument[3] : 1.0;
		var yScale = argument_count > 4 ? argument[4] : 1.0;
		var angle = argument_count > 5 ? argument[5] : 0.0;
		var alpha = argument_count > 6 ? argument[6] : 1.0;
		var blendColors = argument_count > 7 ? argument[7]: [ c_white, c_white, c_white, c_white ];
		var origin = argument_count > 8 ? argument[8] : createPosition(0.0, 0.0);
		var textureBegin = argument_count > 9 ? argument[9] : createPosition(0.0, 0.0);
		var textureEnd = argument_count > 10 ? argument[10] : createPosition(1.0, 1.0);
	
	#region Sanitize blendColors
		if (!(isArray(blendColors)) ||
			!(getArrayLength(blendColors) > 3)) {
			var blendColor = isArray(blendColors) && getArrayLength(blendColors) > 0 ? blendColors[0] : c_white;
			blendColors = [
				blendColor,
				blendColor,
				blendColor,
				blendColor
			];
		}
	#endregion
	
	#region Render normalized positions
		var width = surface_get_width(surface);
		var height = surface_get_height(surface);
		var surfaceXOrigin = getPositionHorizontal(origin) * width;
		var surfaceYOrigin = getPositionVertical(origin) * height;
		var surfaceXOriginBegin = getPositionHorizontal(textureBegin) * width;
		var surfaceYOriginBegin = getPositionVertical(textureBegin) * height;
		var surfaceXOriginEnd = getPositionHorizontal(textureEnd) * width;
		var surfaceYOriginEnd = getPositionVertical(textureEnd) * height;
		var xPoint = xPosition + ((width * origin[0]) - (dcos(angle) * (surfaceXOrigin * xScale)) - (dsin(angle) * (surfaceYOrigin * yScale)));
		var yPoint = yPosition + ((height * origin[1]) - (dcos(angle) * (surfaceYOrigin * yScale)) + (dsin(angle) * (surfaceXOrigin * xScale)));
	#endregion
	

		draw_surface_general(
			surface,
			surfaceXOriginBegin,
			surfaceYOriginBegin,
			surfaceXOriginEnd,
			surfaceYOriginEnd,
			xPoint,
			yPoint,
			xScale,
			yScale,
			angle,
			blendColors[0],
			blendColors[1],
			blendColors[2],
			blendColors[3],
			alpha);
	



}

///@function drawSurfaceStretched(surface, xPosition, yPosition, width, height)
///@description Wrapper for draw_surface_stretched.
///@param {Surface} surface
///@param {Number} xPosition
///@param {Number} yPosition
///@param {Integer} width
///@param {Integer} height
function drawSurfaceStretched(argument0, argument1, argument2, argument3, argument4) {

		var surface = argument0;
		var xPosition = argument1;
		var yPosition = argument2;
		var width = argument3;
		var height = argument4;
	
		draw_surface_stretched(surface, xPosition, yPosition, width, height);
	



}

///@function drawTextOutline(x, y, text, outlineColor, textColor)  
///@description wrapper for draw_text with outline effect
///@param {Integer} x
///@param {Integer} y
///@param {String} text
///@param {GMColor} [outlineColor=c_black]
///@param {GMColor} [textColor=c_white]
///@param {Integer} [alpha=1.0]
function drawTextOutline() {

		///checkArgumentCount(3, argument_count, drawTextOutline);

		var xx = argument[0];  
		var yy = argument[1]; 
		var text = argument[2];
		var outlineColor = argument_count > 3 ? argument[3] : c_black
		var textColor = argument_count > 4 ? argument[4] : c_white
		var alpha = argument_count > 5 ? argument[5] : 1.0;
	
	
		draw_text_color(xx + 1, yy + 1, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(xx - 1, yy - 1, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(xx,     yy + 1, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(xx + 1, yy    , text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(xx,     yy - 1, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(xx - 1, yy    , text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(xx - 1, yy + 1, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(xx + 1, yy - 1, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  /*
		draw_text_color(xx + 2, yy + 2, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(xx - 2, yy - 2, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(xx,     yy + 2, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(xx + 2, yy    , text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(xx,     yy - 2, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(xx - 2, yy    , text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(xx - 2, yy + 2, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(xx + 2, yy - 2, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);
	*/
	
		draw_text_color(xx, yy, text, textColor, textColor, textColor, textColor, alpha);
	



}

///@function drawTilemapPartial(tilemap, xBegin, xBegin, width, height, cellSize);
///@description Like draw_tilemap it will draw tilemap but only tiles from specified range (usefull in 3D mode)
///@param {TilemapId} tilemap
///@param {Integer} xBegin
///@param {Integer} yBegin
///@param {Integer} width in pixels
///@param {Integer} height in pixels
///@param {Integer} cellSize
function drawTilemapPartial(argument0, argument1, argument2, argument3, argument4, argument5) {

		var tilemap = argument0;
		var xBegin = argument1;
		var yBegin = argument2;
		var width = argument3;
		var height = argument4;
		var cellSize = argument5;
	
		var tileset = tilemap_get_tileset(tilemap);
		var tileXBegin = xBegin div cellSize;
		var tileYBegin = yBegin div cellSize;
		var tileXEnd = (xBegin + width) div cellSize;
		var tileYEnd = (yBegin + height) div cellSize;
	
		for (var yCell = tileYBegin; yCell < tileYEnd; yCell++) {
			for (var xCell = tileXBegin; xCell < tileXEnd; xCell++) {
				var data = tilemap_get(tilemap, xCell, yCell);
				if (data > 0) {
					draw_tile(tileset, data, 0, xCell * cellSize, yCell * cellSize)	
				}
			}
		}


}

///@function drawTilemapPartial(tilemap, xBegin, xBegin, width, height, cellSize);
///@description Like draw_tilemap it will draw tilemap but only tiles from specified range (usefull in 3D mode)
///@param {TilemapId} tilemap
///@param {Integer} xBegin
///@param {Integer} yBegin
///@param {Integer} width in pixels
///@param {Integer} height in pixels
///@param {Integer} cellSize
function drawTilemapPartialToSurface(argument0, argument1, argument2, argument3, argument4, argument5) {

		var tilemap = argument0;
		var xBegin = argument1;
		var yBegin = argument2;
		var width = argument3;
		var height = argument4;
		var cellSize = argument5;
	
		var tileset = tilemap_get_tileset(tilemap);
		var tileXBegin = xBegin div cellSize;
		var tileYBegin = yBegin div cellSize;
		var tileXEnd = (xBegin + width) div cellSize;
		var tileYEnd = (yBegin + height) div cellSize;
	
		var tileY = 0;
		for (var yCell = tileYBegin; yCell < tileYEnd; yCell++) {
			var tileX = 0;
			for (var xCell = tileXBegin; xCell < tileXEnd; xCell++) {
				var data = tilemap_get(tilemap, xCell, yCell);
				if (data > 0) {
					draw_tile(tileset, data, 0, tileX * cellSize, tileY * cellSize)	
				}
				tileX++;
			}
			tileY++;
		}


}

///@function renderSurface(surface, xPosition, yPosition, [xScale], [yScale], [angle], [alpha], [blendColors], [origin], [textureBegin], [textureEnd])
///@description Wrapper for draw_surface_general with surface origin.
///@param {Surface} surface
///@param {Integer} [xPosition=0]
///@param {Integer} [yPosition=0]
///@param {Number} [xScale]
///@param {Number} [yScale]
///@param {Number} [angle] in degree
///@param {Number} [alpha] normalized
///@param {GMColor|GMColor[]} [blendColors] can be one color or array of four. Corner order: [ top-left, top-right, bottom-right, bottom-left ]
///@param {Position} [origin] normalized
///@param {Position} [textureBegin] normalized
///@param {Position} [textureEnd] normalized
function renderSurface() {

		///checkArgumentCount(1, argument_count, drawSurface);
	
		var surface = argument[0];
		var xPosition = argument_count > 1? argument[1] : 0.0;
		var yPosition = argument_count > 2 ? argument[2] : 0.0;
		var xScale = argument_count > 3 ? argument[3] : 1.0;
		var yScale = argument_count > 4 ? argument[4] : 1.0;
		var angle = argument_count > 5 ? argument[5] : 0.0;
		var alpha = argument_count > 6 ? argument[6] : 1.0;
		var blendColors = argument_count > 7 ? argument[7]: [ c_white, c_white, c_white, c_white ];
		var origin = argument_count > 8 ? argument[8] : createPosition(0.0, 0.0);
		var textureBegin = argument_count > 9 ? argument[9] : createPosition(0.0, 0.0);
		var textureEnd = argument_count > 10 ? argument[10] : createPosition(1.0, 1.0);
	
	#region Sanitize blendColors
		if (!(isArray(blendColors)) ||
			!(getArrayLength(blendColors) > 3)) {
			var blendColor = isArray(blendColors) && getArrayLength(blendColors) > 0 ? blendColors[0] : c_white;
			blendColors = [
				blendColor,
				blendColor,
				blendColor,
				blendColor
			];
		}
	#endregion
	
	#region Render normalized positions
		var width = surface_get_width(surface);
		var height = surface_get_height(surface);
		var surfaceXOrigin = getPositionHorizontal(origin) * width;
		var surfaceYOrigin = getPositionVertical(origin) * height;
		var surfaceXOriginBegin = getPositionHorizontal(textureBegin) * width;
		var surfaceYOriginBegin = getPositionVertical(textureBegin) * height;
		var surfaceXOriginEnd = getPositionHorizontal(textureEnd) * width;
		var surfaceYOriginEnd = getPositionVertical(textureEnd) * height;
		var xPoint = xPosition + ((width * origin[0]) - (dcos(angle) * (surfaceXOrigin * xScale)) - (dsin(angle) * (surfaceYOrigin * yScale)));
		var yPoint = yPosition + ((height * origin[1]) - (dcos(angle) * (surfaceYOrigin * yScale)) + (dsin(angle) * (surfaceXOrigin * xScale)));
	#endregion
	

		draw_surface_general(
			surface,
			surfaceXOriginBegin,
			surfaceYOriginBegin,
			surfaceXOriginEnd,
			surfaceYOriginEnd,
			xPoint,
			yPoint,
			xScale,
			yScale,
			angle,
			blendColors[0],
			blendColors[1],
			blendColors[2],
			blendColors[3],
			alpha);
	



}

///@function renderSurfaceStretched(surface, xPosition, yPosition, width, height)
///@description Wrapper for draw_surface_stretched.
///@param {Surface} surface
///@param {Number} xPosition
///@param {Number} yPosition
///@param {Integer} width
///@param {Integer} height
function renderSurfaceStretched(argument0, argument1, argument2, argument3, argument4) {

		var surface = argument0;
		var xPosition = argument1;
		var yPosition = argument2;
		var width = argument3;
		var height = argument4;
	
		draw_surface_stretched(surface, xPosition, yPosition, width, height);
	



}

///@function renderText(text, coordX, coordY, textColor, alpha)
///@description Render text.
///@param {String} text
///@param {Integer} coordX
///@param {Integer} coordY
///@param {GMColor} [textColor=c_white]
///@param {Number} [alpha=1.0]
function renderText() {

		///checkArgumentCount(3, argument_count, renderText);

		var text = argument[0];
		var coordX = argument[1];
		var coordY = argument[2];
		var textColor = argument_count > 3 ? argument[3] : c_white
		var alpha = argument_count > 4 ? argument[4] : 1.0;
	
		text = string(text);
	
		draw_text_color(coordX, coordY, text, textColor, textColor, textColor, textColor, alpha);
	



}

///@function renderTextOutline(text, coordX, coordY, textColor, outlineColor, alpha)
///@description Render text.
///@param {String} text
///@param {Integer} coordX
///@param {Integer} coordY
///@param {GMColor} [textColor=c_white]
///@param {GMColor} [outlineColor=c_black]
///@param {Number} [alpha=1.0]
function renderTextOutline() {

		///checkArgumentCount(3, argument_count, renderTextOutline);

		var text = argument[0];
		var coordX = argument[1];
		var coordY = argument[2];
		var textColor = argument_count > 3 ? argument[3] : c_white
		var outlineColor = argument_count > 4 ? argument[4] : c_black
		var alpha = argument_count > 5 ? argument[5] : 1.0;
	
		text = string(text);
	
		draw_text_color(coordX + 1, coordY + 1, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(coordX - 1, coordY - 1, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(coordX,     coordY + 1, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(coordX + 1, coordY    , text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(coordX,     coordY - 1, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(coordX - 1, coordY    , text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(coordX - 1, coordY + 1, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha);  
		draw_text_color(coordX + 1, coordY - 1, text, outlineColor, outlineColor, outlineColor, outlineColor, alpha); 
	
		draw_text_color(coordX, coordY, text, textColor, textColor, textColor, textColor, alpha);
	



}

///@function renderTexture(texture, frame, xPosition, yPosition, xScale, yScale, alpha, angle, color)
///@description Wrapper for draw_sprite_ext.
///@param {AssetTexture} texture
///@param {Number} xPosition
///@param {Number} yPosition
///@param {Number} [frame=0]
///@param {Number} [xScale=1.0]
///@param {Number} [yScale=1.0]
///@param {Number} [alpha=1.0]
///@param {Number} [angle=0.0]
///@param {Number} [color=c_white]
function renderTexture() {

		///checkArgumentCount(3, argument_count, renderTexture);

		var texture = argument[0];
		var xPosition = argument[1];
		var yPosition = argument[2];
		var frame = argument_count > 3 ? argument[3] : 0.0;
		var xScale = argument_count > 4 ? argument[4] : 1.0;
		var yScale = argument_count > 5 ? argument[5] : 1.0;
		var alpha = argument_count > 6 ? argument[6] : 1.0;
		var angle = argument_count > 7 ? argument[7] : 0.0;
		var color = argument_count > 8 ? argument[8] : c_white;
	
		draw_sprite_ext(texture, frame, xPosition, yPosition, xScale, yScale, angle, color, alpha);
	



}

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

///@function cleanSurface(surface, color, alpha)
///@description Fill surface with color.
///@param {Surface} surface
///@param {Color} color
///@param {Number} alpha
function cleanSurface(argument0, argument1, argument2) {

		var surface = argument0;
		var color = argument1;
		var alpha = argument2;
	
		surface_set_target(surface);
		draw_clear_alpha(colorToGMColor(color), alpha);
		surface_reset_target();


}

///@function createSurface(width, heigh, [disableDepth])
///@description Wrapper for surface_create.
///@param {Integer} width
///@param {Integer} height
///@param {Boolean} [disableDepth=false]
function createSurface() {

		if (argument_count < 2) {
			logger("createSurface must have at least 2 arguments provided", LogType.ERROR);
			return createSurface(1, 1, true);
		}
	
		var width = round(argument[0]);
		var height = round(argument[1]);
		var disableDepth = argument_count > 2 ? argument[2] : false;
	
		var surface = null
		if (disableDepth) {
			surface_depth_disable(true);
			surface = surface_create(width, height);
			surface_depth_disable(false);	
		} else {
			surface = surface_create(width, height);
		}
	
		return surface;
	



}

///@function destroySurface(surface)
///@description Wrapper for surface_free.
///@param {Surface} surface
function destroySurface(argument0) {

		var surface = argument0;
	
		if (surface_exists(surface)) {
		
			surface_free(surface);	
		}
	



}

///@function getSurface(surface, width, height, [disableDepth])
///@description Wrapper for !surface_exists ? surface_create.
///@param {Surface} surface
///@param {Integer} width
///@param {Integer} height
///@param {Boolean} [disableDepth=true]
function getSurface() {

		///checkArgumentCount(3, argument_count, getSurface);
	
		var surface = argument[0];
		var width = round(argument[1]);
		var height = round(argument[2]);
		var disableDepth = argument_count > 3 ? argument[3] : true;
	
		if (!isOptionalPresent(surface) || !surface_exists(surface)) {
			return createSurface(width, height, disableDepth);
		} else {
			///@todo Wrapper
			if ((surface_get_width(surface) != width) || 
				(surface_get_height(surface) != height)) {
				
				surface_resize(surface, width, height);
			}
			return surface;
		}
	



}

///@function guardSurface(context, surface, surfaceName, width, height, [disableDepth])
///@description Wrapper for !surface_exists ? surface_create.
///@param {Instance} context
///@param {Surface} surface
///@param {String} surfaceName
///@param {Integer} width
///@param {Integer} height
///@param {Boolean} [disableDepth]
function guardSurface() {

		if (argument_count < 5) {
			logger("checkSurface must have at least 5 arguments provided", LogType.ERROR);	
			return;
		}
	
		var context = argument[0];
		var surface = argument[1];
		var surfaceName = argument[2];
		var width = round(argument[3]);
		var height = round(argument[4]);
		var disableDepth = argument_count == 6 ? argument[5] : false;
	
		if (!isOptionalPresent(surface) || !surface_exists(surface)) {
			setInstanceVariable(context, surfaceName, disableDepth ? 
				createSurface(width, height, true) : createSurface(width, height));
		} else {
			if ((surface_get_width(surface) != width) || 
				(surface_get_height(surface) != height)) {
				surface_resize(surface, width, height);
			}
		}
	



}

///@function isSurfaceValid(surface)
///@description Wrapper for surface_exists.
///@param {Surface} surface
function isSurfaceValid(argument0) {

		return surface_exists(argument0);
	



}

///@function getSpriteAssetHeight(spriteIndex)
///@description Wrapper for sprite_get_height.
///@param {AssetTexture} spriteIndex
///@return {Integer} spriteHeight
function getSpriteAssetHeight(argument0) {

		return sprite_get_height(argument0);
	



}

///@function getSpriteAssetWidth(spriteIndex)
///@description Wrapper for sprite_get_width.
///@param {AssetTexture} spriteIndex
///@return {Integer} spriteWidth
function getSpriteAssetWidth(argument0) {

		return sprite_get_width(argument0);
	



}

///@function getSpriteAssetYOffset(spriteAsset)
///@description Wrapper for sprite_get_xoffset.
///@param {AssetTexture} spriteAsset
///@return {Number} xOffset
function getSpriteAssetXOffset(argument0) {

		var spriteAsset = argument0;
	
		return sprite_get_xoffset(spriteAsset);
	



}

///@function getSpriteAssetYOffset(spriteAsset)
///@description Wrapper for sprite_get_yoffset.
///@param {AssetTexture} spriteAsset
///@return {Number} yOffset
function getSpriteAssetYOffset(argument0) {

		var spriteAsset = argument0;
	
		return sprite_get_yoffset(spriteAsset);
	



}

///@function gpuResetShader()
///@description Wrapper for shader_reset.
function gpuResetShader() {

		shader_reset();
	



}

///@function gpuResetSurfaceTarget(surface)
///@description Wrapper for surface_reset_target.
function gpuResetSurfaceTarget() {

		surface_reset_target();
	



}

///@function gpuSetColorInScope(color)
///@description execute draw_ functions in current scope.
///@param {Color} color
function gpuSetColorInScope(argument0) {

		var color = argument0;

		draw_set_color(colorToGMColor(color));
		draw_set_alpha(getColorAlpha(color));
	



}

///@function gpuSetShader(shader)
///@description Wrapper for shader_set.
///@param {Shader} shader
function gpuSetShader(argument0) {

		shader_set(argument0);
	



}

///@function gpuSetShaderUniformFloat(uniform, float...)
///@description Wrapper for shader_set_uniform_f.
///@param {Uniform} uniform
///@param {Number} float...
function gpuSetShaderUniformFloat() {

		if (argument_count < 2) {
			logger("gpuSetShaderUniformFloat must have at least 2 arguments provided", LogType.ERROR);	
		}
	
		var uniform = argument[0];
	
		// TODO Refactor after GML update (spread operator are broken in this version...)
		// Only 4 because max is vec4
		switch (argument_count) {
			case 2:
				shader_set_uniform_f(uniform, argument[1]);
				break;
			case 3:
				shader_set_uniform_f(uniform, argument[1], argument[2]);
				break;
			case 4:
				shader_set_uniform_f(uniform, argument[1], argument[2], argument[3]);
				break;
			case 5:
				shader_set_uniform_f(uniform, argument[1], argument[2], argument[3], argument[4]);
				break;
			case 6:
				shader_set_uniform_f(uniform, argument[1], argument[2], argument[3], argument[4], argument[5]);
				break;
		}


}

///@function gpuSetSurfaceTarget(surface)
///@description Wrapper for surface_set_target.
///@param {Surface} surface
function gpuSetSurfaceTarget(argument0) {

		surface_set_target(argument0);
	



}

///@function areColorsEqual(sourceColor, targetColor)
///@description Compare colors if they are equal
///@param {Color} sourceColor
///@param {Color} targetColor
///@return {Boolean} areEqual
function areColorsEqual(argument0, argument1) {

		var sourceColor = argument0;
		var targetColor = argument1;
	
		var redSource = (round(255 * getColorRed(sourceColor)));
		var greenSource = (round(255 * getColorGreen(sourceColor)));
		var blueSource = (round(255 * getColorBlue(sourceColor)));
		var alphaSource = (round(255 * getColorAlpha(sourceColor)));
	
		var redTarget = (round(255 * getColorRed(targetColor)));
		var greenTarget = (round(255 * getColorGreen(targetColor)));
		var blueTarget = (round(255 * getColorBlue(targetColor)));
		var alphaTarget = (round(255 * getColorAlpha(targetColor)));
	
		var areEqual = (
			(redSource == redTarget) &&
			(greenSource == greenTarget) &&
			(blueSource == blueTarget) &&
			(alphaSource == alphaTarget)
		);
	
		return areEqual;
	



}

///@function colorHashToColor(colorHash)
///@description Parse colorHash to Color.
///@param {String} colorHash
///@return {Color} color
function colorHashToColor(argument0) {

	#macro __colorHashToColor_asciiDigitOffset ord("0")
	#macro __colorHashToColor_asciiCharOffset ord("A")

		var text = argument0;
	
		var textLength = string_length(text);
		var hasAlpha = textLength == 9;
		var asciiDigitOffset = __colorHashToColor_asciiDigitOffset;
		var asciiCharOffset = __colorHashToColor_asciiCharOffset;
	
		if ((string_count("#", text) == 0) ||
			((textLength  != 7) && (textLength != 9))) {
			
			return createColor(1.0, 1.0, 1.0, 1.0);	
		}

		var color = createArray(hasAlpha ? 8 : 6, asciiDigitOffset);
		for (var index = 0; index < getArrayLength(color); index++) {
		
			color[index] = ord(string_upper(string_char_at(text, index + 2)));
			color[index] = color[index] >= asciiCharOffset ? color[index] - asciiCharOffset + 10 : color[index] - asciiDigitOffset;
		}
	
		var red = ((color[0] * 16) + color[1]) / 255;
		var green = ((color[2] * 16) + color[3]) / 255;
		var blue = ((color[4] * 16) + color[5]) / 255;
		var alpha = hasAlpha ? (((color[6] * 16) + color[7]) / 255) : 1.0;
		var result = createColor(red, green, blue, alpha);
	
		///@gc
		color = null;

		return result;
	



}

///@function colorHashToGMColor(text)
///@description Convert string to hex value. Used for colors
///@param {String} text
///@return {GMColor} gmColor
function colorHashToGMColor(argument0) {

		var text = argument0;
		var offset = string_count("#", text) > 0 ? 1 : 0;
		var asciiDigitOffset = ord("0");
		var asciiCharOffset = ord("A");

		if ((is_real(text)) || 
			((offset == 0) && (string_length(text) < 5)) ||
			((offset == 1) && (string_length(text) < 6))) {
		   return c_white;
		}

		var color = createArray(6, asciiDigitOffset);
		for (var index = 0; index < getArrayLength(color); index++) {
			color[index] = ord(string_upper(string_char_at(text, index + offset + 1)));
			color[index] = color[index] >= asciiCharOffset ? color[index] - asciiCharOffset + 10 : color[index] - asciiDigitOffset;	
		}
	
		var red = (color[0] * 16) + color[1];
		var green = (color[2] * 16) + color[3];
		var blue = (color[4] * 16) + color[5];
		var result = make_color_rgb(red, green, blue);
		color = "";

		return result;



}

///@function colorToColorHash(color)
///@description Parse Color to colorHash String.
///@param {Color} color
///@return {String} colorHash
function colorToColorHash() {

		var color = argument[0];

		var hexString = "\#"
		var hexSymbols ="0123456789ABCDEF";
		var colorRed = round(getColorRed(color) * 255);
		var colorGreen = round(getColorGreen(color) * 255);
		var colorBlue = round(getColorBlue(color) * 255);
		var colorAlpha = round(getColorAlpha(color) * 255);
	    var colorTemp = colorRed;
	
	    hexString += 
			string_char_at(hexSymbols, ((colorTemp - colorTemp mod 16) / 16) + 1) + 
			string_char_at(hexSymbols, (colorTemp mod 16) + 1);
	    colorTemp = colorGreen;
	
	    hexString += 
			string_char_at(hexSymbols, ((colorTemp - colorTemp mod 16) / 16) + 1) + 
			string_char_at(hexSymbols, (colorTemp mod 16) + 1);
	    colorTemp = colorBlue;
	
	    hexString += 
			string_char_at(hexSymbols, ((colorTemp - colorTemp mod 16) / 16) + 1) + 
			string_char_at(hexSymbols, (colorTemp mod 16) + 1);
		colorTemp = colorAlpha;
	
		hexString += 
			string_char_at(hexSymbols, ((colorTemp - colorTemp mod 16) / 16) + 1) + 
			string_char_at(hexSymbols, (colorTemp mod 16) + 1);
		colorTemp = "";

		return hexString;
	


}

///@function colorToGMColor(color)
///@description Returns GMColor (integer).
///@param {Color} color
///@return {GMColor} gmColor
function colorToGMColor(argument0) {

		var color = argument0;
		var gmColor = make_color_rgb(
			round(getColorRed(color) * 255),
			round(getColorGreen(color) * 255),
			round(getColorBlue(color) * 255));
		
		return gmColor;


}

///@function getSpritePixelColor(sprite, xPosition, yPosition)
///@description Gettter.
///@param {AssetTexture} sprite
///@param {Integer} xPosition
///@param {Integer} yPosition
///@return {Color} color
function getSpritePixelColor(argument0, argument1, argument2) {

		var sprite = argument0;
		var xPosition = argument1;
		var yPosition = argument2;
	
		var surface = createSurface(1, 1, true);
	
		gpuSetSurfaceTarget(surface);
			draw_sprite_part(sprite, 0, xPosition, yPosition, 1, 1, 0, 0);
			var gmColor = surface_getpixel(surface, 0, 0);
		gpuResetSurfaceTarget();
	
		surface_free(surface);
	
		var color = gmColorToColor(gmColor);
	
		return color;
	



}

///@function gmColorToColor(gmColor, [alpha])
///@description Parse GMColorto Color.
///@param {GMColor} gmColor
///@return {Color} color
function gmColorToColor() {
	
		var color = c_white;
		if (argument_count < 1) {
			logger("gmColorToColor must have at least 1 argument provided", LogType.ERROR);	
		} else {
			color = argument[0];	
		}
	
		var red = colour_get_red(color) / 255;
		var green = colour_get_green(color) / 255;
		var blue = colour_get_blue(color) / 255;
		var alpha = argument_count == 2 ? clamp(argument[1], 0.0, 1.0) : 1.0;
	
		return createColor(red, green, blue, alpha);


}

///@description gmColorToColorHash(color, [alpha]);
///@param {Integer} color
///@param {Number} [alpha]
///@return {String} text
function gmColorToColorHash() {

		var color = c_white;
		if (argument_count < 0) {
			logger("gmColorToColorHash must have at least 1 argument provided", LogType.ERROR);
		} else {
			var color = argument[0];
		}

		var hexString = "\#"
		var hexSymbols ="0123456789ABCDEF";
		var colorRed = colour_get_red(color);
		var colorGreen = colour_get_green(color);
		var colorBlue = colour_get_blue(color);
		var colorAlpha = argument_count == 2 ? round(clamp(argument[1], 0.0, 1.0) * 255) : null;
	    var colorTemp = colorRed;
	
	    hexString += 
			string_char_at(hexSymbols, ((colorTemp - colorTemp mod 16) / 16) + 1) + 
			string_char_at(hexSymbols, (colorTemp mod 16) + 1);
	    colorTemp = colorGreen;
	
	    hexString += 
			string_char_at(hexSymbols, ((colorTemp - colorTemp mod 16) / 16) + 1) + 
			string_char_at(hexSymbols, (colorTemp mod 16) + 1);
	    colorTemp = colorBlue;
	
	    hexString += 
			string_char_at(hexSymbols, ((colorTemp - colorTemp mod 16) / 16) + 1) + 
			string_char_at(hexSymbols, (colorTemp mod 16) + 1);
	
		if (colorAlpha != null) {
			colorTemp = colorAlpha;
			hexString += 
				string_char_at(hexSymbols, ((colorTemp - colorTemp mod 16) / 16) + 1) + 
				string_char_at(hexSymbols, (colorTemp mod 16) + 1);
		}
		colorTemp = "";

		return hexString;



}

///@function invertColor(color)
///@description Return new, inverted color
///@param {Color} color
function invertColor(argument0) {

		var color = argument0;
	
		return createColor(
			1.0 - getColorRed(color),
			1.0 - getColorGreen(color),
			1.0 - getColorBlue(color),
			1.0);
	



}

///@function transformColor(sourceColor, targetColor, changeFactor);
///@description Interpolate color from source to destination in time.
///@param {Color} sourceColor
///@param {Color} targetColor
///@param {Number} changeFactor normalized
///@return {Boolean} isTransformationCompleted
function transformColor(argument0, argument1, argument2) {

		var sourceColor = argument0;
		var targetColor = argument1
		var changeFactor = argument2;
	
		var redSource = getColorRed(sourceColor);
		var greenSource = getColorGreen(sourceColor);
		var blueSource = getColorBlue(sourceColor);
		var alphaSource = getColorAlpha(sourceColor);
	
		var redTarget = getColorRed(targetColor);
		var greenTarget = getColorGreen(targetColor);
		var blueTarget = getColorBlue(targetColor);
		var alphaTarget = getColorAlpha(targetColor);
	
		var redFinal = redSource + changeFactor * sign(redTarget - redSource) * getDeltaTimeValue();
		redFinal = sign(redTarget - redFinal) == sign(redTarget - redSource) ? redFinal : redTarget;
	
		var greenFinal = greenSource + changeFactor * sign(greenTarget - greenSource) * getDeltaTimeValue();
		greenFinal = sign(greenTarget - greenFinal) == sign(greenTarget - greenSource) ? greenFinal : greenTarget;
	
		var blueFinal = blueSource + changeFactor * sign(blueTarget - blueSource) * getDeltaTimeValue();
		blueFinal = sign(blueTarget - blueFinal) == sign(blueTarget - blueSource) ? blueFinal : blueTarget;
	
		var alphaFinal = alphaSource + changeFactor * sign(alphaTarget - alphaSource) * getDeltaTimeValue();
		alphaFinal = sign(alphaTarget - alphaFinal) == sign(alphaTarget - alphaSource) ? alphaFinal : alphaTarget;
	
		setColorRed(sourceColor, redFinal);
		setColorGreen(sourceColor, greenFinal);
		setColorBlue(sourceColor, blueFinal);
		setColorAlpha(sourceColor, alphaFinal);
	
		var areEqual = areColorsEqual(sourceColor, targetColor);
		//printArray(targetColor);
		if (areEqual) {
			setColorRed(sourceColor, round(redFinal * 255) / 255);
			setColorGreen(sourceColor, round(greenFinal * 255) / 255);
			setColorBlue(sourceColor, round(blueFinal * 255) / 255);
			setColorAlpha(sourceColor, round(alphaFinal * 255) / 255);	
		}
	
		return areEqual;
	



}

///@function transformColorToNewColor(sourceColor, targetColor, changeFactor);
///@description Interpolate color from source to destination in time.
///@param {Color} sourceColor
///@param {Color} targetColor
///@param {Number} changeFactor normalized
///@return {Color} transformedColor
function transformColorToNewColor(argument0, argument1, argument2) {

		var sourceColor = argument0;
		var targetColor = argument1
		var changeFactor = argument2;
	
		var redSource = getColorRed(sourceColor);
		var greenSource = getColorGreen(sourceColor);
		var blueSource = getColorBlue(sourceColor);
		var alphaSource = getColorAlpha(sourceColor);
	
		var redTarget = getColorRed(targetColor);
		var greenTarget = getColorGreen(targetColor);
		var blueTarget = getColorBlue(targetColor);
		var alphaTarget = getColorAlpha(targetColor);
	
		var redFinal = redSource + changeFactor * sign(redTarget - redSource) * getDeltaTimeValue();
		redFinal = sign(redTarget - redFinal) == sign(redTarget - redSource) ? redFinal : redTarget;
	
		var greenFinal = greenSource + changeFactor * sign(greenTarget - greenSource) * getDeltaTimeValue();
		greenFinal = sign(greenTarget - greenFinal) == sign(greenTarget - greenSource) ? greenFinal : greenTarget;
	
		var blueFinal = blueSource + changeFactor * sign(blueTarget - blueSource) * getDeltaTimeValue();
		blueFinal = sign(blueTarget - blueFinal) == sign(blueTarget - blueSource) ? blueFinal : blueTarget;
	
		var alphaFinal = alphaSource + changeFactor * sign(alphaTarget - alphaSource) * getDeltaTimeValue();
		alphaFinal = sign(alphaTarget - alphaFinal) == sign(alphaTarget - alphaSource) ? alphaFinal : alphaTarget;
	
		return createColor(redFinal, greenFinal, blueFinal, alphaFinal);

	


}


