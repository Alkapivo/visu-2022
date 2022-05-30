///@function serializeLangPack(langPack)
///@description Serialize LangPack to JSON string.
///@param {LangPack} langPack
///@return {String} langPackJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:43.683Z}

function serializeLangPack(langPack) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"code",
		getLangPackCode(langPack));	
	appendFieldToJsonObject(
		jsonObject,
		"translations",
		getLangPackTranslations(langPack),
		Map);
	

	var langPackJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return langPackJsonString;
	
}
