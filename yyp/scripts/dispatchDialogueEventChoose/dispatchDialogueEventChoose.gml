///@function dispatchDialogueEventChoose(dialogueContext, dialogueEvent)
///@description Handler.
///@param {DialogueContext} dialogueContext
///@param {DialogueEvent} dialogueEvent
///@throws {DialogueManagerException|NotImplementedException}
function dispatchDialogueEventChoose(argument0, argument1) {

		var dialogueContext = argument0;
		var dialogueEvent = argument1;
	
		var type = getDialogueEventType(dialogueEvent);
		var data = getDialogueEventData(dialogueEvent);
	
		var dialogue = getDialogueContextDialogue(dialogueContext);
		var dialogueNodeId = getDialogueContextCurrentNode(dialogueContext);
		var dialogueNode = fetchDialogueNode(dialogue, dialogueNodeId);
		var dialogueNodeChoices = getDialogueNodeChoices(dialogueNode);
		var choicePointer = getValueFromArrayMap(data, "choicePointer");
	
	#region Validation
		if (!isOptionalPresent(dialogueNode)) {
			defaultDialgoueEventExceptionHandler(dialogueEvent);
			return;
		}
	
		if (!isArray(dialogueNodeChoices)) {
			defaultDialgoueEventExceptionHandler(dialogueEvent);
			return;
		}
	
		var dialogueNodeChoicesLength = getArrayLength(dialogueNodeChoices);
		if (choicePointer >= dialogueNodeChoicesLength) {
			defaultDialgoueEventExceptionHandler(dialogueEvent);
			return;
		}
	#endregion
	
	#region Resolve choices
		var choices = [];
		if (isArray(dialogueNodeChoices)) {
		
			var dialogueChoicesLength = getArrayLength(dialogueNodeChoices);
			for (var index = 0; index < dialogueChoicesLength; index++) {
			
				var dialogueChoice = dialogueNodeChoices[@ index];
				var choiceText = getDialogueChoiceText(dialogueChoice);
				var conditionData = getDialogueChoiceConditionData(dialogueChoice);
			
				if (isString(conditionData)) {
					var choiceOperations = fetchDialogueChoiceOperations(dialogueChoice);
				
					if (isOptionalPresent(choiceOperations)) {					
						var result = resolveDialogueOperations(choiceOperations);
				
						if (result) {
					
							pushArray(choices, dialogueChoice);
						}
				
						destroyDialogueOperations(choiceOperations);	
					}
				} else {
				
					pushArray(choices, dialogueChoice);
				}
			}
		}
	#endregion
	
		var dialogueChoice = getValueFromArray(choices, choicePointer);
		if (isEntity(dialogueChoice, DialogueChoice)) {
		
			var nextNodeId = getDialogueChoiceNextNode(dialogueChoice);
			var gotoEventData = createArrayMap(
				[ "nodeId" ],
				[ nextNodeId ]
			);
	
			var gotoEvent = createDialogueEvent(DialogueEventType_GOTO_NODE, gotoEventData);
			sendDialogueEvent(gotoEvent);
		} else {
	
			var endEvent = createDialogueEvent(DialogueEventType_END, createArrayMap());
			sendDialogueEvent(endEvent);
		}



}
