///@description 

	#region Boss Reactor
	guardSurface(id, bossSurface, "bossSurface", global.viewWidth, global.viewHeight, true);
	gpuSetSurfaceTarget(bossSurface);
	
	var bossesSize = getListSize(bosses);
	var destroyBosses = [];
	for (var index = 0; index < bossesSize; index++) {
		var boss = bosses[|index];
		var bossScriptHandler = getBossHandler(boss);
		
		var state = getBossState(boss);
		var clearSurface = getValueFromMap(state, "clearSurface", true);
		if (clearSurface) {
			drawClear(COLOR_TRANSPARENT);	
		}
		
		runScript(bossScriptHandler, boss);
		
		var isDestroy = getValueFromMap(state, "destroy", false);
		if (isDestroy) {
			
			destroyBosses = pushArray(destroyBosses, index);
		}
	}
	
	removeItemsFromList(bosses, destroyBosses, destroyBoss);
	
	gpuResetSurfaceTarget();
	#endregion
	
