///@description 

	super();
	
	for (key = mapFirst(timelines); iteratorFinish(key); key = mapNext(timelines, key)) {
		var timeline = timelines[? key];
		destroyTimeline(timeline);
	}
	destroyDataStructure(timelines, Map, "Unable to destroy timelines");
	
