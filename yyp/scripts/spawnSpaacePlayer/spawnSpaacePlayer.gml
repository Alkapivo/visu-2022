///@param {String} name
///@param {?InputHandler} inputHandler
function spawnSpaacePlayer(name, inputHandler) {

	var position = createPosition(0.5, 0.77);
	var spriteIndex = asset_sprite_spaceship;
	sprite_set_speed(spriteIndex, 10, spritespeed_framespersecond);
	var sprite = createSprite(spriteIndex, 0, 1.0, 1.0, 1.0, 0.0, c_white);
	var gridElement = createGridElement(
		position,
		sprite,
		createGridElementInfo(false, GridElementInfoType.DEFAULT, "", c_white));
	var status = PlayerStatus.INTRO,
	var state = createDefaultPlayerState();
	var horizontalSpeed = 0.0;
	var verticalSpeed = 0.0;
	var collisionRadius = fetchCollisionRadiusFromSprite(sprite) * 0.75;

	var player = createSpaacePlayer(name, gridElement, status, state, inputHandler, horizontalSpeed, verticalSpeed, collisionRadius);
	
	registerPlayer(player);
}
