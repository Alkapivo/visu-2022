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
