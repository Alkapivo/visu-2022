///@function isAudio(audioId)
function isAudio(argument0) {
		
		var audioId = argument0;
		
		return isNumber(audioId) ? audio_exists(audioId) : false;
	



}
