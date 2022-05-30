///@function registerLangPack(langPack)
///@description Add LangPack to langPacks.
///@param {LangPack} langPack
function registerLangPack(argument0, argument1) {

		var langManager = argument0;
		var langPack = argument1;
	
	
		var langCode = getLangPackCode(langPack);
		var langPacks = getLangPacks();
		if (!isUndefined(langPacks[? langCode])) {
	
			logger("LangPack already registered. { \"langCode\": \"{0}\"}", LogType.WARNING, langCode);
		} else {
	
			langPacks[? langCode] = langPack;
			logger("LangPack registered. { \"langCode\": \"{0}\", \"translationsSize\": \"{1}\" }", LogType.WARNING, langCode, getMapSize(getLangPackTranslations(langPack)));
		}
	



}
