///@function fetchDialogue(dialogueId)
///@description Getter.
///@param {String} dialogueId
///@return {Optional<Dialogue>} dialogue
///@throws {DialogueManagerException}
function fetchDialogue(argument0) {

		var dialogueId = argument0;
	
		var dialogue = findInRepositoryById(getDialogueRepository(), dialogueId);
		if (!isEntity(dialogue, Dialogue)) {
			throwException(
				createException(
					DialogueManagerException,
					stringParams("Dialogue \"{0}\" wasn't found", dialogueId),
				)
			);
			return createEmptyOptional();
		}
	
		return dialogue;
	



}
