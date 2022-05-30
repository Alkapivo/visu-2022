///@function cloneGrid(grid)
///@description Return copy of passed grid
///@param {Grid<Object>} grid
///@return {Grid<Object>} clonedGrid
function cloneGrid(argument0) {

		var grid = argument0;
		var target = ds_grid_create(getGridWidth(grid), getGridHeight(grid));
		ds_grid_copy(target, grid);
		return target


}
