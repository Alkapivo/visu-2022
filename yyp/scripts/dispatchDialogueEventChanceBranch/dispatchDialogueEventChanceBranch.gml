///@function dispatchDialogueEventChanceBranch(dialogueContext, dialogueEvent)
///@description Handler.
///@param {DialogueContext} dialogueContext
///@param {DialogueEvent} dialogueEvent
///@throws {DialogueManagerException|NotImplementedException}
function dispatchDialogueEventChanceBranch(argument0, argument1) {

		var dialogueContext = argument0;
		var dialogueEvent = argument1;
	
		var type = getDialogueEventType(dialogueEvent);
		var data = getDialogueEventData(dialogueEvent);
	
		var dialogue = getDialogueContextDialogue(dialogueContext);
		var dialogueNodeId = getValueFromArrayMap(data, "nodeId");
		var dialogueNode = fetchDialogueNode(dialogue, dialogueNodeId);

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
	
		var firstBranch = dialogueBranches[? "1"];
		if (!isString(firstBranch)) {
		
			defaultDialgoueEventExceptionHandler(dialogueEvent);
			return;
		}
	
		var secondBranch = dialogueBranches[? "2"];
		if (!isString(secondBranch)) {
		
			defaultDialgoueEventExceptionHandler(dialogueEvent);
			return;
		}
	
		var firstChance = getDialogueNodeChance_1(dialogueNode);
		if (!isNumber(firstChance)) {
		
			defaultDialgoueEventExceptionHandler(dialogueEvent);
			return;
		}
	
		var secondChance = getDialogueNodeChance_1(dialogueNode);
		if (!isNumber(secondChance)) {
		
			defaultDialgoueEventExceptionHandler(dialogueEvent);
			return;
		}
	#endregion
	
		var result = irandom(firstChance + secondChance);
		if (result <= firstChance) {
		
			var nextNodeId = firstBranch;
			var gotoEventData = createArrayMap(
				[ "nodeId" ],
				[ nextNodeId ]
			);
		
			var gotoEvent = createDialogueEvent(DialogueEventType_GOTO_NODE, gotoEventData);
			sendDialogueEvent(gotoEvent);
		} else {
		
			var nextNodeId = secondBranch;
			var gotoEventData = createArrayMap(
				[ "nodeId" ],
				[ nextNodeId ]
			);
		
			var gotoEvent = createDialogueEvent(DialogueEventType_GOTO_NODE, gotoEventData);
			sendDialogueEvent(gotoEvent);
		}
	



}
