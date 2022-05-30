///@function createDialogueChoice(nextNode, text, conditionData)
///@description Constructor for DialogueChoice entity.
///@param {String} nextNode
///@param {String} text
///@param {Optional<String>} conditionData
///@return {DialogueChoice} dialogueChoice 
///@throws {Exception}
///@generated {2021-05-01T23:49:39.510Z}

function createDialogueChoice(nextNode, text, conditionData) {

	var dialogueChoice = createEntity(DialogueChoice);

	setDialogueChoiceNextNode(dialogueChoice, assertNoOptional(nextNode));
	setDialogueChoiceText(dialogueChoice, assertNoOptional(text));
	setDialogueChoiceConditionData(dialogueChoice, conditionData);

	return dialogueChoice;
	
}
