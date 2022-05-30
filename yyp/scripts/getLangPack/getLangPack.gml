///@function getLangPack(langCode)
///@description Getter.
///@param {String} [langCode=LanCode]
///@return {Optional<LangPack>} langPack
function getLangPack() {

		var langCode = argument_count > 0 ? argument[0] : getLangCode();
	
		var langPacks = getLangPacks();
		var langPack = getFromMap(langPacks, langCode);
	
		return isEntity(langPack) ? langPack : createEmptyOptional();
	



}
