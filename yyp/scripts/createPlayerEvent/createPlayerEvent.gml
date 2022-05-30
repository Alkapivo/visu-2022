///@function createPlayerEvent(fields)
///@description Constructor for PlayerEvent entity.
///@param {Map<String::any>} fields
///@return {PlayerEvent} playerEvent 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.668Z}

function createPlayerEvent(fields) {

	var playerEvent = createEntity(PlayerEvent);

	setPlayerEventFields(playerEvent, assertNoOptional(fields));

	return playerEvent;
	
}
