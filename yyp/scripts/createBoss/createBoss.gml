///@function createBoss(type, state, handler)
///@description Constructor for Boss entity.
///@param {BossType} type
///@param {Map<String::any>} state
///@param {AssetScript} handler
///@return {Boss} boss 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.534Z}

function createBoss(type, state, handler) {

	var boss = createEntity(Boss);

	setBossType(boss, assertNoOptional(type));
	setBossState(boss, assertNoOptional(state));
	setBossHandler(boss, assertNoOptional(handler));

	return boss;
	
}
