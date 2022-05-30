///@description

	///@todo remove;
	var IsWorldInitialized = true

	if ((IsWorldInitialized) &&
		(IsGameLoopOn)) {
	
		#region Resolve game time
		var delta = getDeltaTimeValue();
		var nextTimeUnit = ((timeSpeed / GAME_FPS) * delta) / GAME_FPS;

		gameTime = gameTime + nextTimeUnit;
		dayTime = dayTime + nextTimeUnit;
	
		if (gameTime > MAX_NUMBER) {
			
			gameTime = 0.0;
			logger("Game time over MAX_NUMBER({0})", LogType.INFO, MAX_NUMBER); 
		}
	
		if (dayTime >= DAY_LENGTH) {
			
			dayTime = dayTime - DAY_LENGTH;	
		}
		#endregion
		
		#region {Pipeline<ChronosEvent>} chronosEventPipeline
		for (var chronosEvent = getPipelineFirstElement(chronosEventPipeline);
			iteratorFinish(chronosEvent);
			chronosEvent = getPipelineNextElement(chronosEventPipeline)) {
				
			var duration = getChronosEventDuration(chronosEvent);
			
			var handlerName = getChronosEventHandlerName(chronosEvent);
			if (!isScript(getAssetIndex(handlerName, AssetScript))) {
				throwException(
					createException(
						AssetNotFoundException,
						stringParams("ChronosEvent handler wasn't found. { \"handlerName\": \"{0}\" }", handlerName)
					)
				);
			}
			
			var data = getChronosEventData(chronosEvent);
			if ((isOptionalPresent(data)) && 
				(!isEntity(data, ArrayMap))) {
				throwException(
					createException(
						InvalidEntityException,
						stringParams("ChronosEvent data wasn't an ArrayMap. { \"rawData\": \"{0}\" }", data)
					)
				);
			}
			
			if (!isOptionalPresent(catchException())) {
				var chronosTask = createChronosTask(0.0, duration, chronosEvent);
				addElementToReactor(chronosTaskReactor, chronosTask);
			}
		}
		#endregion
		
		#region {Reactor<ChronosTask>} chronosTaskReactor
		for (var chronosTask = getReactorFirstElement(chronosTaskReactor);
			iteratorFinish(chronosTask);
			chronosTask = getReactorNextElement(chronosTaskReactor)) {
			
			var duration = getChronosTaskDuration(chronosTask);
			var timer = getChronosTaskTimer(chronosTask);
			timer = incrementTimer(timer, duration);
			setChronosTaskTimer(chronosTask, timer);
			
			var chronosEvent = getChronosTaskChronosEvent(chronosTask);
			var instance = getChronosEventInstanceId(chronosEvent);
			setInstanceVariable(instance, "currentChronosTaskTimer", timer);
			
			if (timerFinished(timer)) {
				
				var chronosEvent = getChronosTaskChronosEvent(chronosTask);
				var handlerName = getChronosEventHandlerName(chronosEvent);
				if (isOptionalPresent(handlerName)) {
					var data = getChronosEventData(chronosEvent);
					var handler = getAssetIndex(handlerName, AssetScript);
					
					runScript(handler, data);	
				}
				
				setInstanceVariable(instance, "currentChronosTaskTimer", createEmptyOptional());
				removeReactorElement(chronosTaskReactor);	
			}
		}
		resolveReactor(chronosTaskReactor);
		#endregion
		
	}
