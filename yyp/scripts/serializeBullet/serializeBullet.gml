///@function serializeBullet(bullet)
///@description Serialize Bullet to JSON string.
///@param {Bullet} bullet
///@return {String} bulletJsonString 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.505Z}

function serializeBullet(bullet) {

	var jsonObject = createJsonObject();

	appendEntityToJsonObject(
		jsonObject,
		"gridElement",
		getBulletGridElement(bullet),
		"GridElement");
	
	appendFieldToJsonObject(
		jsonObject,
		"angle",
		getBulletAngle(bullet));	
	appendFieldToJsonObject(
		jsonObject,
		"speedValue",
		getBulletSpeedValue(bullet));	
	appendFieldToJsonObject(
		jsonObject,
		"acceleration",
		getBulletAcceleration(bullet));	
	appendFieldToJsonObject(
		jsonObject,
		"producer",
		getBulletProducer(bullet));	
	appendFieldToJsonObject(
		jsonObject,
		"collisionRadius",
		getBulletCollisionRadius(bullet));	

	var bulletJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return bulletJsonString;
	
}
