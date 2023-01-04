///@description ViewElement entity

///@function createViewElement(object)
///@description Constructor for ViewElement entity.
///@param {GenericEntity} object
///@return {ViewElement} viewElement 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.746Z}

function createViewElement(object) {

	var viewElement = createEntity(ViewElement);

	setViewElementObject(viewElement, assertNoOptional(object));

	return viewElement;
	
}
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
///@function destroyViewElement(viewElement)
///@description Destroy ViewElement entity.
///@param {ViewElement} viewElement
///@throws {Exception}
///@generated {2021-05-01T23:43:42.758Z}

function destroyViewElement(viewElement) {


	
	var object = getViewElementObject(viewElement);
	
	destroyGenericEntity(object);
	setViewElementObject(viewElement, null);
	

	
}
///@function getViewElementObject(viewElement)
///@description Getter.
///@param {ViewElement} viewElement
///@return {GenericEntity} object 
///@throws {Exception}
///@generated {2021-05-01T23:43:42.759Z}

function getViewElementObject(viewElement) {

	return viewElement[@ 0];
	
}
///@function setViewElementObject(viewElement, object)
///@description Setter.
///@param {ViewElement} viewElement
///@param {GenericEntity} object
///@throws {Exception}
///@generated {2021-05-01T23:49:41.514Z}

function setViewElementObject(viewElement, object) {

	viewElement[@ 0] = object;
	
}
