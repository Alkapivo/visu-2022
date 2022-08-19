///@function deserializeVisuPlayer(jsonString)
///@description Deserialize VisuPlayer from JSON String to VisuPlayer entity.
///@param {String} jsonString
///@return {VisuPlayer} visuPlayer 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.694Z}

function deserializeVisuPlayer(jsonString) {

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
	
	return createVisuPlayer(name, gridElement, status, state, inputHandler, horizontalSpeed, verticalSpeed, collisionRadius);
	
}
