///@function dialogueActionStartQuestHandler(data)
///@description Handler.
///@param {Map<String::Object>} data
///@return {Booolean} result
function dialogueActionStartQuestHandler(argument0) {

		var data = argument0;
	
		var result = false;
	
		if (isDataStructure(data, Map)) {
			var questId = getFromMap(data, "questId");
			result = assignQuestEntry(questId);
		}
	
		return result;
	



}
