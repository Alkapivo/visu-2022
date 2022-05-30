///@function createBossEvent(type)
///@description Constructor for BossEvent entity.
///@param {String} type
///@return {BossEvent} bossEvent 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.475Z}

function createBossEvent(type) {

	var bossEvent = createEntity(BossEvent);

	setBossEventType(bossEvent, assertNoOptional(type));

	return bossEvent;
	
}
