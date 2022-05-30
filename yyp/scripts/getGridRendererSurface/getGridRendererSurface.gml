///@function getGridRendererSurface()
///@description Getter
///@return {Optional<Surface>} surface return null if surface doesn't exists.
function getGridRendererSurface() {

		var gridRenderer = getGridRenderer();
		var surface = gridRenderer.gridSurface;
	
		return isSurfaceValid(surface) ? surface : null;
	



}
