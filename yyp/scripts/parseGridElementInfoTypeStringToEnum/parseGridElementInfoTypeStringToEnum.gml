///@function parseGridElementInfoTypeStringToEnum(gridElementInfoTypeString)
///@description Enum to String parser. Return null if gridElementInfoTypeString is invalid.
///@param {String} gridElementInfoTypeString
///@return {Optional<GridElementInfoType>} gridElementInfoType
function parseGridElementInfoTypeStringToEnum(argument0) {

		var gridElementInfoTypeString = argument0;
	
		var gridElementInfoType = null;
		switch (gridElementInfoTypeString) {
			case "default":
				gridElementInfoType = GridElementInfoType.DEFAULT;
				break;
		}
	
		return gridElementInfoType;
	



}
