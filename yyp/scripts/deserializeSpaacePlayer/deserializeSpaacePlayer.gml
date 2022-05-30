///@function deserializeSpaacePlayer(jsonString)
///@description Deserialize SpaacePlayer from JSON String to SpaacePlayer entity.
///@param {String} jsonString
///@return {SpaacePlayer} spaacePlayer 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.640Z}

function deserializeSpaacePlayer(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
	var gridElement = assertNoOptional(getJsonObjectFieldValue(jsonObject, "gridElement", Entity, "GridElement"));
	var status = assertNoOptional(getJsonObjectFieldValue(jsonObject, "status"));
	var state = assertNoOptional(getJsonObjectFieldValue(jsonObject, "state", Map));
	var inputHandler = assertNoOptional(getJsonObjectFieldValue(jsonObject, "inputHandler"));
	var horizontalSpeed = assertNoOptional(getJsonObjectFieldValue(jsonObject, "horizontalSpeed"));
	var verticalSpeed = assertNoOptional(getJsonObjectFieldValue(jsonObject, "verticalSpeed"));
	var collisionRadius = assertNoOptional(getJsonObjectFieldValue(jsonObject, "collisionRadius"));

	destroyJsonObject(jsonObject);
	
	return createSpaacePlayer(name, gridElement, status, state, inputHandler, horizontalSpeed, verticalSpeed, collisionRadius);
	
}
