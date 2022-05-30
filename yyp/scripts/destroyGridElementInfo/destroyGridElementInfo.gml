///@function destroyGridElementInfo(gridElementInfo)
///@description Destroy GridElementInfo entity.
///@param {GridElementInfo} gridElementInfo
///@throws {Exception}
///@generated {2021-08-25T13:56:53.558Z}

function destroyGridElementInfo(gridElementInfo) {


	
	var isVisible = getGridElementInfoIsVisible(gridElementInfo);
	var type = getGridElementInfoType(gridElementInfo);
	var color = getGridElementInfoColor(gridElementInfo);
	var text = getGridElementInfoText(gridElementInfo);
	
	destroyColor(color);
	setGridElementInfoColor(gridElementInfo, null);
	

	
}
