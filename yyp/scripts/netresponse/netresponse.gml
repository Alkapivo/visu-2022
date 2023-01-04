///@description NetResponse entity

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
///@function deserializeNetResponse(jsonString)
///@description Deserialize NetResponse from JSON String to NetResponse entity.
///@param {String} jsonString
///@return {NetResponse} netResponse 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.514Z}
function deserializeNetResponse(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
		var data = assertNoOptional(getJsonObjectFieldValue(jsonObject, "data", Entity, "GenericEntity"));

		destroyJsonObject(jsonObject);
	
		return createNetResponse(type, data);
	



}
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
///@function getNetResponseData(netResponse)
///@description Getter.
///@param {NetResponse} netResponse
///@return {GenericEntity} data 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.514Z}
function getNetResponseData(argument0) {

		return argument0[@ 1];
	



}
///@function getNetResponseType(netResponse)
///@description Getter.
///@param {NetResponse} netResponse
///@return {NetEventType} type 
///@throws {Exception}
///@generated {2020-09-28T21:11:15.514Z}
function getNetResponseType(argument0) {

		return argument0[@ 0];
	



}
///@function setNetResponseData(netResponse, data)
///@description Setter.
///@param {NetResponse} netResponse
///@param {GenericEntity} data
///@throws {Exception}
///@generated {2020-09-28T21:11:15.514Z}
function setNetResponseData(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
///@function setNetResponseType(netResponse, type)
///@description Setter.
///@param {NetResponse} netResponse
///@param {NetEventType} type
///@throws {Exception}
///@generated {2020-09-28T21:11:15.514Z}
function setNetResponseType(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
