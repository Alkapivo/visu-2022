///@function destroyShroomEmitter(shroomEmitter)
///@description Destroy ShroomEmitter entity.
///@param {ShroomEmitter} shroomEmitter
///@throws {Exception}
///@generated {2022-08-18T22:24:59.804Z}

function destroyShroomEmitter(shroomEmitter) {


	
	var timer = getShroomEmitterTimer(shroomEmitter);
	var positionBegin = getShroomEmitterPositionBegin(shroomEmitter);
	var positionEnd = getShroomEmitterPositionEnd(shroomEmitter);
	var duration = getShroomEmitterDuration(shroomEmitter);
	var amount = getShroomEmitterAmount(shroomEmitter);
	var interval = getShroomEmitterInterval(shroomEmitter);
	var templates = getShroomEmitterTemplates(shroomEmitter);
	
	destroyPosition(positionBegin);
	setShroomEmitterPositionBegin(shroomEmitter, null);
	
	destroyPosition(positionEnd);
	setShroomEmitterPositionEnd(shroomEmitter, null);
	
	for (var index = 0; index < getArrayLength(templates); index++) {
		var entity = templates[@ index];
		destroyShroomTemplate(entity);
	}
	setShroomEmitterTemplates(shroomEmitter, null);
	

	
}
