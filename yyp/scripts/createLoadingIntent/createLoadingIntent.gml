///@function createLoadingIntent(scene, data)
///@description Constructor for LoadingIntent entity.
///@param {Scene} scene
///@param {Optional<ArrayMap>} data
///@return {LoadingIntent} loadingIntent 
///@throws {Exception}
///@generated {2020-09-22T10:33:22.429Z}
function createLoadingIntent(argument0, argument1) {

		var scene = argument0;
		var data = argument1;
	
		var loadingIntent = createEntity(LoadingIntent);

		setLoadingIntentScene(loadingIntent, assertNoOptional(scene));
		setLoadingIntentData(loadingIntent, data);

		return loadingIntent;
	



}
