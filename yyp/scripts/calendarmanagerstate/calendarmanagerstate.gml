///@description CalendarManagerState entity

///@function createCalendarManagerState(gameTime, dayTime)
///@description Constructor for CalendarManagerState entity.
///@param {Number} gameTime
///@param {Number} dayTime
///@return {CalendarManagerState} calendarManagerState 
///@throws {Exception}
///@generated {2021-05-01T23:49:38.717Z}

function createCalendarManagerState(gameTime, dayTime) {

	var calendarManagerState = createEntity(CalendarManagerState);

	setCalendarManagerStateGameTime(calendarManagerState, assertNoOptional(gameTime));
	setCalendarManagerStateDayTime(calendarManagerState, assertNoOptional(dayTime));

	return calendarManagerState;
	
}
///@function serializeCalendarManagerState(calendarManagerState)
///@description Serialize CalendarManagerState to JSON string.
///@param {CalendarManagerState} calendarManagerState
///@return {String} calendarManagerStateJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:36.068Z}

function serializeCalendarManagerState(calendarManagerState) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"gameTime",
		getCalendarManagerStateGameTime(calendarManagerState));	
	appendFieldToJsonObject(
		jsonObject,
		"dayTime",
		getCalendarManagerStateDayTime(calendarManagerState));	

	var calendarManagerStateJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return calendarManagerStateJsonString;
	
}
///@function deserializeCalendarManagerState(jsonString)
///@description Deserialize CalendarManagerState from JSON String to CalendarManagerState entity.
///@param {String} jsonString
///@return {CalendarManagerState} calendarManagerState 
///@throws {Exception}
///@generated {2021-05-01T23:43:36.068Z}

function deserializeCalendarManagerState(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var gameTime = assertNoOptional(getJsonObjectFieldValue(jsonObject, "gameTime"));
	var dayTime = assertNoOptional(getJsonObjectFieldValue(jsonObject, "dayTime"));

	destroyJsonObject(jsonObject);
	
	return createCalendarManagerState(gameTime, dayTime);
	
}
///@function destroyCalendarManagerState(calendarManagerState)
///@description Destroy CalendarManagerState entity.
///@param {CalendarManagerState} calendarManagerState
///@throws {Exception}
///@generated {2021-05-01T23:43:36.068Z}

function destroyCalendarManagerState(calendarManagerState) {


	
	var gameTime = getCalendarManagerStateGameTime(calendarManagerState);
	var dayTime = getCalendarManagerStateDayTime(calendarManagerState);
	

	
}
///@function getCalendarManagerStateDayTime(calendarManagerState)
///@description Getter.
///@param {CalendarManagerState} calendarManagerState
///@return {Number} dayTime 
///@throws {Exception}
///@generated {2021-05-01T23:43:36.069Z}

function getCalendarManagerStateDayTime(calendarManagerState) {

	return calendarManagerState[@ 1];
	
}
///@function getCalendarManagerStateGameTime(calendarManagerState)
///@description Getter.
///@param {CalendarManagerState} calendarManagerState
///@return {Number} gameTime 
///@throws {Exception}
///@generated {2021-05-01T23:43:36.069Z}

function getCalendarManagerStateGameTime(calendarManagerState) {

	return calendarManagerState[@ 0];
	
}
///@function setCalendarManagerStateDayTime(calendarManagerState, dayTime)
///@description Setter.
///@param {CalendarManagerState} calendarManagerState
///@param {Number} dayTime
///@throws {Exception}
///@generated {2021-05-01T23:49:38.717Z}

function setCalendarManagerStateDayTime(calendarManagerState, dayTime) {

	calendarManagerState[@ 1] = dayTime;
	
}
///@function setCalendarManagerStateGameTime(calendarManagerState, gameTime)
///@description Setter.
///@param {CalendarManagerState} calendarManagerState
///@param {Number} gameTime
///@throws {Exception}
///@generated {2021-05-01T23:49:38.717Z}

function setCalendarManagerStateGameTime(calendarManagerState, gameTime) {

	calendarManagerState[@ 0] = gameTime;
	
}
