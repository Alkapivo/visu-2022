///@function createBossManager(layerId)
///@description Constructor.
///@param {Layer} [layerId]
///@return {BossManager} bossManager
function createBossManager() {

	var class = BossManager;
	var instanceLayer = argument_count > 0 ? argument[0] : getSystemLayer();
	
	var instance = defaultContextInstanceConstructor(class, "BossManager", instanceLayer);
	
	return instance;
}

///@function fetchBoss()
///@description Return collection of bosses.
///@return {List<Boss>} bosses
function fetchBosses() {

	return getBossManager().bosses;
}

///@function getBossManager()
///@description Getter.
///@return {Optional<BossManager>} bossManager
function getBossManager() {

	return global.bossManagerContext;
}

///@function sendBossEvent(audioEvent)
///@description Send bossEvent to BossManager
///@param {BossEvent} bossEvent
function sendBossEvent(bossEvent) {

	var bossPipeline = getBossManager().bossEventPipeline;	
	pushStack(bossPipeline, bossEvent);
}

///@function spawnBoss(bossType)
///@description Boss Factory.
///@param {BossType} bossType
function spawnBoss(bossType) {

	var boss = null;	
	if (boss != null) {
		var bosses = fetchBosses();
		addToList(bosses, boss);
	}
}
