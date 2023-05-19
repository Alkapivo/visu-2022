///@description Create

	super();
	
	///@type {List<Bullet>}
	bullets = createList();

	GMObject = {
		update: method(this, function() {

			#region Bullets reactor
			var destroyBullets = [];
			var shrooms = fetchShrooms();
			var players = fetchPlayers();
			var destroyBullets = [];
			var bulletsSize = getListSize(this.bullets);
			for (var index = 0; index < bulletsSize; index++) {
				var bullet = this.bullets[| index];
				var bulletGridElement = getBulletGridElement(bullet);
				var bulletPosition = getGridElementPosition(bulletGridElement);
				var bulletProducer = getBulletProducer(bullet);
				
				#region Movement
				var angle = getBulletAngle(bullet);
				var speedValue = getBulletSpeedValue(bullet) + getBulletAcceleration(bullet) * getDeltaTimeValue();
				var positionX = getPositionHorizontal(bulletPosition) + getXOnCircle(speedValue, angle);
				var positionY = getPositionVertical(bulletPosition) + getYOnCircle(speedValue, angle);
				if (isOptionalPresent(getPlaygroundController())) {
							
					var grid = getPlaygroundController().GMObject.state.grid;
					if (positionX > grid.width) {
						positionX = abs(positionX) - (floor(abs(positionX) / grid.width) * grid.width);
					}
					
					if (positionX < 0.0) {
						positionX = grid.width - (abs(positionX) - (floor(abs(positionX) / grid.width) * grid.width));
					}
					positionX = clamp(positionX, 0.0, grid.width);
							
				}
						
				
				setPositionHorizontal(bulletPosition, positionX);
				setPositionVertical(bulletPosition, positionY);
				#endregion
				
				#region Collision
				var isAnyCollision = false;
				switch (bulletProducer) {
					case BulletProducer.SHROOM:
						var playersSize = getListSize(players);
						for (var playerIndex = 0; playerIndex < playersSize; playerIndex++) {
							var player = players[| playerIndex];
							var playerGridElement = getVisuPlayerGridElement(player);
							
							var isCollision = false;
							
							if (isOptionalPresent(getPlaygroundController())) {
								isCollision = checkCollisionBetweenGridElements(playerGridElement, getBulletGridElement(bullet), 2048); 	
							}
								
							if (isCollision) {
								
								respawnVisuPlayer();
								isAnyCollision = true;
								break;	
							}
						}
						break;
					case BulletProducer.PLAYER:
						if (getPositionVertical(bulletPosition) > 0) {
							var shroomsSize = getListSize(shrooms);
							
							// find first collisiton
							for (var shroomIndex = 0; shroomIndex < shroomsSize; shroomIndex++) {
								var shroom = shrooms[| shroomIndex];
								var shroomGridElement = getShroomGridElement(shroom);
								var isCollision = checkCirclesCollision(
									getGridElementPosition(shroomGridElement),
									getShroomRadius(shroom),
									bulletPosition,
									getBulletCollisionRadius(bullet)
								);
								
								var isCollision = false;
								if (isOptionalPresent(getPlaygroundController())) {
									isCollision = checkCollisionBetweenGridElements(shroomGridElement, getBulletGridElement(bullet), 2048); 	
								}
								
								if (isCollision) {
									isAnyCollision = true;
									shroomIndex = shroomsSize;
								}
							}
							
							// if any collision then nuke :)
							if (isAnyCollision) {
								for (var shroomIndex = 0; shroomIndex < shroomsSize; shroomIndex++) {
									var shroom = shrooms[| shroomIndex];
									var shroomGridElement = getShroomGridElement(shroom);
									var playerBulletRadius = isAnyCollision ? 3.5 : 1.0;
		
									var isCollision = false;
									if (isOptionalPresent(getPlaygroundController())) {
										isCollision = checkCollisionBetweenGridElements(shroomGridElement, getBulletGridElement(bullet), 2048); 	
									}
										
									if (isCollision) {
										var shroomState = getShroomState(shroom);	
										
										var bulletTaken = shroomState[? "bulletTaken"];
										shroomState[? "status"] = "end";
										shroomState[? "dieTimerDuration"] = 1;
										shroomState[? "isKilledByBullet"] = true;
										shroomState[? "bulletTaken"] = bulletTaken + 1;
										global.__score++;
									}
								}
							}
						}
						break;
					default:
						logger("Bullet without producer was found in bullets", LogType.WARNING);
						destroyBullets = pushArray(destroyBullets, index);
						break;
				}
				#endregion
				
				if (isAnyCollision) {
					destroyBullets = pushArray(destroyBullets, index);	
				}
				
				if ((!isAnyCollision) && (isOptionalPresent(getPlaygroundController()))) {
					var grid = getPlaygroundController().GMObject.state.grid;
					if (positionX < grid.view.x - grid.view.width
						|| positionX > grid.view.x + grid.view.width + grid.view.width
						|| positionY < grid.view.y - grid.view.height
						|| positionY > grid.view.y + grid.view.height + grid.view.height) {
						
						destroyBullets = pushArray(destroyBullets, index);
						isAnyCollision = true;
					}
				}
				
				if (!isAnyCollision) {
					sendGridElementRenderRequest(bulletGridElement);
				}
			}
			
			removeItemsFromList(this.bullets, destroyBullets, destroyBullet);
			#endregion

		}),
		cleanUp: method(this, function() {
	
			for (var index = 0; index < getListSize(this.bullets); index++) {
				var bullet = this.bullets[| index];
				destroyBullet(bullet);	
			}
			destroyDataStructure(this.bullets, List, "Unable to destroy bullets");

			super();	
		})
	}