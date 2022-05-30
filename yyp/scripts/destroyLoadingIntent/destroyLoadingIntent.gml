///@function destroyLoadingIntent(loadingIntent)
///@description Destroy LoadingIntent entity.
///@param {LoadingIntent} loadingIntent
///@throws {Exception}
///@generated {2020-09-22T10:33:22.429Z}
function destroyLoadingIntent(argument0) {

		var loadingIntent = argument0;
	
		var scene = getLoadingIntentScene(loadingIntent);
		var data = getLoadingIntentData(loadingIntent);
	
		if (isOptionalPresent(data)) {
			destroyArrayMap(data);
		}
		setLoadingIntentData(loadingIntent, null);
	

	



}
