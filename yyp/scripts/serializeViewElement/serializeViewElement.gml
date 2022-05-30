///@function serializeViewElement(viewElement)
///@description Serialize ViewElement to JSON string.
///@param {ViewElement} viewElement
///@return {String} viewElementJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.746Z}

function serializeViewElement(viewElement) {

	var jsonObject = createJsonObject();

	appendEntityToJsonObject(
		jsonObject,
		"object",
		getViewElementObject(viewElement),
		"GenericEntity");
	

	var viewElementJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return viewElementJsonString;
	
}
