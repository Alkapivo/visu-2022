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
