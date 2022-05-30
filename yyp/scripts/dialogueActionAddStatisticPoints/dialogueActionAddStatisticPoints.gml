///@function dialogueActionAddStatisticPoints(data)
///@description Handler.
///@param {Map<String::Object>} data
///@return {Booolean} result
function dialogueActionAddStatisticPoints(argument0) {

		var data = argument0;
	
		var type = getFromMap(data, "type");
		var value = getFromMap(data, "value");
		var mobStatistic = getWorldMobStatistic(PlayerContext);	
		if (isEntity(mobStatistic, MobStatistic)) {
		
			switch (type) {
				case StatisticPointsType_HEALTH_POINTS:
			
					var statisticPoints = getMobStatisticHealthPoints(mobStatistic);
					var newValue = clamp(
						getStatisticPointsValue(statisticPoints) + value, 
						0, 
						getStatisticPointsMaxValue(statisticPoints)
					);
					setStatisticPointsValue(statisticPoints, newValue);
					break;
		
				case StatisticPointsType_TELESTARION:
			
					var statisticPoints = getMobStatisticTelestarionPoints(mobStatistic);
					var newValue = clamp(
						getStatisticPointsValue(statisticPoints) + value, 
						0, 
						getStatisticPointsMaxValue(statisticPoints)
					);
					setStatisticPointsValue(statisticPoints, newValue);
					break;
				
				case StatisticPointsType_HUNGER:
			
					var statisticPoints = getMobStatisticHungerPoints(mobStatistic);
					var newValue = clamp(
						getStatisticPointsValue(statisticPoints) + value, 
						0, 
						getStatisticPointsMaxValue(statisticPoints)
					);
					setStatisticPointsValue(statisticPoints, newValue);
					break;
			
				case StatisticPointsType_FUEL:
			
					var laternFuel = getPlayerLaternFuel();
					var laternFuelMax = getPlayerLaternFuelMax();
					var newValue = clamp(laternFuel + value, 0, laternFuelMax);
					setPlayerLaternFuel(PlayerContext, laternFuel);
					break;
			}
		}
	
		return true;
	



}
