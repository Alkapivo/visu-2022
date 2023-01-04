///@description ShroomEmitterEvent entity

///@function createShroomEmitterEvent(duration, amount, interval, templates)
///@description Constructor for ShroomEmitterEvent entity.
///@param {Number} duration
///@param {Number} amount
///@param {Number} interval
///@param {ShroomTemplate[]} templates
///@return {ShroomEmitterEvent} shroomEmitterEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.896Z}

function createShroomEmitterEvent(duration, amount, interval, templates) {

	var shroomEmitterEvent = createEntity(ShroomEmitterEvent);

	setShroomEmitterEventDuration(shroomEmitterEvent, assertNoOptional(duration));
	setShroomEmitterEventAmount(shroomEmitterEvent, assertNoOptional(amount));
	setShroomEmitterEventInterval(shroomEmitterEvent, assertNoOptional(interval));
	setShroomEmitterEventTemplates(shroomEmitterEvent, assertNoOptional(templates));

	return shroomEmitterEvent;
	
}
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
///@function deserializeShroomEmitterEvent(jsonString)
///@description Deserialize ShroomEmitterEvent from JSON String to ShroomEmitterEvent entity.
///@param {String} jsonString
///@return {ShroomEmitterEvent} shroomEmitterEvent 
///@throws {Exception}
///@generated {2021-01-17T08:40:16.876Z}
///@override
function deserializeShroomEmitterEvent(argument0) {

		var jsonString = argument0;

		var tjsonObject = tj_decode(jsonString);

		var duration = getTJsonValue(tjsonObject, "duration");
		var amount = getTJsonValue(tjsonObject, "amount");
		var interval = getTJsonValue(tjsonObject, "interval");
	#region override Map<String::Object>[]
		var tjsonArray = getTJsonValue(tjsonObject, "templates");
		var templates = [];
		var dd = getArrayLength(tjsonArray);
		for (var index = 0; index < getArrayLength(tjsonArray); index++) {
			var tjsonMap = tjsonArray[index];
			var map = createMap();
			var keys = tj_keys(tjsonMap);
			for (var keyIndex = 0; keyIndex < getArrayLength(keys); keyIndex++) {
				var key = keys[keyIndex];
				var value = tj_get(tjsonMap, key);
				addToMap(map, key, value);
			}
			pushArray(templates, map);
		}
	#endregion

		return createShroomEmitterEvent(duration, amount, interval, templates);


}
///@function destroyShroomEmitterEvent(shroomEmitterEvent)
///@description Destroy ShroomEmitterEvent entity.
///@param {ShroomEmitterEvent} shroomEmitterEvent
///@generated {2019-10-30T21:37:02.012Z}
///@override
function destroyShroomEmitterEvent(argument0) {

		var shroomEmitterEvent = argument0;
	
		var templates = getShroomEmitterEventTemplates(shroomEmitterEvent);
	
	#region override Map<String::Object>[]
		for (var index = 0; index < getArrayLength(templates); index++) {
			var map = templates[index];
			destroyDataStructure(map, Map, "Unable to destroy Map templates in ShroomEmitterEvent");
		}
	#endregion
		setShroomEmitterEventTemplates(shroomEmitterEvent, null);
	



}
///@function getShroomEmitterEventAmount(shroomEmitterEvent)
///@description Getter.
///@param {ShroomEmitterEvent} shroomEmitterEvent
///@return {Number} amount 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.897Z}

function getShroomEmitterEventAmount(shroomEmitterEvent) {

	return shroomEmitterEvent[@ 1];
	
}
///@function getShroomEmitterEventDuration(shroomEmitterEvent)
///@description Getter.
///@param {ShroomEmitterEvent} shroomEmitterEvent
///@return {Number} duration 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.897Z}

function getShroomEmitterEventDuration(shroomEmitterEvent) {

	return shroomEmitterEvent[@ 0];
	
}
///@function getShroomEmitterEventInterval(shroomEmitterEvent)
///@description Getter.
///@param {ShroomEmitterEvent} shroomEmitterEvent
///@return {Number} interval 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.897Z}

function getShroomEmitterEventInterval(shroomEmitterEvent) {

	return shroomEmitterEvent[@ 2];
	
}
///@function getShroomEmitterEventTemplates(shroomEmitterEvent)
///@description Getter.
///@param {ShroomEmitterEvent} shroomEmitterEvent
///@return {ShroomTemplate[]} templates 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.897Z}

function getShroomEmitterEventTemplates(shroomEmitterEvent) {

	return shroomEmitterEvent[@ 3];
	
}
///@function setShroomEmitterEventAmount(shroomEmitterEvent, amount)
///@description Setter.
///@param {ShroomEmitterEvent} shroomEmitterEvent
///@param {Number} amount
///@throws {Exception}
///@generated {2022-08-18T22:24:59.897Z}

function setShroomEmitterEventAmount(shroomEmitterEvent, amount) {

	shroomEmitterEvent[@ 1] = amount;
	
}
///@function setShroomEmitterEventDuration(shroomEmitterEvent, duration)
///@description Setter.
///@param {ShroomEmitterEvent} shroomEmitterEvent
///@param {Number} duration
///@throws {Exception}
///@generated {2022-08-18T22:24:59.897Z}

function setShroomEmitterEventDuration(shroomEmitterEvent, duration) {

	shroomEmitterEvent[@ 0] = duration;
	
}
///@function setShroomEmitterEventInterval(shroomEmitterEvent, interval)
///@description Setter.
///@param {ShroomEmitterEvent} shroomEmitterEvent
///@param {Number} interval
///@throws {Exception}
///@generated {2022-08-18T22:24:59.897Z}

function setShroomEmitterEventInterval(shroomEmitterEvent, interval) {

	shroomEmitterEvent[@ 2] = interval;
	
}
///@function setShroomEmitterEventTemplates(shroomEmitterEvent, templates)
///@description Setter.
///@param {ShroomEmitterEvent} shroomEmitterEvent
///@param {ShroomTemplate[]} templates
///@throws {Exception}
///@generated {2022-08-18T22:24:59.897Z}

function setShroomEmitterEventTemplates(shroomEmitterEvent, templates) {

	shroomEmitterEvent[@ 3] = templates;
	
}
