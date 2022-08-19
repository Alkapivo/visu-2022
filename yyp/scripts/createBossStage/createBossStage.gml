///@function createBossStage(name, timer, duration)
///@description Constructor for BossStage entity.
///@param {String} name
///@param {Number} timer
///@param {Number} duration
///@return {BossStage} bossStage 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.554Z}

function createBossStage(name, timer, duration) {

	var bossStage = createEntity(BossStage);

	setBossStageName(bossStage, assertNoOptional(name));
	setBossStageTimer(bossStage, assertNoOptional(timer));
	setBossStageDuration(bossStage, assertNoOptional(duration));

	return bossStage;
	
}
