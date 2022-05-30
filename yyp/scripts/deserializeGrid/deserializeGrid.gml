///@function deserializeGrid(serializedGrid)
///@description Return deserializedGrid from string created by serializeGrid.
///@param {String} serializedGrid
///@return {Grid<Object>} deserializedGrid
function deserializeGrid(argument0) {

		var serializedGrid = argument0;
		var grid = createGrid(0, 0);
		ds_grid_read(grid, serializedGrid);
		return grid;


}
