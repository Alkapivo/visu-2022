///@function createJumbotronEvent(message, handlerName, duration)
///@description Constructor for JumbotronEvent entity.
///@param {String} message
///@param {String} handlerName
///@param {Number} duration
///@return {JumbotronEvent} jumbotronEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.641Z}

function createJumbotronEvent(message, handlerName, duration) {

	var jumbotronEvent = createEntity(JumbotronEvent);

	setJumbotronEventMessage(jumbotronEvent, assertNoOptional(message));
	setJumbotronEventHandlerName(jumbotronEvent, assertNoOptional(handlerName));
	setJumbotronEventDuration(jumbotronEvent, assertNoOptional(duration));

	return jumbotronEvent;
	
}
