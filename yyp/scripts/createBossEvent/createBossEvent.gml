///@function createBossEvent(type)
///@description Constructor for BossEvent entity.
///@param {String} type
///@return {BossEvent} bossEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.547Z}

function createBossEvent(type) {

	var bossEvent = createEntity(BossEvent);

	setBossEventType(bossEvent, assertNoOptional(type));

	return bossEvent;
	
}
