///@function createTimeline(time, context, stack)
///@description Constructor for Timeline entity.
///@param {Number} time
///@param {Instance} context
///@param {Satck<GameEvent>} stack
///@return {Timeline} timeline 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.829Z}

function createTimeline(time, context, stack) {

	var timeline = createEntity(Timeline);

	setTimelineTime(timeline, assertNoOptional(time));
	setTimelineContext(timeline, assertNoOptional(context));
	setTimelineStack(timeline, assertNoOptional(stack));

	return timeline;
	
}
