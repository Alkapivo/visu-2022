///@function getLinesIntersectionPosition(pointA1, pointA2, pointB1, pointB2)
///@description Get position of intersection of two lines A and B.
///@param {Position} pointA1
///@param {Position} pointA2
///@param {Position} pointB1
///@param {Position} pointB2
///@return {Optional<Position>} intersectionPosition;
function getLinesIntersectionPosition(argument0, argument1, argument2, argument3) {

		var pointA1 = argument0;
		var pointA2 = argument1;
		var pointB1 = argument2;
		var pointB2 = argument3;
	
		if (pointA1[0] - pointA2[0] == 0) || (pointB1[0] - pointB2[0] == 0) {
			return null;
		}
	
		var slopeA = (pointA1[1] - pointA2[1]) / (pointA1[0] - pointA2[0]);
	    var slopeB = (pointB1[1] - pointB2[1]) / (pointB1[0] - pointB2[0]);

	    if (slopeA == NaN) || (slopeB == NaN) || (slopeA - slopeB == 0) {
	        return null;
	    }
    
	    var pointX = (slopeA * pointA1[0] - slopeB * pointB1[0] + pointB1[1] - pointA1[1]) / (slopeA - slopeB);
	    var pointY = (slopeA * slopeB * (pointB1[0] - pointA1[0]) + slopeB * pointA1[1] - slopeA * pointB1[1]) / (slopeB - slopeA);
	
		return [ pointX, pointY ];
	



}
