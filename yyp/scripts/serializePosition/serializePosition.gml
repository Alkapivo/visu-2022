///@function serializePosition(position)
///@description Serialize Position to JSON string.
///@param {Position} position
///@return {String} positionJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:40.724Z}
function serializePosition(argument0) {

		var position = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"horizontal",
			getPositionHorizontal(position));	
		appendFieldToJsonObject(
			jsonObject,
			"vertical",
			getPositionVertical(position));	

		var positionJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return positionJsonString;
	



}
