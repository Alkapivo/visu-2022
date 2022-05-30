///@function sendBossEvent(audioEvent)
///@description Send bossEvent to BossManager
///@param {BossEvent} bossEvent
function sendBossEvent(argument0) {

		var bossEvent = argument0;

		var bossPipeline = getBossManager().bossEventPipeline;
	
		pushStack(bossPipeline, bossEvent);
	



}
