///@function resizeGrid(grid, width, height)
///@description Wrapper for ds_grid_resize.
///@param {Grid<Object>} grid
///@param {Integer} width
///@param {Integer} height
///@return {Grid<Object>} resizedGrid - @future, see fluent interface
function resizeGrid(argument0, argument1, argument2) {

		var grid = argument0;
		var width = argument1;
		var height = argument2;

		ds_grid_resize(grid, width, height);
	
		return grid;
	



}
