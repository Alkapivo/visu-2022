///@function getDistanceBetweenInstances(source, target)
///@description Getter.
///@param {Instance} source
///@param {Instance} target
///@return {Number} distance in pixels. Return NaN if one of the instances doesn't exists.
function getDistanceBetweenInstances(argument0, argument1) {

		var source = argument0;
		var target = argument1;
	
		var sourceX = getInstanceVariable(source, "x");
		var sourceY = getInstanceVariable(source, "y");
		var targetX = getInstanceVariable(target, "x");
		var targetY = getInstanceVariable(target, "y");
	
		return ((!isNumber(sourceX)) || (!isNumber(sourceY)) ||
			(!isNumber(targetX)) || (!isNumber(targetY))) ? 
			NaN :
			point_distance(sourceX, sourceY, targetX, targetY);
	



}
