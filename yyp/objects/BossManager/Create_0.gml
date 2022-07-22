///@description
	
	super();
	
	#region Fields
///@public:

	///@type {Stack<BossEvent>}
	bossEventPipeline = createStack();
	
	///@type {List<Boss>}
	bosses = createList();
		
	///@type {Stack<Boss>}
	destroyBossPipeline = createStack();
	
	bossSurface = createSurface(ViewWidth, ViewHeight);
		
///@private:
	
	#endregion

	GMObject = {
		update: method(this, function() {
		
			for (var index = 0; index < getStackSize(this.bossEventPipeline); index++) {
				var bossEvent = popStack(this.bossEventPipeline);
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
	
		}),
		cleanUp: method(this, function() {
			
			super();
	
			for (var index = 0; index < getStackSize(this.bossEventPipeline); index++) {
				var bossEvent = popStack(this.bossEventPipeline);
				destroyBossEvent(bossEvent);
			}
			destroyDataStructure(this.bossEventPipeline, Stack, "Unable to destroy bossEventPipeline");

			for (var index = 0; index < getListSize(this.bosses); index++) {
				var boss = Core.Collections._List.get(bosses, index);
				destroyBoss(boss);
			}
			destroyDataStructure(this.bosses, List, "Unable to destroy bosses");
	
			for (var index = 0; index < getStackSize(this.destroyBossPipeline); index++) {
				var boss = popStack(this.destroyBossPipeline);
				destroyBossEvent(boss);
			}	
			destroyDataStructure(this.destroyBossPipeline, Stack, "Unable to destroy destroyBossPipeline");
	
			destroySurface(this.bossSurface);
		}),
		preRender: method(this, function() {

			guardSurface(this, this.bossSurface, "bossSurface", ViewWidth, ViewHeight, true);
			gpuSetSurfaceTarget(this.bossSurface);
	
			var bossesSize = Core.Collections._List.size(this.bosses);
			var destroyBosses = [];
			for (var index = 0; index < bossesSize; index++) {
				var boss = Core.Collections._List.get(this.bosses, index);
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
	
			removeItemsFromList(this.bosses, destroyBosses, destroyBoss);
	
			gpuResetSurfaceTarget();	
		})
	}