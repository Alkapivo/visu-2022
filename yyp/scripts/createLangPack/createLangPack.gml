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
