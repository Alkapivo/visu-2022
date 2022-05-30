///@function createSurfaceView(width, height, disableDepth, viewElements)
///@description Constructor for SurfaceView entity.
///@param {Integer} width
///@param {Integer} height
///@param {Boolean} disableDepth
///@param {Optional<ViewElement[]>} viewElements
///@return {SurfaceView} surfaceView 
///@throws {Exception}
///@generated {2021-05-01T23:49:41.480Z}

function createSurfaceView(width, height, disableDepth, viewElements) {

	var surfaceView = createEntity(SurfaceView);

	setSurfaceViewWidth(surfaceView, assertNoOptional(width));
	setSurfaceViewHeight(surfaceView, assertNoOptional(height));
	setSurfaceViewDisableDepth(surfaceView, assertNoOptional(disableDepth));
	setSurfaceViewViewElements(surfaceView, viewElements);

	return surfaceView;
	
}
