///@description 

	#region {Pipeline<DialogueEvent>} dialogueEventPipeline
	for (var dialogueEvent = getPipelineFirstElement(dialogueEventPipeline);
		 iteratorFinish(dialogueEvent);
		 dialogueEvent = getPipelineNextElement(dialogueEventPipeline)) {
	
		var type = getDialogueEventType(dialogueEvent);
		var data = getDialogueEventData(dialogueEvent);
		
		var dispatcher = fetchDialogueEventDispatcher(dialogueEvent);
		
		runScript(dispatcher, currentDialogueContext, dialogueEvent);
		
		var exception = catchException();
		if (isOptionalPresent(exception)) {
			break;	
		}
	}
	#endregion
	
	dialogueContextHandler(currentDialogueContext, currentDialogueDisplayContext);
	
