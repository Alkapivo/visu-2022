///@description

	super();
	
	for (var index = 0; index < getStackSize(bossEventPipeline); index++) {
		var bossEvent = popStack(bossEventPipeline);
		destroyBossEvent(bossEvent);
	}
	destroyDataStructure(bossEventPipeline, Stack, "Unable to destroy bossEventPipeline");

	for (var index = 0; index < getListSize(bosses); index++) {
		var boss = bosses[| index];
		destroyBoss(boss);
	}
	destroyDataStructure(bosses, List, "Unable to destroy bosses");
	
	for (var index = 0; index < getStackSize(destroyBossPipeline); index++) {
		var boss = popStack(destroyBossPipeline);
		destroyBossEvent(boss);
	}
	destroyDataStructure(destroyBossPipeline, Stack, "Unable to destroy destroyBossPipeline");
	
	destroySurface(bossSurface);