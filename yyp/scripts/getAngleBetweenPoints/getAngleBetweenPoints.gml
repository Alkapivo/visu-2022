///@function getDistanceBetweenPoints(sourcePoint, targetPoint)
///@description Wrapper for point_direction
///@param {Tuple} sourcePoint
///@param {Tuple} targetPoint
///@return {Number} angle in deg
function getAngleBetweenPoints(argument0, argument1) {

		var sourcePoint = argument0;
		var targetPoint = argument1;

		return point_direction(
			sourcePoint[0], sourcePoint[1],
			targetPoint[0], targetPoint[1]);
	



}
