///@description create()

	#region Fields

	#macro FieldLangManager_langPacks "langPacks"

///@private:

	///@type {String}
	langCode = global.langCode;
	
	///@type {LangPack}
	langPack = global.langPack;
	
	///@type {Map<String::LangPack}
	langPacks = global.langPacks
	
	#endregion
	
	if (!isDataStructure(langPacks, Map)) {
		
		global.langPacks = createMap();	
	}
	
