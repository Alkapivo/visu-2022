///@function incrementTimeline(timeline)
///@description Change timeline time.
///@param {Timeline} timeline
function incrementTimeline(argument0) {

		var timeline = argument0;
	
		var time = getTimelineTime(timeline);
	
		time += (1 / GAME_FPS) * getDeltaTimeValue();
		setTimelineTime(timeline, time);
	



}
