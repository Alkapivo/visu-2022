///@function deserializeShroom(jsonString)
///@description Deserialize Shroom from JSON String to Shroom entity.
///@param {String} jsonString
///@return {Shroom} shroom 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.781Z}

function deserializeShroom(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var gridElement = assertNoOptional(getJsonObjectFieldValue(jsonObject, "gridElement", Entity, "GridElement"));
	var radius = assertNoOptional(getJsonObjectFieldValue(jsonObject, "radius"));
	var speedValue = assertNoOptional(getJsonObjectFieldValue(jsonObject, "speedValue"));
	var state = assertNoOptional(getJsonObjectFieldValue(jsonObject, "state", Map));
	var text = getJsonObjectFieldValue(jsonObject, "text");
	var updateHandler = assertNoOptional(getJsonObjectFieldValue(jsonObject, "updateHandler"));
	var bulletCollisionHandler = getJsonObjectFieldValue(jsonObject, "bulletCollisionHandler");
	var playerCollisionHandler = getJsonObjectFieldValue(jsonObject, "playerCollisionHandler");

	destroyJsonObject(jsonObject);
	
	return createShroom(gridElement, radius, speedValue, state, text, updateHandler, bulletCollisionHandler, playerCollisionHandler);
	
}
