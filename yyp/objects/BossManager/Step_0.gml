///@description

	#region BossEventPipeline Dispatcher
	for (var index = 0; index < getStackSize(bossEventPipeline); index++) {
		var bossEvent = popStack(bossEventPipeline);
		var bossTypeString = getBossEventType(bossEvent);
		var bossType = parseBossTypeStringToEnum(bossTypeString);
		
		if (bossType != null) {
			logger("Dispatching BossEvent: {\"bossType\": {0}}", bossTypeString);
			spawnBoss(bossType);
		} else {
			logger("BossType \"{0}\" doesn't exist", LogType.WARNING, bossTypeString);	
		}
		destroyBossEvent(bossEvent);
	}
	#endregion
	
