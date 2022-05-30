///@function createResolutions(data)
///@description Constructor for Resolutions entity.
///@param {Resolution[]} data
///@return {Resolutions} resolutions 
///@throws {Exception}
///@generated {2021-05-01T23:43:34.810Z}

function createResolutions(data) {

	var resolutions = createEntity(Resolutions);

	setResolutionsData(resolutions, assertNoOptional(data));

	return resolutions;
	
}
