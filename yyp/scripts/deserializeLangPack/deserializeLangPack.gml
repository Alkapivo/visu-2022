///@function deserializeLangPack(jsonString)
///@description Deserialize LangPack from JSON String to LangPack entity.
///@param {String} jsonString
///@return {LangPack} langPack 
///@throws {Exception}
///@generated {2021-05-01T23:43:43.683Z}

function deserializeLangPack(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var code = assertNoOptional(getJsonObjectFieldValue(jsonObject, "code"));
	var translations = assertNoOptional(getJsonObjectFieldValue(jsonObject, "translations", Map));

	destroyJsonObject(jsonObject);
	
	return createLangPack(code, translations);
	
}
