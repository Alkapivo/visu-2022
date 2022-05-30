///@function dialogueActionStartSequence(data)
///@description Handler.
///@param {Map<String::Object>} data
///@return {Booolean} result
function dialogueActionStartSequence(argument0) {

		var data = argument0;
	
		var name = getFromMap(data, "name");
		var handler = getAssetIndex(name, AssetScript);
		if (isScript(handler)) {
		
			runScript(handler);
		}
	
		return true;
	



}
