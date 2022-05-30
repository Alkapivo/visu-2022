///@function destroyResolutions(resolutions)
///@description Destroy Resolutions entity.
///@param {Resolutions} resolutions
///@throws {Exception}
///@generated {2021-05-01T23:43:34.811Z}

function destroyResolutions(resolutions) {


	
	var data = getResolutionsData(resolutions);
	
	for (var index = 0; index < getArrayLength(data); index++) {
		var entity = data[@ index];
		destroyResolution(entity);
	}
	setResolutionsData(resolutions, null);
	

	
}
