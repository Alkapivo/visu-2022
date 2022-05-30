///@export getCurrentDaySunriseTime(): Number
///@export getCurrentDaySunsetTime(): Number
///@export getCurrentDayTime(): Number
///@export getCurrentHour(): Number
///@export getCurrentTimestamp(): Number
///@export corpseChronosTaskHandler(Corpse, Optional<ArrayMap<any::any>>)
///@export leverChronosTaskHandler(Lever, Optional<ArrayMap<any::any>>))
///@export mobSpawnerChronosTaskHandler(MobSpawner, Optional<ArrayMap<any::any>>)
///@export checkIfDayTimeInRange(Number, Number): Boolean
///@export convertGameTimeToRealTime(Number, Number): Number
///@export convertRealTimeToGameTime(Number, Number): Number
///@export getCalendarDate(Integer, Integer, Integer, Number, Number): Number
///@export getFormatedDayTime(): String
///@export getRealTimeBetweenCalendarDates(Number, Number): Number
///@export rewindCalendarDateBy(Integer, Integer, Integer)
///@export sendChronosEvent(ChronosEvent)
///@export restoreCalendarManagerState(Optional<WorldInstanceState<CalendarManagerState>>)
///@export storeCalendarManagerState(CalendarManager): WorldInstanceState<CalendarManagerState>
///@export createCalendarManager(): any
///@export getCalendarManager(): CalendarManager

///@return {Number} sunrise
function getCurrentDaySunriseTime() {

	return getCalendarManager().sunrise;
}

///@return {Number} sunset
function getCurrentDaySunsetTime() {

	return getCalendarManager().sunset;
}

///@return {Number} day
function getCurrentDayTime() {

	return getCalendarManager().dayTime;
}

///@return {Number} hour
function getCurrentHour() {

	return (getCurrentDayTime() / DAY_LENGTH) * 24;
}

///@return {Number} timestamp
function getCurrentTimestamp() {

	return getCalendarManager().gameTime;
}

///@description ChronosEvent::handlerName handler.
///@param {Corpse} corpse
///@param {Optional<ArrayMap<any::any>>} data
function corpseChronosTaskHandler(corpse, data) {

	destroy(corpse);
}

///@description ChronosEvent::handlerName handler.
///@param {Lever} lever
///@param {Optional<ArrayMap<any::any>>} data
function leverChronosTaskHandler(lever, data) {

	disableLever(lever);
}

///@description ChronosEvent::handlerName handler.
///@param {MobSpawner} mobSpawner
///@param {Optional<ArrayMap<any::any>>} data
function mobSpawnerChronosTaskHandler(mobSpawner, data) {

	setMobSpawnerStatus(mobSpawner, MobSpawnerStatus_SPAWN);
}

///@param {Number} startHour
///@param {Number} length in hours
///@return {Boolean} isValid
function checkIfDayTimeInRange(startHour, length) {

	var currentHour = floor(getCurrentDayTime() / DAY_LENGTH);
	var endHour = (startHour + length);
	endHour = endHour > 24 ? endHour mod 24 : endHour;

	var isValid = false;
	if (endHour < startHour) {

	    isValid =
	        (currentHour >= startHour && currentHour < 24) ||
	        (currentHour < endHour);
	} else {

	    isValid = (currentHour >= startHour) && (currentHour < endHour)
	}

	return isValid;
}

///@description Return normalized realTime.
///@param {Number} gameTime
///@return {Number} realTime in seconds
function convertGameTimeToRealTime(gameTime) {

	var timeSpeed = (getCalendarManager().timeSpeed / GAME_FPS);
	var realTime = gameTime / timeSpeed;

	return realTime;
}

///@description Return normalized gameTime.
///@param {Number} realTime in seconds
///@return {Number} gameTime
function convertRealTimeToGameTime(realTime) {

	var timeSpeed = (getCalendarManager().timeSpeed / GAME_FPS);
	var gameTime = realTime * timeSpeed;

	return gameTime;
}

///@description Calculate date.
///@param {Integer} day
///@param {Integer} hour
///@param {Integer} minute
///@param {Number} second
///@return {Number} calendarDate
function getCalendarDate(day, hour, minute, second) {

	return second +
	    (minute * 60) +
	    ((hour * 60) * 60) +
	    (((day * 24) * 60) * 60);
}

///@description Return string formated dayTime
///@return {String} dayTime
function getFormatedDayTime() {

	var dayTime = getCurrentDayTime();
	var hour = floor(dayTime / 3600);
	var minute = floor((dayTime - (hour * 3600)) / 60);

	var hourString = string(hour);
	var minuteString = string(minute);
	minuteString = string_length(minuteString) == 1 ? "0" + minuteString : minuteString;

	return hourString + ":" + minuteString
}

///@description Calculate how many seconds (float) are between two calendar dates.
///@param {Number} calendarDateBefore
///@param {Number} calendarDateAfter
///@return {Number} realTime in seconds
function getRealTimeBetweenCalendarDates(calendarDateBefore, calendarDateAfter) {

	var gameTime = calendarDateAfter - calendarDateBefore;
	var realTime = convertGameTimeToRealTime(gameTime);

	return realTime;
}

///@description Rewind time by parameters.
///@param {Integer} [day=0]
///@param {Integer} [hour=0]
///@param {Integer} [minutes=0]
///@param {Integer} [seconds=0]
function rewindCalendarDateBy() {

	var day = argument_count > 0 ? getDefaultValue(cast(argument[0], typeOf(Primitive, Number)), 0) : 0;
	var hour = argument_count > 1 ? getDefaultValue(cast(argument[1], typeOf(Primitive, Number)), 0) : 0;
	var minutes = argument_count > 2 ? getDefaultValue(cast(argument[2], typeOf(Primitive, Number)), 0) : 0;
	var seconds = argument_count > 3 ? getDefaultValue(cast(argument[3], typeOf(Primitive, Number)), 0) : 0;

	var date = getCalendarDate(day, hour, minutes, seconds);
	var gameTime = getCurrentTimestamp();
	var dayTime = getCurrentDayTime();

	gameTime = gameTime + date;
	dayTime = (dayTime + date) mod DAY_LENGTH;

	var calendarManager = getCalendarManager();
	setInstanceVariable(calendarManager, "gameTime", gameTime);
	setInstanceVariable(calendarManager, "dayTime", dayTime);
}

///@description Add chronosEvent to CalendarManager::chronosEventPipeline.
///@param {ChronosEvent} chronosEvent
function sendChronosEvent(chronosEvent) {

	addElementToPipeline(getCalendarManager().chronosEventPipeline, chronosEvent)
}

///@description restoreHandler implementation for CalendarManager.
///@param {CalendarManager} calendarManager
///@param {Optional<WorldInstanceState<CalendarManagerState>>} worldInstanceState
///@throws {NotANumberException}
function restoreCalendarManagerState(calendarManager, worldInstanceState) {

	if (!isWorldInstanceState(worldInstanceState, CalendarManagerState)) {

	    return;
	}

	///@safeCast {CalendarManagerState}
	var calendarManagerState = getWorldInstanceStateData(worldInstanceState);

	var gameTime = getCalendarManagerStateGameTime(calendarManagerState);
	var dayTime = getCalendarManagerStateDayTime(calendarManagerState);
	if ((isNumber(gameTime)) &&
	    (isNumber(dayTime))) {

	    setInstanceVariable(calendarManager, FieldCalendarManager_gameTime, gameTime);
	    setInstanceVariable(calendarManager, FieldCalendarManager_dayTime, gameTime); 
	} else {

	    throwException(
	            createException(
	                    NotANumberException,
	                    stringParams(
	                            "Time must be a number. { \"gameTime\" \"{0}\", \"dayTime\": \"{1}\" }",
	                            gameTime, dayTime
	                    )
	            )
	    );
	}
}

///@description storeHandler implementation for CalendarManager.
///@param {CalendarManager} calendarManager
///@return {WorldInstanceState<CalendarManagerState>} worldInstanceState
///@throws {InvalidEntityException}
function storeCalendarManagerState(calendarManager) {

	var gameTime = getInstanceVariable(calendarManager, FieldCalendarManager_gameTime);
	var dayTime = getInstanceVariable(calendarManager, FieldCalendarManager_dayTime);

	var calendarManagerState = createCalendarManagerState(gameTime, dayTime);

	var worldInstanceState = createWorldInstanceState("CalendarManagerState", calendarManagerState);
	return worldInstanceState;
}

///@param {Layer} [layerId]
///@return {CalendarManager} calendarManager
function createCalendarManager() {

	var class = CalendarManager;
	var instanceLayer = argument_count > 0 ? argument[0] : getSystemLayer();

	var instance = defaultContextInstanceConstructor(class, "CalendarManager", instanceLayer);    

	return instance;
}

///@return {Optional<CalendarManager>} calendarManager
function getCalendarManager() {

	return global.calendarManagerContext;
}
