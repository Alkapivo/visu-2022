///@function destroyPlayerEvent(playerEvent)
///@description Destroy PlayerEvent entity.
///@param {PlayerEvent} playerEvent
///@throws {Exception}
///@generated {2022-08-18T22:24:59.723Z}

function destroyPlayerEvent(playerEvent) {


	
	var fields = getPlayerEventFields(playerEvent);
	
	destroyDataStructure(fields, Map, "Unable to destroy Map fields in PlayerEvent");
	setPlayerEventFields(playerEvent, null);
	

	
}
