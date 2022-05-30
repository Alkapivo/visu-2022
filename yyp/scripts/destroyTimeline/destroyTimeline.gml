///@function destroyTimeline(timeline)
///@description Destroy Timeline entity.
///@param {Timeline} timeline
///@generated {2019-10-23T10:59:05.162Z}
///@override
function destroyTimeline(argument0) {

		var timeline = argument0;
	
		var stack = getTimelineStack(timeline);
	#region override
		for (var index = 0; index < getStackSize(stack); index++) {
			var gameEvents = popStack(stack);
			for (var gameEventIndex = 0; gameEventIndex < getArrayLength(gameEvents); gameEventIndex++) {
				var gameEvent = gameEvents[gameEventIndex];
				destroyGameEvent(gameEvent);
			}
		}
	#endregion
		destroyDataStructure(stack, Stack, "Unable to destroy Stack stack in Timeline");
		setTimelineStack(timeline, null);
	



}
