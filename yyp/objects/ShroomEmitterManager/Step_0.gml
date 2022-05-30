///@description

	#region ShroomEmitter Reactor
	var destroyShroomEmitters = [];
	var shroomEmitterSize = getListSize(shroomEmitters);
	for (var index = 0; index < shroomEmitterSize; index++) {
		
		var shroomEmitter = shroomEmitters[| index];
		
		#region Destroy emitter timer
		var duration = getShroomEmitterDuration(shroomEmitter)
		duration -= (1.0 / GAME_FPS) * getDeltaTimeValue();
		setShroomEmitterDuration(shroomEmitter, duration);
		if (duration <= 0.0) {
			destroyShroomEmitters = pushArray(destroyShroomEmitters, index);
			continue;
		}
		#endregion
		
		#region Spawn timer
		var timer = getShroomEmitterTimer(shroomEmitter)
		timer = incrementTimer(timer, getShroomEmitterInterval(shroomEmitter));
		setShroomEmitterTimer(shroomEmitter, timer);
		if (timer == 0.0) {
			var amount = getShroomEmitterAmount(shroomEmitter);
			var templates = getShroomEmitterTemplates(shroomEmitter);
			var positionBegin = getShroomEmitterPositionBegin(shroomEmitter);
			var positionEnd = getShroomEmitterPositionEnd(shroomEmitter);
			var nextTemplateIdx = getShroomEmitterNextTemplateIdx(shroomEmitter);
			var templatesCount = getArrayLength(templates);

			for (var index = 0; index < amount; index++) {
				if(nextTemplateIdx >=templatesCount){
					nextTemplateIdx = 0;
				}
				var template = templates[nextTemplateIdx];
				// var template = getRandomValueFromArray(templates);
				setShroomEmitterNextTemplateIdx(shroomEmitter, nextTemplateIdx + 1)
				
				var position = createPosition(
					clamp(positionBegin[0] + (random(((positionEnd[0] - positionBegin[0]) * 1000)) / 1000), 0.0, 1.0),
					clamp(positionBegin[1] + (random(((positionEnd[1] - positionBegin[1]) * 1000)) / 1000), 0.0, 1.0),
				)
				spawnShroom(template, position);
			}
		}
		#endregion
	}
	
	removeItemsFromList(shroomEmitters, destroyShroomEmitters, destroyShroomEmitter);
	#endregion
	
