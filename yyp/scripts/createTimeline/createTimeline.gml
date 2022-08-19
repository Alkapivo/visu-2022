///@function createTimeline(time, context, stack)
///@description Constructor for Timeline entity.
///@param {Number} time
///@param {Instance} context
///@param {Satck<GameEvent>} stack
///@return {Timeline} timeline 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.953Z}

function createTimeline(time, context, stack) {

	var timeline = createEntity(Timeline);

	setTimelineTime(timeline, assertNoOptional(time));
	setTimelineContext(timeline, assertNoOptional(context));
	setTimelineStack(timeline, assertNoOptional(stack));

	return timeline;
	
}
