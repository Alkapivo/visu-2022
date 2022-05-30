///@function destroyNetResponse(netResponse)
///@description Destroy NetResponse entity.
///@param {NetResponse} netResponse
///@throws {Exception}
///@generated {2020-09-28T21:11:15.514Z}
function destroyNetResponse(argument0) {

		var netResponse = argument0;
	
		var type = getNetResponseType(netResponse);
		var data = getNetResponseData(netResponse);
	
		destroyGenericEntity(data);
		setNetResponseData(netResponse, null);
	

	



}
