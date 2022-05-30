///@function createMargin(top, right, bottom, left)
///@description Constructor for Margin entity.
///@param {Number} top
///@param {Number} right
///@param {Number} bottom
///@param {Number} left
///@return {Margin} margin 
///@throws {Exception}
///@generated {2020-09-28T21:11:55.446Z}
function createMargin(argument0, argument1, argument2, argument3) {

		var top = argument0;
		var right = argument1;
		var bottom = argument2;
		var left = argument3;
	
		var margin = createEntity(Margin);

		setMarginTop(margin, assertNoOptional(top));
		setMarginRight(margin, assertNoOptional(right));
		setMarginBottom(margin, assertNoOptional(bottom));
		setMarginLeft(margin, assertNoOptional(left));

		return margin;
	



}
