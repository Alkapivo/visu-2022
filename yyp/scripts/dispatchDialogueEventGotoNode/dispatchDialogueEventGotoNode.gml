///@function dispatchDialogueEventGotoNode(dialogueContext, dialogueEvent)
///@param {DialogueContext} dialogueContext
///@param {DialogueEvent} dialogueEvent
///@throws {DialogueManagerException|NotImplementedException}
function dispatchDialogueEventGotoNode(dialogueContext, dialogueEvent) {
	
	var type = getDialogueEventType(dialogueEvent);
	var data = getDialogueEventData(dialogueEvent);
		
	var dialogue = getDialogueContextDialogue(dialogueContext);
	var nodeId = getValueFromArrayMap(data, "nodeId");
	var dialogueNode = fetchDialogueNode(dialogue, nodeId);
	
	#region Validation
	if (!isEntity(dialogueNode, DialogueNode)) {
		
		defaultDialgoueEventExceptionHandler(dialogueEvent);
		return;
		}
	#endregion
	
	var dialogueNodeType = fetchDialogueNodeType(dialogueNode);
	switch (dialogueNodeType) {
		
		#region DialogueNodeType_EXECUTE
		case DialogueNodeType_EXECUTE:
			var executeEventData = createArrayMap(
				[ "nodeId" ],
				[ nodeId ] 
			);
			var executeEvent = createDialogueEvent(DialogueEventType_EXECUTE, executeEventData);
			sendDialogueEvent(executeEvent);
			break;
	#endregion
		
		#region DialogueNodeType_MESSAGE
		case DialogueNodeType_MESSAGE:
			var messageEventData = createArrayMap(
				[ "nodeId" ], 
				[ nodeId ]
			);
			var messageEvent = createDialogueEvent(DialogueEventType_MESSAGE, messageEventData);
			sendDialogueEvent(messageEvent);
			break;
	#endregion
		
		#region DialogueNodeType_CONDITION_BRANCH
		case DialogueNodeType_CONDITION_BRANCH:
			var conditionBranchEventData = createArrayMap(
				[ "nodeId" ],
				[ nodeId ] 
			);
			var conditionBranchEvent = createDialogueEvent(DialogueEventType_CONDITION_BRANCH, conditionBranchEventData);
			sendDialogueEvent(conditionBranchEvent);
			break;
	#endregion
		
		#region DialogueNodeType_CHANCE_BRANCH
		case DialogueNodeType_CHANCE_BRANCH:
			var chanceBranchEventData = createArrayMap(
				[ "nodeId" ],
				[ nodeId ] 
			);
			var chanceBranchEvent = createDialogueEvent(DialogueEventType_CHANCE_BRANCH, chanceBranchEventData);
			sendDialogueEvent(chanceBranchEvent);
			break;
	#endregion
		
		#region DialogueNodeType_RANDOM_BRANCH
		case DialogueNodeType_RANDOM_BRANCH:
			var randomBranchEventData = createArrayMap(
				[ "nodeId" ],
				[ nodeId ] 
			);
			var randomBranchEvent = createDialogueEvent(DialogueEventType_RANDOM_BRANCH, randomBranchEventData);
			sendDialogueEvent(randomBranchEvent);
			break;
	#endregion
		
		default:
			var dialogueId = getDialogueName(dialogue);
			throwException(
				createException(
					NotImplementedException,
					stringParams("Found not implemented DialogueNodeType. { \"dialogueId\": \"{0}\", \"nodeId\": \"{1}\", \"type\": \"{3}\" }", dialogueId, nodeId, dialogueNodeType)
				)
			);
			break;
	}
	
	setDialogueContextCurrentNode(dialogueContext, nodeId);
}
