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
