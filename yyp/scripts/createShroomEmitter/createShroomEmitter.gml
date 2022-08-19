///@function createShroomEmitter(timer, positionBegin, positionEnd, duration, amount, interval, templates)
///@description Constructor for ShroomEmitter entity.
///@param {Number} timer
///@param {Position} positionBegin
///@param {Position} positionEnd
///@param {Number} duration
///@param {Integer} amount
///@param {Number} interval
///@param {ShroomTemplate[]} templates
///@return {ShroomEmitter} shroomEmitter 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.804Z}

function createShroomEmitter(timer, positionBegin, positionEnd, duration, amount, interval, templates) {

	var shroomEmitter = createEntity(ShroomEmitter);

	setShroomEmitterTimer(shroomEmitter, assertNoOptional(timer));
	setShroomEmitterPositionBegin(shroomEmitter, assertNoOptional(positionBegin));
	setShroomEmitterPositionEnd(shroomEmitter, assertNoOptional(positionEnd));
	setShroomEmitterDuration(shroomEmitter, assertNoOptional(duration));
	setShroomEmitterAmount(shroomEmitter, assertNoOptional(amount));
	setShroomEmitterInterval(shroomEmitter, assertNoOptional(interval));
	setShroomEmitterTemplates(shroomEmitter, assertNoOptional(templates));

	return shroomEmitter;
	
}
