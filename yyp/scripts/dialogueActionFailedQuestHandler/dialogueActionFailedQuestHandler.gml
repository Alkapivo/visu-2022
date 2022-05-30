///@function dialogueActionFailedQuestHandler(data)
///@description Handler.
///@param {Map<String::Object>} data
///@return {Booolean} result
function dialogueActionFailedQuestHandler(argument0) {

		var data = argument0;
	
		var questId = getFromMap(data, "questId");
		var questEntry = findQuestEntryById(questId);
		if (isEntity(questEntry, QuestEntry)) {
	
			applyQuestEntryReward(questEntry);
			finalizeQuest(questEntry);
		}
	
		return true;


}
