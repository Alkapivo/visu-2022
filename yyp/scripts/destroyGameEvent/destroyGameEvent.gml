///@function destroyGameEvent(gameEvent)
///@description Destroy GameEvent entity.
///@param {GameEvent} gameEvent
///@generated {2019-10-23T07:40:07.811Z}
///@override
function destroyGameEvent(argument0) {

		var gameEvent = argument0;
	
	#region @override Destroy GameEvent
		var type = getGameEventType(gameEvent);
		var entity = getGameEventEntity(gameEvent);
		var destroyScript = getAssetIndex("destroy" + type, AssetScript);
		if (!isOptionalPresent(destroyScript)) {
			throwException(createException(NotImplementedException, stringParams("Cannot find destroy script for type {0}", type), runtimeExceptionHandler));
		}
		runScript(destroyScript, entity);
	#endregion
	



}
