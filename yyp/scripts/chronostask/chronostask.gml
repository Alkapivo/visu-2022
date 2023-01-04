///@description ChronosTask entity

///@function createChronosTask(timer, duration, chronosEvent)
///@description Constructor for ChronosTask entity.
///@param {Number} timer
///@param {Number} duration
///@param {ChronosEvent} chronosEvent
///@return {ChronosTask} chronosTask 
///@throws {Exception}
///@generated {2021-05-01T23:49:40.823Z}

function createChronosTask(timer, duration, chronosEvent) {

	var chronosTask = createEntity(ChronosTask);

	setChronosTaskTimer(chronosTask, assertNoOptional(timer));
	setChronosTaskDuration(chronosTask, assertNoOptional(duration));
	setChronosTaskChronosEvent(chronosTask, assertNoOptional(chronosEvent));

	return chronosTask;
	
}
///@function serializeChronosTask(chronosTask)
///@description Serialize ChronosTask to JSON string.
///@param {ChronosTask} chronosTask
///@return {String} chronosTaskJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:41.226Z}

function serializeChronosTask(chronosTask) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"timer",
		getChronosTaskTimer(chronosTask));	
	appendFieldToJsonObject(
		jsonObject,
		"duration",
		getChronosTaskDuration(chronosTask));	
	appendEntityToJsonObject(
		jsonObject,
		"chronosEvent",
		getChronosTaskChronosEvent(chronosTask),
		"ChronosEvent");
	

	var chronosTaskJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return chronosTaskJsonString;
	
}
///@function deserializeChronosTask(jsonString)
///@description Deserialize ChronosTask from JSON String to ChronosTask entity.
///@param {String} jsonString
///@return {ChronosTask} chronosTask 
///@throws {Exception}
///@generated {2021-05-01T23:43:41.226Z}

function deserializeChronosTask(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var timer = assertNoOptional(getJsonObjectFieldValue(jsonObject, "timer"));
	var duration = assertNoOptional(getJsonObjectFieldValue(jsonObject, "duration"));
	var chronosEvent = assertNoOptional(getJsonObjectFieldValue(jsonObject, "chronosEvent", Entity, "ChronosEvent"));

	destroyJsonObject(jsonObject);
	
	return createChronosTask(timer, duration, chronosEvent);
	
}
///@function destroyChronosTask(chronosTask)
///@description Destroy ChronosTask entity.
///@param {ChronosTask} chronosTask
///@throws {Exception}
///@generated {2021-05-01T23:43:41.226Z}

function destroyChronosTask(chronosTask) {


	
	var timer = getChronosTaskTimer(chronosTask);
	var duration = getChronosTaskDuration(chronosTask);
	var chronosEvent = getChronosTaskChronosEvent(chronosTask);
	
	destroyChronosEvent(chronosEvent);
	setChronosTaskChronosEvent(chronosTask, null);
	

	
}
///@function getChronosTaskChronosEvent(chronosTask)
///@description Getter.
///@param {ChronosTask} chronosTask
///@return {ChronosEvent} chronosEvent 
///@throws {Exception}
///@generated {2021-05-01T23:43:41.226Z}

function getChronosTaskChronosEvent(chronosTask) {

	return chronosTask[@ 2];
	
}
///@function getChronosTaskDuration(chronosTask)
///@description Getter.
///@param {ChronosTask} chronosTask
///@return {Number} duration 
///@throws {Exception}
///@generated {2021-05-01T23:43:41.226Z}

function getChronosTaskDuration(chronosTask) {

	return chronosTask[@ 1];
	
}
///@function getChronosTaskTimer(chronosTask)
///@description Getter.
///@param {ChronosTask} chronosTask
///@return {Number} timer 
///@throws {Exception}
///@generated {2021-05-01T23:43:41.226Z}

function getChronosTaskTimer(chronosTask) {

	return chronosTask[@ 0];
	
}
///@function setChronosTaskChronosEvent(chronosTask, chronosEvent)
///@description Setter.
///@param {ChronosTask} chronosTask
///@param {ChronosEvent} chronosEvent
///@throws {Exception}
///@generated {2021-05-01T23:49:40.824Z}

function setChronosTaskChronosEvent(chronosTask, chronosEvent) {

	chronosTask[@ 2] = chronosEvent;
	
}
///@function setChronosTaskDuration(chronosTask, duration)
///@description Setter.
///@param {ChronosTask} chronosTask
///@param {Number} duration
///@throws {Exception}
///@generated {2021-05-01T23:49:40.824Z}

function setChronosTaskDuration(chronosTask, duration) {

	chronosTask[@ 1] = duration;
	
}
///@function setChronosTaskTimer(chronosTask, timer)
///@description Setter.
///@param {ChronosTask} chronosTask
///@param {Number} timer
///@throws {Exception}
///@generated {2021-05-01T23:49:40.824Z}

function setChronosTaskTimer(chronosTask, timer) {

	chronosTask[@ 0] = timer;
	
}
