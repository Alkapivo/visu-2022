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
