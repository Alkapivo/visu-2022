///@function createResolution(name, realWidth, realHeight, guiWidth, guiHeight, viewWidth, viewHeight)
///@description Constructor for Resolution entity.
///@param {String} name
///@param {Integer} realWidth
///@param {Integer} realHeight
///@param {Integer} guiWidth
///@param {Integer} guiHeight
///@param {Integer} viewWidth
///@param {Integer} viewHeight
///@return {Resolution} resolution 
///@throws {Exception}
///@generated {2021-05-01T23:49:38.162Z}

function createResolution(name, realWidth, realHeight, guiWidth, guiHeight, viewWidth, viewHeight) {

	var resolution = createEntity(Resolution);

	setResolutionName(resolution, assertNoOptional(name));
	setResolutionRealWidth(resolution, assertNoOptional(realWidth));
	setResolutionRealHeight(resolution, assertNoOptional(realHeight));
	setResolutionGuiWidth(resolution, assertNoOptional(guiWidth));
	setResolutionGuiHeight(resolution, assertNoOptional(guiHeight));
	setResolutionViewWidth(resolution, assertNoOptional(viewWidth));
	setResolutionViewHeight(resolution, assertNoOptional(viewHeight));

	return resolution;
	
}
