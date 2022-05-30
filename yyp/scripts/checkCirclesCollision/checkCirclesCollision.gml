///@function checkCriclesCollision(sourceCirclePosition, sourceCircleRadius, targetCirclePosition, targetCircleRadius)
///@description Return true if source circle collide with target circle.
///@param {Number} sourceCirclePosition
///@param {Number} sourceCircleRadius
///@param {Number} targetCirclePosition
///@param {Number} targetCircleRadius
///@return {Boolean} isCollision
function checkCirclesCollision(argument0, argument1, argument2, argument3) {
	
		var sourceCirclePosition = argument0;
		var sourceCircleRadius = argument1;
		var targetCirclePosition = argument2;
		var targetCircleRadius = argument3;

		sourceCircleRadius *= clamp(fetchVerticalProjectionScale(sourceCirclePosition[1]), 0.4, 1.0);
		targetCircleRadius *= clamp(fetchVerticalProjectionScale(targetCirclePosition[1]), 0.4, 1.0);

		var distance = getDistanceBetweenPoints(sourceCirclePosition, targetCirclePosition);
		var circlesLength = sourceCircleRadius + targetCircleRadius;
		var isCollision = circlesLength >= distance;
	
		return isCollision
	



}
