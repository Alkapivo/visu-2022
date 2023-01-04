///@description LangPack entity

///@function createLangPack(code, translations)
///@description Constructor for LangPack entity.
///@param {String} code
///@param {Map<String::String>} translations
///@return {LangPack} langPack 
///@throws {Exception}
///@generated {2021-05-01T23:49:41.893Z}

function createLangPack(code, translations) {

	var langPack = createEntity(LangPack);

	setLangPackCode(langPack, assertNoOptional(code));
	setLangPackTranslations(langPack, assertNoOptional(translations));

	return langPack;
	
}
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
///@function destroyLangPack(langPack)
///@description Destroy LangPack entity.
///@param {LangPack} langPack
///@throws {Exception}
///@generated {2021-05-01T23:43:43.683Z}

function destroyLangPack(langPack) {


	
	var code = getLangPackCode(langPack);
	var translations = getLangPackTranslations(langPack);
	
	destroyDataStructure(translations, Map, "Unable to destroy Map translations in LangPack");
	setLangPackTranslations(langPack, null);
	

	
}

///@function getLangPackCode(langPack)
///@description Getter.
///@param {LangPack} langPack
///@return {String} code 
///@throws {Exception}
///@generated {2021-05-01T23:43:43.683Z}

function getLangPackCode(langPack) {

	return langPack[@ 0];
	
}

///@function getLangPackTranslations(langPack)
///@description Getter.
///@param {LangPack} langPack
///@return {Map<String::String>} translations 
///@throws {Exception}
///@generated {2021-05-01T23:43:43.683Z}

function getLangPackTranslations(langPack) {

	return langPack[@ 1];
	
}
///@function setLangPackCode(langPack, code)
///@description Setter.
///@param {LangPack} langPack
///@param {String} code
///@throws {Exception}
///@generated {2021-05-01T23:49:41.893Z}

function setLangPackCode(langPack, code) {

	langPack[@ 0] = code;
	
}
///@function setLangPackTranslations(langPack, translations)
///@description Setter.
///@param {LangPack} langPack
///@param {Map<String::String>} translations
///@throws {Exception}
///@generated {2021-05-01T23:49:41.893Z}

function setLangPackTranslations(langPack, translations) {

	langPack[@ 1] = translations;
	
}
