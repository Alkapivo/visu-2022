///@description convertTimelineToTimelineStack(timeline)
///@description Flat TimelineMap to Stack.
///@param {Stack<GameEvent[]>} timelineStack
function convertTimelineToTimelineStack(argument0) {

		var timeline = argument0;
	
		var timelineStack = createStack();
		var timelineKeys = getMapKeys(timeline);
		var unsortedTimes = [];
		for (var index = 0; index < getArrayLength(timelineKeys); index++) {
			var time = parseNumberFromString(timelineKeys[index]);
			if (time != null) {
				pushArray(unsortedTimes, time);
			} else {
				logger("Found invalid time in timeline, raw data: {0}", LogType.WARNING, time);	
			}
		}
		var times = sortArray(unsortedTimes, false);

		var timesSize = getArrayLength(times);
		for (var index = 0; index < timesSize; index++) {
		    var time = times[index];
		    var gameEvents = timeline[? time];
		    pushStack(timelineStack, gameEvents);
		}

		return timelineStack;
	



}
