///@function destroyBoss(boss)
///@description Destroy Boss entity.
///@param {Boss} boss
///@throws {Exception}
///@generated {2021-08-25T13:56:53.436Z}

function destroyBoss(boss) {


	
	var type = getBossType(boss);
	var state = getBossState(boss);
	var handler = getBossHandler(boss);
	
	destroyDataStructure(state, Map, "Unable to destroy Map state in Boss");
	setBossState(boss, null);
	

	
}
