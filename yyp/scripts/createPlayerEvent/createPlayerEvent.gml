///@function createPlayerEvent(fields)
///@description Constructor for PlayerEvent entity.
///@param {Map<String::any>} fields
///@return {PlayerEvent} playerEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.723Z}

function createPlayerEvent(fields) {

	var playerEvent = createEntity(PlayerEvent);

	setPlayerEventFields(playerEvent, assertNoOptional(fields));

	return playerEvent;
	
}
