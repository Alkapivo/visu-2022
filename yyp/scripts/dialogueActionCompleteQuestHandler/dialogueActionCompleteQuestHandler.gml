///@function dialogueActionCompleteQuestHandler(data)
///@description Handler.
///@param {Map<String::Object>} data
///@return {Booolean} result
function dialogueActionCompleteQuestHandler(argument0) {

		var data = argument0;
	
		///@todo
		var questId = getFromMap(data, "questId");
		var questEntry = findQuestEntryById(questId);
		var isFatality = getFromMap(data, "isFatality");
		if (isEntity(questEntry, QuestEntry)) {
	
			if (isFatality == true) {
		
			#region Fail quest
				updateFact(stringParams("fact_{0}_finalized", questId), true);
				updateFact(stringParams("fact_{0}_failed", questId), true);
				setQuestEntryStatus(questEntry, QuestEntryState_FAILED);
				var jumbotronMessage = stringParams(
					"{0}\n{1}",
					fetchTranslation("jumbotron.quest.fail"),
					fetchTranslation(getFromMap(getQuestEntryState(questEntry), "displayName"))
				);
				sendSfxRequest(
					createTuple(
						asset_sfx_questcomplete, 
						createGenericEntity(
							JumbotronTask,
							createJumbotronTask(
								jumbotronMessage, 
								0.0, 
								2.1, 
								fa_middle, 
								c_red
							)
						)
					)
				);
			#endregion
			
			} else {
		
				applyQuestEntryReward(questEntry);
				finalizeQuest(questEntry);
			}
		}
	
		return true;
	



}
