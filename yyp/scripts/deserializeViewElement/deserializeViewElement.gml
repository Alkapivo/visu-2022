///@function deserializeViewElement(jsonString)
///@description Deserialize ViewElement from JSON String to ViewElement entity.
///@param {String} jsonString
///@return {ViewElement} viewElement 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.746Z}

function deserializeViewElement(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var object = assertNoOptional(getJsonObjectFieldValue(jsonObject, "object", Entity, "GenericEntity"));

	destroyJsonObject(jsonObject);
	
	return createViewElement(object);
	
}
