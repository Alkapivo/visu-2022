///@function spawnStar(positionBegin, positionEnd)
///@description Star factory.
///@param {Position} positionBegin
///@param {Position} positionEnd
///@return {Star} star
function spawnStar(argument0, argument1) {

		var positionBegin = argument0;
		var positionEnd = argument1;
	
		var precision = 100000;
		var position = createPosition(
			positionBegin[0] + random(precision * (positionEnd[0] - positionBegin[0])) / precision,
			positionBegin[1] + random(precision * (positionEnd[1] - positionBegin[1])) / precision);
		var target = createPosition(
			position[0] < 0.5 ? 
				((random(precision) / precision) * 0.5) + 0.0 :
				((random(precision) / precision) * 0.5) + 0.5, 
			1.0);
		var sprite = createSprite(asset_sprite_star, 0, choose(1, 1.5, 1.6, 2, 2.5) * choose(1, 1.2, 1.6, 2, 2.2), choose(1, 1.5, 1.6, 2, 2.5) * choose(1, 1.2, 1.6, 2, 2.2), 1.0, 0.0, c_white);
		var speedValue = 0.0001 + 0.0002 * (random(precision) / precision);
		var scale = 0.1 + 0.9 * (random(precision) / precision);
		var alpha = 0.8 + (random(20) / 100);
		
		var star = createStar(position, target, sprite, speedValue, scale, alpha);

		addToList(getGameRenderer().stars, star);
	



}
