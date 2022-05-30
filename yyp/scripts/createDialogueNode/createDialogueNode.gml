///@function createDialogueNode(author, nextNode, text, action, choices, branches, possibilities, chance_1, chance_2, title)
///@description Constructor for DialogueNode entity.
///@param {Optional<String>} author
///@param {Optional<String>} nextNode
///@param {Optional<String>} text
///@param {Optional<String>} action
///@param {Optional<DialogueChoice[]>} choices
///@param {Optional<Map<String::String>>} branches
///@param {Optional<Integer>} possibilities
///@param {Optional<Number>} chance_1
///@param {Optional<Number>} chance_2
///@param {Optional<DialogueNodeType>} title
///@return {DialogueNode} dialogueNode 
///@throws {Exception}
///@generated {2021-05-01T23:49:39.458Z}

function createDialogueNode(author, nextNode, text, action, choices, branches, possibilities, chance_1, chance_2, title) {

	var dialogueNode = createEntity(DialogueNode);

	setDialogueNodeAuthor(dialogueNode, author);
	setDialogueNodeNextNode(dialogueNode, nextNode);
	setDialogueNodeText(dialogueNode, text);
	setDialogueNodeAction(dialogueNode, action);
	setDialogueNodeChoices(dialogueNode, choices);
	setDialogueNodeBranches(dialogueNode, branches);
	setDialogueNodePossibilities(dialogueNode, possibilities);
	setDialogueNodeChance_1(dialogueNode, chance_1);
	setDialogueNodeChance_2(dialogueNode, chance_2);
	setDialogueNodeTitle(dialogueNode, title);

	return dialogueNode;
	
}
