///@function createStar(position, target, sprite, speedValue, scale, alpha)
///@description Constructor for Star entity.
///@param {Position} position
///@param {Position} target
///@param {Sprite} sprite
///@param {Number} speedValue
///@param {Number} scale
///@param {Number} alpha
///@return {Star} star 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.810Z}

function createStar(position, target, sprite, speedValue, scale, alpha) {

	var star = createEntity(Star);

	setStarPosition(star, assertNoOptional(position));
	setStarTarget(star, assertNoOptional(target));
	setStarSprite(star, assertNoOptional(sprite));
	setStarSpeedValue(star, assertNoOptional(speedValue));
	setStarScale(star, assertNoOptional(scale));
	setStarAlpha(star, assertNoOptional(alpha));

	return star;
	
}
