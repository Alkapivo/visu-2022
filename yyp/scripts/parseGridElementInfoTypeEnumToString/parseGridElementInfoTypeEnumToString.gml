///@function parseGridElementInfoTypeEnumToString(gridElementInfoType)
///@description Enum to String parser. Return null if gridElementInfoType is invalid.
///@param {GridElementInfoType} gridElementInfoType
///@return {Optional<String>} gridElementInfoTypeString
function parseGridElementInfoTypeEnumToString(argument0) {

		var gridElementInfoType = argument0;
	
		var gridElementInfoTypeString = null;
		switch (gridElementInfoType) {
			case GridElementInfoType.DEFAULT:
				gridElementInfoTypeString = "default";
				break;
		}
	
		return gridElementInfoTypeString;
	



}
