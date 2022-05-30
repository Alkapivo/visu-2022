///@function createGridElementInfo(isVisible, type, color, text)
///@description Constructor for GridElementInfo entity.
///@param {Boolean} isVisible
///@param {GridElementInfoType} type
///@param {Color} color
///@param {String} text
///@return {GridElementInfo} gridElementInfo 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.558Z}

function createGridElementInfo(isVisible, type, color, text) {

	var gridElementInfo = createEntity(GridElementInfo);

	setGridElementInfoIsVisible(gridElementInfo, assertNoOptional(isVisible));
	setGridElementInfoType(gridElementInfo, assertNoOptional(type));
	setGridElementInfoColor(gridElementInfo, assertNoOptional(color));
	setGridElementInfoText(gridElementInfo, assertNoOptional(text));

	return gridElementInfo;
	
}
