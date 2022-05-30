///@function fetchDialogueNodeType(dialogueNode)
///@description Determine DialogueNodeType from dialogueNode.
///@return {DialogueNodeType} dialogueNodeType
function fetchDialogueNodeType(argument0) {

		var dialogueNode = argument0;
	
		var title = getDialogueNodeTitle(dialogueNode);
		if ((isString(title)) && 
			(arrayContain(DialogueNodeTypeFields, title))) {
		
			return title;
		} else {
	
			var hasAuthor = isOptionalPresent(getDialogueNodeAuthor(dialogueNode));
			var hasBranches = isDataStructure(getDialogueNodeBranches(dialogueNode), Map);
			var hasPossibilities = isNumber(getDialogueNodePossibilities(dialogueNode));
			var hasChances = isNumber(getDialogueNodeChance_1(dialogueNode)) && isNumber(getDialogueNodeChance_2(dialogueNode));
	
			var dialogueNodeType = DialogueNodeType_EXECUTE;
			if (hasAuthor) {
	
				dialogueNodeType = DialogueNodeType_MESSAGE;
			} else {
			
				if (hasBranches) {
	
					dialogueNodeType = DialogueNodeType_CONDITION_BRANCH;
	
					if (hasPossibilities) {
			
						dialogueNodeType = DialogueNodeType_RANDOM_BRANCH;
					}
			
					if (hasChances) {
				
						dialogueNodeType = DialogueNodeType_CHANCE_BRANCH;
					}
				}
			}
	
			return dialogueNodeType;
		}
	



}
