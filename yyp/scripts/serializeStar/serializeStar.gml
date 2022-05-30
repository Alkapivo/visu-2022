///@function serializeStar(star)
///@description Serialize Star to JSON string.
///@param {Star} star
///@return {String} starJsonString 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.810Z}

function serializeStar(star) {

	var jsonObject = createJsonObject();

	appendEntityToJsonObject(
		jsonObject,
		"position",
		getStarPosition(star),
		"Position");
	
	appendEntityToJsonObject(
		jsonObject,
		"target",
		getStarTarget(star),
		"Position");
	
	appendEntityToJsonObject(
		jsonObject,
		"sprite",
		getStarSprite(star),
		"Sprite");
	
	appendFieldToJsonObject(
		jsonObject,
		"speedValue",
		getStarSpeedValue(star));	
	appendFieldToJsonObject(
		jsonObject,
		"scale",
		getStarScale(star));	
	appendFieldToJsonObject(
		jsonObject,
		"alpha",
		getStarAlpha(star));	

	var starJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return starJsonString;
	
}
