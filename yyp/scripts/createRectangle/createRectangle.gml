///@function createRectangle(xBegin, yBegin, xEnd, yEnd)
///@description Constructor for Rectangle entity.
///@param {Number} xBegin
///@param {Number} yBegin
///@param {Number} xEnd
///@param {Number} yEnd
///@return {Rectangle} rectangle 
///@throws {Exception}
///@generated {2020-08-10T23:26:00.246Z}
function createRectangle(argument0, argument1, argument2, argument3) {

		var xBegin = argument0;
		var yBegin = argument1;
		var xEnd = argument2;
		var yEnd = argument3;
	
		var rectangle = createEntity(Rectangle);

		setRectangleXBegin(rectangle, assertNoOptional(xBegin));
		setRectangleYBegin(rectangle, assertNoOptional(yBegin));
		setRectangleXEnd(rectangle, assertNoOptional(xEnd));
		setRectangleYEnd(rectangle, assertNoOptional(yEnd));

		return rectangle;
	



}
