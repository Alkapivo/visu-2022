///@function serializeNetResponse(netResponse)
///@description Serialize NetResponse to JSON string.
///@param {NetResponse} netResponse
///@return {String} netResponseJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.106Z}
function serializeNetResponse(argument0) {

		var netResponse = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"type",
			getNetResponseType(netResponse));	
		appendEntityToJsonObject(
			jsonObject,
			"data",
			getNetResponseData(netResponse),
			"GenericEntity");
	

		var netResponseJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return netResponseJsonString;
	



}
