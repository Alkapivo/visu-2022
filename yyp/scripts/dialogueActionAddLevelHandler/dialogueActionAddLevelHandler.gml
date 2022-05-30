///@function dialogueActionAddLevel(data)
///@description Handler.
///@param {Map<String::Object>} data
///@return {Booolean} result
function dialogueActionAddLevelHandler(argument0) {

		var data = argument0;
	
		var mobStatistic = getMobStatistic(PlayerContext);
		if (isEntity(mobStatistic, MobStatistic)) {
	
			var statisticType = data[? "statistic"];
			var level = data[? "value"];
			if (isNumber(level)) {

			#region Get {Statistic} statistic | {Integer} experience 
				var statistic = createEmptyOptional();
				var experience = 0;
				switch (statisticType) {
				
					case "level":
					
						var statistic = getMobStatisticLevel(mobStatistic);
						var currentLevel = getStatisticLevel(statistic);
						var nextLevel = level + currentLevel;
						experience = fetchLevelMinExperience(nextLevel);
						break;
					case "fighting":
			
						var statistic = getMobDamageStatisticFighting(getMobStatisticDamageStatistic(mobStatistic));
						var currentLevel = getStatisticLevel(statistic);
						var nextLevel = level + currentLevel;
						experience = fetchFightingMinExperience(nextLevel);
						break;
					case "defence":
			
						var statistic = getMobDamageStatisticDefence(getMobStatisticDamageStatistic(mobStatistic));
						var currentLevel = getStatisticLevel(statistic);
						var nextLevel = level + currentLevel;
						experience = fetchDefenceMinExperience(nextLevel);
						break;
					case "accuracy":
			
						var statistic = getMobDamageStatisticAccuracy(getMobStatisticDamageStatistic(mobStatistic));
						var currentLevel = getStatisticLevel(statistic);
						var nextLevel = level + currentLevel;
						experience = fetchAccuracyMinExperience(nextLevel);
						break;
				}
			#endregion
		
				if ((isEntity(statistic, Statistic)) &&
					(isNumber(level))) {
		
					setStatisticLevel(statistic, nextLevel);
					setStatisticExperience(statistic, experience);
				}
			}
		}
	
		return true;


}
