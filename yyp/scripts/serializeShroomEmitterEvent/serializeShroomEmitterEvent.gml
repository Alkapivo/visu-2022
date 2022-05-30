///@function serializeShroomEmitterEvent(shroomEmitterEvent)
///@description Serialize ShroomEmitterEvent to JSON string.
///@param {ShroomEmitterEvent} shroomEmitterEvent
///@return {String} shroomEmitterEventJsonString 
///@throws {Exception}
///@generated {2021-01-17T08:44:05.593Z}
///@override
function serializeShroomEmitterEvent(argument0) {

		var shroomEmitterEvent = argument0;
		var tjsonObject = tj_object();

		tj_set(tjsonObject, "duration", getShroomEmitterEventDuration(shroomEmitterEvent));
		tj_set(tjsonObject, "amount", getShroomEmitterEventAmount(shroomEmitterEvent));
		tj_set(tjsonObject, "interval", getShroomEmitterEventInterval(shroomEmitterEvent));
	#region override Map<String::Object>[]
		var templates = getShroomEmitterEventTemplates(shroomEmitterEvent);
		var tjsonTemplates = [];
		for (var index = 0; index < getArrayLength(templates); index++) {
			var map = templates[index];
			var tjsonMap = convertMapToTJsonObject(map);
			pushArray(tjsonTemplates, tjsonMap);
		}
		tj_set(tjsonObject, "templates", tjsonTemplates);
	#endregion

		var shroomEmitterEventJsonString = tj_encode(tjsonObject);

		return shroomEmitterEventJsonString;



}
