///@function destroySurfaceView(surfaceView)
///@description Destroy SurfaceView entity.
///@param {SurfaceView} surfaceView
///@throws {Exception}
///@generated {2021-05-01T23:43:42.657Z}

function destroySurfaceView(surfaceView) {


	
	var width = getSurfaceViewWidth(surfaceView);
	var height = getSurfaceViewHeight(surfaceView);
	var disableDepth = getSurfaceViewDisableDepth(surfaceView);
	var viewElements = getSurfaceViewViewElements(surfaceView);
	
	if (isOptionalPresent(viewElements)) {
		for (var index = 0; index < getArrayLength(viewElements); index++) {
			var entity = viewElements[@ index];
			destroyViewElement(entity);
		}
	}
	setSurfaceViewViewElements(surfaceView, null);
	

	
}
