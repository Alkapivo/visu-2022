///@description Timeline entity

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
///@function serializeTimeline(timeline)
///@description Serialize Timeline to JSON string.
///@param {Timeline} timeline
///@return {String} timelineJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.953Z}

function serializeTimeline(timeline) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"time",
		getTimelineTime(timeline));	
	appendFieldToJsonObject(
		jsonObject,
		"context",
		getTimelineContext(timeline));	
	appendEntityToJsonObject(
		jsonObject,
		"stack",
		getTimelineStack(timeline),
		"Satck<GameEvent");
	

	var timelineJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return timelineJsonString;
	
}
///@function deserializeTimeline(jsonString)
///@description Deserialize Timeline from JSON String to Timeline entity.
///@param {String} jsonString
///@return {Timeline} timeline 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.953Z}

function deserializeTimeline(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var time = assertNoOptional(getJsonObjectFieldValue(jsonObject, "time"));
	var context = assertNoOptional(getJsonObjectFieldValue(jsonObject, "context"));
	var stack = assertNoOptional(getJsonObjectFieldValue(jsonObject, "stack", Entity, "Satck<GameEvent"));

	destroyJsonObject(jsonObject);
	
	return createTimeline(time, context, stack);
	
}
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
///@function getTimelineContext(timeline)
///@description Getter.
///@param {Timeline} timeline
///@return {Instance} context 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.953Z}

function getTimelineContext(timeline) {

	return timeline[@ 1];
	
}

///@function getTimelineStack(timeline)
///@description Getter.
///@param {Timeline} timeline
///@return {Satck<GameEvent>} stack 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.953Z}

function getTimelineStack(timeline) {

	return timeline[@ 2];
	
}
///@function getTimelineTime(timeline)
///@description Getter.
///@param {Timeline} timeline
///@return {Number} time 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.953Z}

function getTimelineTime(timeline) {

	return timeline[@ 0];
	
}
///@function setTimelineContext(timeline, context)
///@description Setter.
///@param {Timeline} timeline
///@param {Instance} context
///@throws {Exception}
///@generated {2022-08-18T22:24:59.953Z}

function setTimelineContext(timeline, context) {

	timeline[@ 1] = context;
	
}

///@function setTimelineStack(timeline, stack)
///@description Setter.
///@param {Timeline} timeline
///@param {Satck<GameEvent>} stack
///@throws {Exception}
///@generated {2022-08-18T22:24:59.953Z}

function setTimelineStack(timeline, stack) {

	timeline[@ 2] = stack;
	
}
///@function setTimelineTime(timeline, time)
///@description Setter.
///@param {Timeline} timeline
///@param {Number} time
///@throws {Exception}
///@generated {2022-08-18T22:24:59.953Z}

function setTimelineTime(timeline, time) {

	timeline[@ 0] = time;
	
}












