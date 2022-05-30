///@function parseShroomTypeStringToEnum(shroomTypeString)
///@description Enum to String parser. Return null if shroomTypeString is invalid.
///@param {String} shroomTypeString
///@return {Optional<ShroomType>} shroomType
function parseShroomTypeStringToEnum(argument0) {

		var shroomTypeString = argument0;
	
		var shroomType = null;
		switch (shroomTypeString) {
			case "default":
				shroomType = ShroomType.DEFAULT;
				break;
		}
	
		return shroomType;
	



}
