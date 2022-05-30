///@function destroyPlayerEvent(playerEvent)
///@description Destroy PlayerEvent entity.
///@param {PlayerEvent} playerEvent
///@throws {Exception}
///@generated {2021-08-25T13:56:53.669Z}

function destroyPlayerEvent(playerEvent) {


	
	var fields = getPlayerEventFields(playerEvent);
	
	destroyDataStructure(fields, Map, "Unable to destroy Map fields in PlayerEvent");
	setPlayerEventFields(playerEvent, null);
	

	
}
