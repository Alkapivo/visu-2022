///@function destroyStar(star)
///@description Destroy Star entity.
///@param {Star} star
///@throws {Exception}
///@generated {2021-08-25T13:56:53.810Z}

function destroyStar(star) {


	
	var position = getStarPosition(star);
	var target = getStarTarget(star);
	var sprite = getStarSprite(star);
	var speedValue = getStarSpeedValue(star);
	var scale = getStarScale(star);
	var alpha = getStarAlpha(star);
	
	destroyPosition(position);
	setStarPosition(star, null);
	
	destroyPosition(target);
	setStarTarget(star, null);
	
	destroySprite(sprite);
	setStarSprite(star, null);
	

	
}
