///@function destroyGridElementInfo(gridElementInfo)
///@description Destroy GridElementInfo entity.
///@param {GridElementInfo} gridElementInfo
///@throws {Exception}
///@generated {2022-08-18T22:24:59.617Z}

function destroyGridElementInfo(gridElementInfo) {


	
	var isVisible = getGridElementInfoIsVisible(gridElementInfo);
	var type = getGridElementInfoType(gridElementInfo);
	var color = getGridElementInfoColor(gridElementInfo);
	var text = getGridElementInfoText(gridElementInfo);
	
	destroyColor(color);
	setGridElementInfoColor(gridElementInfo, null);
	

	
}
