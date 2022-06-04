///@function parseBossTypeStringToEnum(bossTypeString)
///@description Enum to String parser. Return null if bossTypeString is invalid.
///@param {String} bossTypeString
///@return {Optional<BossType>} bossType
function parseBossTypeStringToEnum(argument0) {

		var bossTypeString = argument0;
	
		var bossType = null;
		switch (bossTypeString) {
			case "visu":
				bossType = BossType.VISU;
				break;
			case "mid":
				bossType = BossType.MID;
				break;
		}
	
		return bossType;
	



}
