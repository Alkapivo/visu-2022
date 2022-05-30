///@description 

	super();
	
	destroyPipeline(dialogueEventPipeline);
	
	if (isEntity(dialogueMessagePipeline, Pipeline)) {
	
		destroyPipeline(dialogueMessagePipeline);
	}
	
	currentDialogueContext = null;
	
	currentDialogueDisplayContext = null;
