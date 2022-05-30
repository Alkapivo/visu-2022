///@function dispatchDialogueEventMessage(dialogueContext, dialogueEvent)
///@description Handler.
///@param {DialogueContext} dialogueContext
///@param {DialogueEvent} dialogueEvent
///@throws {DialogueManagerException|NotImplementedException}
function dispatchDialogueEventMessage(dialogueContext, dialogueEvent) {

	var type = getDialogueEventType(dialogueEvent);
	var data = getDialogueEventData(dialogueEvent);
	
	var dialogue = getDialogueContextDialogue(dialogueContext);
	var dialogueNodeId = getValueFromArrayMap(data, "nodeId");
	var dialogueNode = fetchDialogueNode(dialogue, dialogueNodeId);
	var dialogueDisplayContext = getDialogueDisplayContext();
	
	#region Validation
	if (!isEntity(dialogueNode, DialogueNode)) {
		defaultDialgoueEventExceptionHandler(dialogueEvent);
		return;
	}
	#endregion
	
	var author = getDialogueNodeAuthor(dialogueNode);
	var text = getDialogueNodeText(dialogueNode);
	text = isString(text) ? text : "";
	var textLength = string_length(text);
	var textPointer = 0;
	var choices = createEmptyOptional();
	var choicePointer = createEmptyOptional();
	
	#region Resolve choices
	var dialogueChoices = getDialogueNodeChoices(dialogueNode);
	if (isArray(dialogueChoices)) {
		choices = [];
		var dialogueChoicesLength = getArrayLength(dialogueChoices);
		for (var index = 0; index < dialogueChoicesLength; index++) {
			
			var dialogueChoice = dialogueChoices[@ index];
			var choiceText = getDialogueChoiceText(dialogueChoice);
			var conditionData = getDialogueChoiceConditionData(dialogueChoice);
			
			if (isString(conditionData)) {
				var choiceOperations = fetchDialogueChoiceOperations(dialogueChoice);
				
				if (isOptionalPresent(choiceOperations)) {					
					var result = resolveDialogueOperations(choiceOperations);
				
					if (result) {
					
						var dialogueDisplayChoice = createDialogueDisplayChoice(index, choiceText);
						pushArray(choices, dialogueDisplayChoice);
					}
				
					destroyDialogueOperations(choiceOperations);	
				}
			} else {
				
				var dialogueDisplayChoice = createDialogueDisplayChoice(index, choiceText);
				pushArray(choices, dialogueDisplayChoice);
			}
		}
	}
	#endregion
	
	var dialogueDisplayContext = createDialogueDisplayContext(
		author,
		text,
		textLength,
		textPointer,
		choices,
		choicePointer
	);
	setDialogueDisplayContext(dialogueDisplayContext);
}
