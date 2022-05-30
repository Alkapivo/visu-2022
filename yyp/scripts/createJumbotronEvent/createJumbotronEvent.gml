///@function createJumbotronEvent(message, handlerName, duration)
///@description Constructor for JumbotronEvent entity.
///@param {String} message
///@param {String} handlerName
///@param {Number} duration
///@return {JumbotronEvent} jumbotronEvent 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.583Z}

function createJumbotronEvent(message, handlerName, duration) {

	var jumbotronEvent = createEntity(JumbotronEvent);

	setJumbotronEventMessage(jumbotronEvent, assertNoOptional(message));
	setJumbotronEventHandlerName(jumbotronEvent, assertNoOptional(handlerName));
	setJumbotronEventDuration(jumbotronEvent, assertNoOptional(duration));

	return jumbotronEvent;
	
}
