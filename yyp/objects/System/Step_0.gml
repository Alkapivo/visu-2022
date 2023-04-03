///@description update()

	#region {Pipeline<SystemEvent>} global.systemEventPipeline
	var systemEventPipeline = getSystemEventPipeline();
	for (var systemEvent = getPipelineFirstElement(systemEventPipeline); 
		iteratorFinish(systemEvent); 
		systemEvent = getPipelineNextElement(systemEventPipeline)) {
		
		var systemEventType = getSystemEventType(systemEvent);
		var systemEventData = getSystemEventData(systemEvent);
		
		switch (systemEventType) {
			#region SystemEventType_LOADING_INTENT
			case SystemEventType_LOADING_INTENT:
				var data = createEmptyOptional();
				if (isEntity(systemEventData, ArrayMap)) {
					data = getValueFromArrayMap(systemEventData, "data");
				}
				runControllerLoadingIntent(getSceneController(), data);
				break;
			#endregion
			#region SystemEventType_QUIT
			case SystemEventType_QUIT:
				game_end();
				break;
			#endregion
			default:
				throwException(
					createException(
						NotImplementedException,
						stringParams("Found unsupported systemEvent type. { \"type\": \"{0}\"", systemEventType)
					)
				)
				break;
		}
		
		destroySystemEvent(systemEvent);
	}
	clearException();
	#endregion

	#region {Pipeline<LoadingIntent} loadingIntentPipeline
	for (var loadingIntent = getPipelineFirstElement(loadingIntentPipeline); 
		iteratorFinish(loadingIntent); 
		loadingIntent = getPipelineNextElement(loadingIntentPipeline)) {
		
		var scene = getLoadingIntentScene(loadingIntent);
		if (!isScene(scene)) {
			throwException(
				createException(
					AssetNotFoundException,
					stringParams("Scene not found. {\"rawData\": \"scene\"}")
				)
			);
			continue;
		}
		
		var data = getLoadingIntentData(loadingIntent);
		var systemEventData = createArrayMap(
			[
				"type",
				"data"
			],
			[
				"loading-intent",
				isEntity(data, ArrayMap) ? cloneArrayMap(data) : createEmptyOptional()
			]
		);
		
		var systemEvent = createSystemEvent(SystemEventType_LOADING_INTENT, get_timer(), systemEventData)
		
		room_goto(scene);
		sendSystemEvent(systemEvent);
		
		destroyLoadingIntent(loadingIntent);
	}
	clearException();
	#endregion

	#region {Reactor<InstanceFieldModifier>} instanceFieldModifierTaskReactor
	for (var fieldModifierTask = getReactorFirstElement(instanceFieldModifierTaskReactor); 
		iteratorFinish(fieldModifierTask); 
		fieldModifierTask = getReactorNextElement(instanceFieldModifierTaskReactor)) {
			
		var instance = getFieldModifierTaskInstance(fieldModifierTask);
		var fieldName = getFieldModifierTaskFieldName(fieldModifierTask);
		var targetValue = getFieldModifierTaskTargetValue(fieldModifierTask);
		var currentTick = getFieldModifierTaskCurrentTick(fieldModifierTask) + 1;
		var factorValue = getFieldModifierTaskFactorValue(fieldModifierTask);
		var sourceValue = getInstanceVariable(instance, fieldName);
		
		if (isUndefined(sourceValue)) {
			removeReactorElement(instanceFieldModifierTaskReactor);
			continue;
		}
		
		if (!instanceVariableExists(instance, fieldName)) {
			throwException(
				createException(
					NotANumberException,
					stringParams("Field doesn't exists. { \"fieldName\": \"{0}\", \"className\": \"{1}\"}", 
						fieldName, getInstanceClassName(instance))
				)
			);
		}
		
		if (!isNumber(sourceValue)) {
			throwException(
				createException(
					NotANumberException,
					stringParams("Field isn't a number. { \"fieldName\": \"{0}\", \"className\": \"{1}\"}", 
						fieldName, getInstanceClassName(instance))
				)
			);
			
		}
		
		var exception = catchException();
		if (isOptionalPresent(exception)) {
			removeReactorElement(instanceFieldModifierTaskReactor);
			continue;		
		}
				
		///@todo timer
		///@todo deltaTime
		setFieldModifierTaskCurrentTick(fieldModifierTask, currentTick);
		
		if (currentTick >= getFieldModifierTaskFactorFrequency(fieldModifierTask)) {	
			var currentModifierDirection = sign(targetValue - sourceValue);
			
			setInstanceVariable(instance, fieldName, sourceValue + currentModifierDirection * factorValue);
			setFieldModifierTaskCurrentTick(fieldModifierTask, 0);
			
			if (currentModifierDirection != sign(targetValue - getInstanceVariable(instance, fieldName))) {
				setInstanceVariable(instance, fieldName, targetValue);
				removeReactorElement(instanceFieldModifierTaskReactor);
			}
		}		
	}
	resolveReactor(instanceFieldModifierTaskReactor);
	#endregion
	
