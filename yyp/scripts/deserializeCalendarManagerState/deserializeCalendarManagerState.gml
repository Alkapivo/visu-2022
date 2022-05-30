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
