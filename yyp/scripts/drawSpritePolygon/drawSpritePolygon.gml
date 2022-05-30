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
