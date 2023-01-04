///@description Bullet entity

///@function createBullet(gridElement, angle, speedValue, acceleration, producer, collisionRadius)
///@description Constructor for Bullet entity.
///@param {GridElement} gridElement
///@param {Number} angle
///@param {Number} speedValue
///@param {Number} acceleration
///@param {Instance} producer
///@param {Number} collisionRadius
///@return {Bullet} bullet 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.564Z}

function createBullet(gridElement, angle, speedValue, acceleration, producer, collisionRadius) {

	var bullet = createEntity(Bullet);

	setBulletGridElement(bullet, assertNoOptional(gridElement));
	setBulletAngle(bullet, assertNoOptional(angle));
	setBulletSpeedValue(bullet, assertNoOptional(speedValue));
	setBulletAcceleration(bullet, assertNoOptional(acceleration));
	setBulletProducer(bullet, assertNoOptional(producer));
	setBulletCollisionRadius(bullet, assertNoOptional(collisionRadius));

	return bullet;
	
}
///@function serializeBullet(bullet)
///@description Serialize Bullet to JSON string.
///@param {Bullet} bullet
///@return {String} bulletJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.564Z}

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
///@function deserializeBullet(jsonString)
///@description Deserialize Bullet from JSON String to Bullet entity.
///@param {String} jsonString
///@return {Bullet} bullet 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.564Z}

function deserializeBullet(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var gridElement = assertNoOptional(getJsonObjectFieldValue(jsonObject, "gridElement", Entity, "GridElement"));
	var angle = assertNoOptional(getJsonObjectFieldValue(jsonObject, "angle"));
	var speedValue = assertNoOptional(getJsonObjectFieldValue(jsonObject, "speedValue"));
	var acceleration = assertNoOptional(getJsonObjectFieldValue(jsonObject, "acceleration"));
	var producer = assertNoOptional(getJsonObjectFieldValue(jsonObject, "producer"));
	var collisionRadius = assertNoOptional(getJsonObjectFieldValue(jsonObject, "collisionRadius"));

	destroyJsonObject(jsonObject);
	
	return createBullet(gridElement, angle, speedValue, acceleration, producer, collisionRadius);
	
}
///@function destroyBullet(bullet)
///@description Destroy Bullet entity.
///@param {Bullet} bullet
///@throws {Exception}
///@generated {2021-01-17T11:31:55.720Z}
///@override
function destroyBullet(argument0) {

		var bullet = argument0;
	



}
///@function getBulletAcceleration(bullet)
///@description Getter.
///@param {Bullet} bullet
///@return {Number} acceleration 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.564Z}

function getBulletAcceleration(bullet) {

	return bullet[@ 3];
	
}
///@function getBulletAngle(bullet)
///@description Getter.
///@param {Bullet} bullet
///@return {Number} angle 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.564Z}

function getBulletAngle(bullet) {

	return bullet[@ 1];
	
}
///@function getBulletCollisionRadius(bullet)
///@description Getter.
///@param {Bullet} bullet
///@return {Number} collisionRadius 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.564Z}

function getBulletCollisionRadius(bullet) {

	return bullet[@ 5];
	
}
///@function getBulletGridElement(bullet)
///@description Getter.
///@param {Bullet} bullet
///@return {GridElement} gridElement 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.564Z}

function getBulletGridElement(bullet) {

	return bullet[@ 0];
	
}
///@function getBulletProducer(bullet)
///@description Getter.
///@param {Bullet} bullet
///@return {Instance} producer 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.564Z}

function getBulletProducer(bullet) {

	return bullet[@ 4];
	
}
///@function getBulletSpeedValue(bullet)
///@description Getter.
///@param {Bullet} bullet
///@return {Number} speedValue 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.564Z}

function getBulletSpeedValue(bullet) {

	return bullet[@ 2];
	
}
///@function setBulletAcceleration(bullet, acceleration)
///@description Setter.
///@param {Bullet} bullet
///@param {Number} acceleration
///@throws {Exception}
///@generated {2022-08-18T22:24:59.564Z}

function setBulletAcceleration(bullet, acceleration) {

	bullet[@ 3] = acceleration;
	
}
///@function setBulletAngle(bullet, angle)
///@description Setter.
///@param {Bullet} bullet
///@param {Number} angle
///@throws {Exception}
///@generated {2022-08-18T22:24:59.564Z}

function setBulletAngle(bullet, angle) {

	bullet[@ 1] = angle;
	
}
///@function setBulletCollisionRadius(bullet, collisionRadius)
///@description Setter.
///@param {Bullet} bullet
///@param {Number} collisionRadius
///@throws {Exception}
///@generated {2022-08-18T22:24:59.564Z}

function setBulletCollisionRadius(bullet, collisionRadius) {

	bullet[@ 5] = collisionRadius;
	
}
///@function setBulletGridElement(bullet, gridElement)
///@description Setter.
///@param {Bullet} bullet
///@param {GridElement} gridElement
///@throws {Exception}
///@generated {2022-08-18T22:24:59.564Z}

function setBulletGridElement(bullet, gridElement) {

	bullet[@ 0] = gridElement;
	
}
///@function setBulletProducer(bullet, producer)
///@description Setter.
///@param {Bullet} bullet
///@param {Instance} producer
///@throws {Exception}
///@generated {2022-08-18T22:24:59.564Z}

function setBulletProducer(bullet, producer) {

	bullet[@ 4] = producer;
	
}
///@function setBulletSpeedValue(bullet, speedValue)
///@description Setter.
///@param {Bullet} bullet
///@param {Number} speedValue
///@throws {Exception}
///@generated {2022-08-18T22:24:59.564Z}

function setBulletSpeedValue(bullet, speedValue) {

	bullet[@ 2] = speedValue;
	
}
