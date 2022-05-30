///@description create()

	super();
	
	#region Fields
	
	#macro FieldCalendarManager_gameTime "gameTime"
	#macro FieldCalendarManager_dayTime "dayTime"
	
///@public:

	///@type {AssetScript}
	storeHandler = storeCalendarManagerState;
	
	///@type {AssetScript}
	restoreHandler = restoreCalendarManagerState;
	
	///@type {Number}
	gameTime = 0.0;
	
	///@type {Number}
	dayTime = 0.0;
		
	///@type {Number}
	sunrise = getCalendarDate(0, 4, 20, 0.0);
	
	///@type {Number}
	sunset = getCalendarDate(0, 19, 00, 0.0);
	
	///@type {Number}
	timeSpeed = getPropertyReal("calendarManager.timeSpeed", 30);
	
	///@type {Pipeline<ChronosEvent>} 
	chronosEventPipeline = generatePipeline("chronosEventPipeline", Queue, ChronosEvent);
	
	///@type {Reactor<ChronosTask>
	chronosTaskReactor = generateReactor("chronosTaskPipeline", List, ChronosTask);
	
///@private:
	
	///@type {Boolean}
	logDebug = getPropertyBoolean("calendarManager.logDebug", false);
	
	#endregion
	
	gameTime = getCalendarDate(0, getPropertyReal("calendarManager.startHour", 6), 0, 0);
	dayTime = gameTime;
	
