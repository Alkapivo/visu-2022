///@function createNetResponse(type, data)
///@description Constructor for NetResponse entity.
///@param {NetEventType} type
///@param {GenericEntity} data
///@return {NetResponse} netResponse 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.514Z}
function createNetResponse(argument0, argument1) {

		var type = argument0;
		var data = argument1;
	
		var netResponse = createEntity(NetResponse);

		setNetResponseType(netResponse, assertNoOptional(type));
		setNetResponseData(netResponse, assertNoOptional(data));

		return netResponse;
	



}
