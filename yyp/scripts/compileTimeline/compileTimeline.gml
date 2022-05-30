///@function compileTimeline(timelineEntries)
///@description Prepare events in timeline
///@param {TimelineEntries[]} timelineEntries
///@return {Map<Number::GameEvent[]>} timeline
function compileTimeline(argument0) {

		var timelineEntries = argument0;
		
		var timeline = createMap();
		var timelineEntriesSize = getArrayLength(timelineEntries);
		for (var index = 0; index < timelineEntriesSize; index++) {
		
			var timelineEntry = timelineEntries[@ index];
			var time = getTimelineEntryTime(timelineEntry);
			var timelineEvents = getTimelineEntryEvents(timelineEntry);
			var timelineEventsSize = getArrayLength(timelineEvents);
			var gameEvents = createArray(timelineEventsSize);
			for (var eventIndex = 0; eventIndex < timelineEventsSize; eventIndex++) {
			
				var timelineEvent = timelineEvents[@ eventIndex];
				var type = getTimelineEventType(timelineEvent);
				var jsonEntity = tj_encode(convertMapToTJsonObject(getTimelineEventData(timelineEvent)));
			
				var entity = null;
				var deserializeScript = getAssetIndex("deserialize" + type, AssetScript, noone);
				if (deserializeScript == null) {
					throwException(createException(AssetNotFoundException, 
						stringParams("Cannot find deserialize script for type {0}", type),
						runtimeExceptionHandler));
				}
				entity = script_execute(deserializeScript, jsonEntity);	
			
				var gameEvent = createGameEvent(time, type, entity)
				gameEvents[@ eventIndex] = gameEvent;
			}
		
			if (isUndefined(timeline[? time])) {
				addToMap(timeline, time, gameEvents);
			} else {
				var targetGameEvents = timeline[? time];
				logger("Timeline entry for time {0} already exist. Merge {1} gameEvents into existing {2} gameEvents",
					LogType.WARNING, time, getArrayLength(gameEvents), getArrayLength(targetGameEvents));
				mergeArrays(targetGameEvents, gameEvents);			
			}
		}

		return timeline;
	



}
