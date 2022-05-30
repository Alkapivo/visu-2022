///@function coordsInRectangle(rectangle, coordX, coordY)
///@description Check if coords are in rectangle.
///@param {Rectangle} rectangle
///@param {Number} coordX
///@param {Number} coordY
///@return {Boolean} isValid
function coordsInRectangle(argument0, argument1, argument2) {

		var rectangle = argument0;
		var coordX = argument1;
		var coordY = argument2;
	
		var isValid = false;

		if (isEntity(rectangle, Rectangle)) {
			isValid = point_in_rectangle(
				coordX,
				coordY,
				getRectangleXBegin(rectangle),
				getRectangleYBegin(rectangle),
				getRectangleXEnd(rectangle),
				getRectangleYEnd(rectangle)
			);	
		}
	
		return isValid;
	



}
