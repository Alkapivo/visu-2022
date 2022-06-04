///@function parseBossTypeEnumToString(bossType)
///@description Enum to String parser. Return null if bossType is invalid.
///@param {BossType} bossType
///@return {Optional<String>} bossTypeString
function parseBossTypeEnumToString(argument0) {

		var bossType = argument0;
	
		var bossTypeString = null;
		switch (bossType) {
			case BossType.VISU:
				bossTypeString = "visu";
				break;
			case BossType.MID:
				bossTypeString = "mid";
				break;
		}
	
		return bossTypeString;
	



}
