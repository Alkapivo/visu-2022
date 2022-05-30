///@function createDialogueManager(layerId)
///@description Constructor.
///@param {Layer} [layerId]
///@return {DialogueManager} dialogueManager
function createDialogueManager() {

		var class = DialogueManager;
		var instanceLayer = argument_count > 0 ? argument[0] : getSystemLayer();
	
		var instance = defaultContextInstanceConstructor(class, "DialogueManager", instanceLayer);
	
		return instance;
	



}
