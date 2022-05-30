///@function getDistanceBetweenPoints(sourcePoint, targetPoint)
///@description Wrapper for point_distance
///@param {Tuple} sourcePoint
///@param {Tuple} targetPoint
///@return {Number} distance
function getDistanceBetweenPoints(argument0, argument1) {

	var sourcePoint = argument0;
	var targetPoint = argument1;

	return point_distance(
		sourcePoint[0], sourcePoint[1],
		targetPoint[0], targetPoint[1]);
}
