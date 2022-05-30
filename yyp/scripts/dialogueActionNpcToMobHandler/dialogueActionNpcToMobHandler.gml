///@function dialogueActionNpcToMobHandler(data)
///@description Handler.
///@param {Map<String::Object>} data
///@return {Booolean} result
function dialogueActionNpcToMobHandler(argument0) {

		var data = argument0;
	
		transformNpcToMob(DialogueMobContext);
		clearException();
	
		return true;
	



}
