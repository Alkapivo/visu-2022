///@function dispatchDialogueEventRandomBranch(dialogueContext, dialogueEvent)
///@description Handler.
///@param {DialogueContext} dialogueContext
///@param {DialogueEvent} dialogueEvent
///@throws {DialogueManagerException|NotImplementedException}
function dispatchDialogueEventRandomBranch(argument0, argument1) {

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
	
		var possibilities = getDialogueNodePossibilities(dialogueNode);
		if (!isNumber(possibilities)) {
		
			defaultDialgoueEventExceptionHandler(dialogueEvent);
			return;
		}
	#endregion
	
		var result = resolveDialogueOperations(dialogueOperations);
		var branchKey = string(irandom(possibilities - 1));
		var nextNodeId = getFromMap(dialogueBranches, branchKey);
		var gotoEventData = createArrayMap(
			[ "nodeId" ],
			[ nextNodeId ]
		);
		
		var gotoEvent = createDialogueEvent(DialogueEventType_GOTO_NODE, gotoEventData);
		sendDialogueEvent(gotoEvent);
	



}
