///@function destroyBoss(boss)
///@description Destroy Boss entity.
///@param {Boss} boss
///@throws {Exception}
///@generated {2022-08-18T22:24:59.535Z}

function destroyBoss(boss) {


	
	var type = getBossType(boss);
	var state = getBossState(boss);
	var handler = getBossHandler(boss);
	
	destroyDataStructure(state, Map, "Unable to destroy Map state in Boss");
	setBossState(boss, null);
	

	
}
