///@function createTimelineManager(layerId)
///@description Constructor.
///@param {Layer} [layerId]
///@return {TimelineManager} timelineManager
function createTimelineManager() {

		var class = TimelineManager;
		var instanceLayer = argument_count > 0 ? argument[0] : getSystemLayer();
	
		var instance = defaultContextInstanceConstructor(class, "TimelineManager", instanceLayer);
	
		return instance;
	



}
