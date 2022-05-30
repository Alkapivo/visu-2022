///@function destroyTiledObject(tiledObject)
///@description Destroy TiledObject entity.
///@param {TiledObject} tiledObject
///@throws {Exception}
///@generated {2020-07-28T15:19:07.105Z}
function destroyTiledObject(argument0) {

		var tiledObject = argument0;
	
		var type = getTiledObjectType(tiledObject);
		var name = getTiledObjectName(tiledObject);
		var texture = getTiledObjectTexture(tiledObject);
		var xPos = getTiledObjectXPos(tiledObject);
		var yPos = getTiledObjectYPos(tiledObject);
		var properties = getTiledObjectProperties(tiledObject);
	
		if (isOptionalPresent(properties)) {
			destroyDataStructure(properties, Map, "Unable to destroy Map properties in TiledObject");
		}
		setTiledObjectProperties(tiledObject, null);
	

	



}
