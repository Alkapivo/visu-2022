///@function createGameEvent(time, type, entity)
///@description Constructor for GameEvent entity.
///@param {Number} time
///@param {String} type
///@param {any} entity
///@return {GameEvent} gameEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.582Z}

function createGameEvent(time, type, entity) {

	var gameEvent = createEntity(GameEvent);

	setGameEventTime(gameEvent, assertNoOptional(time));
	setGameEventType(gameEvent, assertNoOptional(type));
	setGameEventEntity(gameEvent, assertNoOptional(entity));

	return gameEvent;
	
}
