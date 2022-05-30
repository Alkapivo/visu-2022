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
