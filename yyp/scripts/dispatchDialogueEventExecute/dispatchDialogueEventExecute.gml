///@function dispatchDialogueEventExecute(dialogueContext, dialogueEvent)
///@description Handler.
///@param {DialogueContext} dialogueContext
///@param {DialogueEvent} dialogueEvent
///@throws {DialogueManagerException|NotImplementedException}
function dispatchDialogueEventExecute(argument0, argument1) {

		var dialogueContext = argument0;
		var dialogueEvent = argument1;
	
		var type = getDialogueEventType(dialogueEvent);
		var data = getDialogueEventData(dialogueEvent);
	
		var dialogue = getDialogueContextDialogue(dialogueContext);
		var dialogueNodeId = getValueFromArrayMap(data, "nodeId");
		var dialogueNode = fetchDialogueNode(dialogue, dialogueNodeId);

		var dialogueOperations = createEmptyOptional();
	
	#region Validation
		if (!isOptionalPresent(dialogueNode)) {
			defaultDialgoueEventExceptionHandler(dialogueEvent);
			return;
		}
	
		dialogueOperations = fetchDialogueOperations(dialogueNode);
		if (!isOptionalPresent(dialogueNode)) {
			defaultDialgoueEventExceptionHandler(dialogueEvent);
			return;
		}
	#endregion
	
		var result = resolveDialogueOperations(dialogueOperations);
	
		if (IsCutsceneMode) {
	
			var nextNodeId = getDialogueNodeNextNode(dialogueNode);
			CutsceneNextNodeId = nextNodeId;
		}
	
		if (result) {
		
			if ((!IsTradePanel) &&
				(!IsCutsceneMode)) {
		
				var nextNodeId = getDialogueNodeNextNode(dialogueNode);
				var gotoEventData = createArrayMap(
					[ "nodeId" ],
					[ nextNodeId ]
				);
		
				var gotoEvent = createDialogueEvent(DialogueEventType_GOTO_NODE, gotoEventData);
				sendDialogueEvent(gotoEvent);
			}
		} else {
		
			var endEvent = createDialogueEvent(DialogueEventType_END, createArrayMap());
			sendDialogueEvent(endEvent);
		}
	
		destroyDialogueOperations(dialogueOperations);
		catchException();
	



}
