Shroom behaviour ideas:
 - `bullethell`: shroom will follow the player (variable: followFactor)
 - `bullethell`: collision with shroom can enable `god mode` and modify player speed for short period of time (variable: duration, speedFactor)
 - `bullethell`: shroom can have health value, it will required multiple projectiles to be destroyed (variable: life)
 - `bullethell`: shroom direction and speed can be changed by collision with player projectile
 - `platformer`: after killing shroom it can come back to live after short period of time (variable: duration)
 - `platformer`: landing on shroom can trigger respawnj event
 - `platformer`: collision with shroom can trigger respawn event
 - `platformer`: shroom can change its direction and speed when player will land or collide on it




	Core.Collections._Map.set(shroomState, "verticalSpeed", verticalSpeed);
	
	getValueFromStruct(config.features, "
Core.Collections._Map.set(shroomState, "isShooting", getValueFromStruct(config.features, "isShooting", false));
Core.Collections._Map.set(shroomState, "bulletFollowPlayer", getValueFromStruct(config.features, "bulletFollowPlayer", false));
Core.Collections._Map.set(shroomState, "slideAwayAfterLanding", getValueFromStruct(config.features, "slideAwayAfterLanding", false));