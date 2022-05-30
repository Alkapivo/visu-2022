///@function applyLangPack(langCode)
///@description Set langPack as default by langCode.
///@param {String} langCode
///@throws {NullPointerException}
function applyLangPack(argument0) {

		var langCode = argument0;
	
		var langPack = getLangPack(langCode);
		if (isOptionalPresent(langPack)) {
	
			global.langCode = langCode;
			global.langPack = langPack;
		} else {
	
			throwException(
				createException(
					NullPointerException,
					stringParams("LangPack couldn't be applied. { \"langCode\": \"{0}\" }", langCode)
				)
			);
		}
	



}
