///@function emitTrackingEvent(eventName)
///@description Call js utils if html5 is true.
///@param {String} eventName
function emitTrackingEvent(argument0) {

		var eventName = argument0;

		if (isHtml5() && 1 == 2) {
			var time = getGameplayTime();
			var scoreValue = getGameplayScore();
			var ammo = 1;
			var trackingJson = 
			"{" + 
			" \"time\": " + string(time) + "," +
			" \"score\": " + string(scoreValue) +"," +
			" \"gameUUID\": \"" + string(global.gameSessionUUID) +"\"," +
			" \"ammo\":" + string(ammo) +
			"}";
			
			logger("Invoke tracking service. {0}", LogType.DEBUG, trackingJson);
			jsUtilFBPixelEvent("ballada-o-dojrzalosci", eventName, trackingJson);
		}
	



}
