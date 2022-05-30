///@function parseShroomTypeEnumToString(shroomType)
///@description Enum to String parser. Return null if shroomType is invalid.
///@param {ShroomType} shroomType
///@return {Optional<String>} shroomTypeString
function parseShroomTypeEnumToString(argument0) {

		var shroomType = argument0;
	
		var shroomTypeString = null;
		switch (shroomType) {
			case ShroomType.DEFAULT:
				shroomTypeString = "default";
				break;
		}
	
		return shroomTypeString;
	



}
