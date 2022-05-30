///@function fetchMovedVerticalPositionOnGrid(currentPosition, elementSpeed, gridHeight)
///@description Calculate next normalized Y position
///@param {Number} currentPosition (normalized)
///@param {Number} elementSpeed (normalized)
///@return {Number} nextPosition (normalized)
function fetchMovedVerticalPositionOnGrid(argument0, argument1) {

		var currentPosition = argument0;
		var elementSpeed = argument1;
	
		var verticalProjectionScale = fetchVerticalProjectionScale(currentPosition);
		var nextPosition = currentPosition + elementSpeed * verticalProjectionScale * getDeltaTimeValue();
	
		return nextPosition;
	



}
