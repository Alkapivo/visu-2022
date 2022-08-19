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
