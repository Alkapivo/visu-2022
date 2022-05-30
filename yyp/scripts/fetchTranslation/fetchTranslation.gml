///@function fetchTranslation(label, langCode)
///@description Getter.
///@param {String} label
///@param {String} [langCode=LangCode]
///@return {String} labelTranslation
function fetchTranslation() {

		var label = argument[0];
		var langCode = argument_count > 1 ? argument[1] : getLangCode();
	
		var langPack = getLangPack();
		var translation = label;
		if (isOptionalPresent(langPack)) {
	
			var translations = getLangPackTranslations(langPack);
			var foundTranslation = translations[? label];
			if (typeof(foundTranslation) == "string") {
		
				translation = foundTranslation;
			} else {
		
				logger("Translation wasn't found. { \"langCode\": \"{0}\", \"label\": \"{1}\" }", LogType.DEBUG, langCode, label);
			}
		}
	
		return translation;
	



}
