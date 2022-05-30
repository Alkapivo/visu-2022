///@function spawnBullet(position, producer, [angle], [sprite], [speedValue], [acceleration])
///@description Bullet Factory.
///@param {Position} position
///@param {BulletProducer} producer
///@param {Number} angle
///@param {Sprite} sprite
///@param {Number} speedValue
///@param {Number} acceleration
///@return {Bullet} bullet
function spawnBullet() {

		if (argument_count < 2) {
			logger("spawnBullet must have at least 2 arguments provided", LogType.ERROR);
			return;	
		}

		var position = argument[0];
		var producer = argument[1];
		var angle = argument_count > 2 ? argument[2] : (producer == BulletProducer.PLAYER ? 90 : 270);
		var sprite = argument_count > 3 ? argument[3] : createSprite(global.bulletAsset, 0, 1.0, 1.0, 1.0, 0.0, c_white);
		var speedValue = argument_count > 4 ? argument[4] : 0.01;
		var acceleration = argument_count > 5 ? argument[5] : 0.005;
		var collisionRadius = fetchCollisionRadiusFromSprite(sprite);
		var gridElement = createGridElement(position, sprite, createGridElementInfo(false, GridElementInfoType.DEFAULT, "implement", COLOR_WHITE));
	
		var bullet = createBullet(gridElement, angle, speedValue, acceleration, producer, collisionRadius);
	
		addToList(fetchBullets(), bullet);
	
		return bullet;
	



}
