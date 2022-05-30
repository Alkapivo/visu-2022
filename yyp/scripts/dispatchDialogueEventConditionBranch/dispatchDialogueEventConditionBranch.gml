///@function dispatchDialogueEventConditionBranch(dialogueContext, dialogueEvent)
///@description Handler.
///@param {DialogueContext} dialogueContext
///@param {DialogueEvent} dialogueEvent
///@throws {DialogueManagerException|NotImplementedException}
function dispatchDialogueEventConditionBranch(argument0, argument1) {

		var dialogueContext = argument0;
		var dialogueEvent = argument1;
	
		var type = getDialogueEventType(dialogueEvent);
		var data = getDialogueEventData(dialogueEvent);
	
		var dialogue = getDialogueContextDialogue(dialogueContext);
		var dialogueNodeId = getValueFromArrayMap(data, "nodeId");
		var dialogueNode = fetchDialogueNode(dialogue, dialogueNodeId);

		var dialogueOperations = createEmptyOptional();
		var dialogueBranches = createEmptyOptional();
	
	#region Validation
		if (!isOptionalPresent(dialogueNode)) {
		
			defaultDialgoueEventExceptionHandler(dialogueEvent);
			return;
		}
	
		dialogueBranches = getDialogueNodeBranches(dialogueNode);
		if (!isDataStructure(dialogueBranches, Map)) {
		
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
		if (result) {
		
			var nextNodeId = getFromMap(dialogueBranches, "truthy");
			var asd = getMapKeys(dialogueBranches);
			var gotoEventData = createArrayMap(
				[ "nodeId" ],
				[ nextNodeId ]
			);
		
			var gotoEvent = createDialogueEvent(DialogueEventType_GOTO_NODE, gotoEventData);
			sendDialogueEvent(gotoEvent);
		} else {
		
			var nextNodeId = getFromMap(dialogueBranches, "falsy");
			var asd = getMapKeys(dialogueBranches);
			var gotoEventData = createArrayMap(
				[ "nodeId" ],
				[ nextNodeId ]
			);
		
			var gotoEvent = createDialogueEvent(DialogueEventType_GOTO_NODE, gotoEventData);
			sendDialogueEvent(gotoEvent);
		}
	
		destroyDialogueOperations(dialogueOperations);
	



}
