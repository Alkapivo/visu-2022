///@function dialogueActionSetMobStatisticResistanceHandler(data)
///@description Handler.
///@param {Map<String::Object>} data
///@return {Booolean} result
function dialogueActionSetMobStatisticResistanceHandler(argument0) {

		var data = argument0;
	
		var mobStatistic = getMobStatistic(PlayerContext);
		if (isEntity(mobStatistic, MobStatistic)) {
	
			var resistanceType = data[? "resistance"];
			var value = data[? "value"];
		
			if (isNumber(value)) {
			
				switch (resistanceType) {
				
					case DamageType_PHYSICIAL_MELE:
					
						var mobTypeResistance = getMobResistanceTypeResistance(getMobStatisticResistance(mobStatistic));
						setMobTypeResistancePhysicialMele(mobTypeResistance, value);
					    break;
					case DamageType_PHYSICIAL_DISTANCE:

						var mobTypeResistance = getMobResistanceTypeResistance(getMobStatisticResistance(mobStatistic));
						setMobTypeResistancePhysicialDistance(mobTypeResistance, value);
					    break;
					case DamageType_EXPLOSION:

						var mobTypeResistance = getMobResistanceTypeResistance(getMobStatisticResistance(mobStatistic));
						setMobTypeResistanceExplosion(mobTypeResistance, value);
					    break;
					case DamageType_TELESTARION:

						var mobTypeResistance = getMobResistanceTypeResistance(getMobStatisticResistance(mobStatistic));
						setMobTypeResistanceTelestarion(mobTypeResistance, value);
					    break;
					case DamageEffectType_PHYSICIAL_BLEEDING:

						var mobEffectResistance = getMobResistanceEffectResistance(getMobStatisticResistance(mobStatistic));
						setMobEffectResistancePhysicialBleeding(mobEffectResistance, value)
					    break;
					case DamageEffectType_FIRE_BLEEDING:

						var mobEffectResistance = getMobResistanceEffectResistance(getMobStatisticResistance(mobStatistic));
						setMobEffectResistanceFireBleeding(mobEffectResistance, value)
					    break;
					case DamageEffectType_POISON_BLEEDING:

						var mobEffectResistance = getMobResistanceEffectResistance(getMobStatisticResistance(mobStatistic));
						setMobEffectResistancePoisonBleeding(mobEffectResistance, value)
					    break;
					case DamageEffectType_TELESTARION_BLEEDING:

						 var mobEffectResistance = getMobResistanceEffectResistance(getMobStatisticResistance(mobStatistic));
						setMobEffectResistanceTelestarionBleeding(mobEffectResistance, value)
					    break;
				}
			}
		}
	
		return true;
	
	


}
