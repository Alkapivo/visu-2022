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
