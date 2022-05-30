///@function createColor(red, green, blue, alpha)
///@description Constructor for Color entity.
///@param {Number} red
///@param {Number} green
///@param {Number} blue
///@param {Number} alpha
///@return {Color} color 
///@throws {Exception}
///@generated {2020-09-28T21:11:14.663Z}
function createColor(argument0, argument1, argument2, argument3) {

		var red = argument0;
		var green = argument1;
		var blue = argument2;
		var alpha = argument3;
	
		var color = createEntity(Color);

		setColorRed(color, assertNoOptional(red));
		setColorGreen(color, assertNoOptional(green));
		setColorBlue(color, assertNoOptional(blue));
		setColorAlpha(color, assertNoOptional(alpha));

		return color;
	



}
