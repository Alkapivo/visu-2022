///@function dialogueActionAddExperience(data)
///@description Handler.
///@param {Map<String::Object>} data
///@return {Booolean} result
function dialogueActionAddExperienceHandler(argument0) {

		var data = argument0;
	
		var mobStatistic = getMobStatistic(PlayerContext);
		if (isEntity(mobStatistic, MobStatistic)) {
	
			var statisticType = data[? "statistic"];
			var value = data[? "value"];
			switch (statisticType) {
				case "level":
				
					var statistic = getMobStatisticLevel(mobStatistic);
					break;
				case "fighting":
			
					var statistic = getMobDamageStatisticFighting(getMobStatisticDamageStatistic(mobStatistic));
					break;
				case "defence":
			
					var statistic = getMobDamageStatisticDefence(getMobStatisticDamageStatistic(mobStatistic));
					break;
				case "accuracy":
			
					var statistic = getMobDamageStatisticAccuracy(getMobStatisticDamageStatistic(mobStatistic));
					break;
			}
		
			if ((isEntity(statistic, Statistic)) &&
				(isNumber(value))) {
			
				setStatisticExperience(statistic, getStatisticExperience(statistic) + value);
			}
		}
	
		return true;



}
