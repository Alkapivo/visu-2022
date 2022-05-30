///@function fetchDialogueNode(dialogue, nodeId)
///@description Getter.
///@param {Dialogue}
///@param {String}
///@return {Optional<DialogueEvent>}
///@throws {DialogueManagerException}
function fetchDialogueNode(argument0, argument1) {

		var dialogue = argument0;
		var nodeId = argument1;
	
		var dialogueId = getDialogueName(dialogue);
		var dialogueNodes = getDialogueNodes(dialogue);
		var dialogueNode = dialogueNodes[? nodeId];
	
		if (!isEntity(dialogueNode, DialogueNode)) {
			throwException(
				createException(
					DialogueManagerException,
					stringParams("Dialogue node wasn't found. { \"dialogueId\": \"{0}\", \"nodeId\": \"{1}\" }", dialogueId, nodeId)
				)
			);
			return createEmptyOptional();
		}
	
		return dialogueNode;
	



}
