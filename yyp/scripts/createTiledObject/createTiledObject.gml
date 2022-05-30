///@function createTiledObject(type, name, texture, xPos, yPos, properties)
///@description Constructor for TiledObject entity.
///@param {String} type
///@param {Optional<String>} name
///@param {String} texture
///@param {Number} xPos
///@param {Number} yPos
///@param {Optional<Map<String::String>>} properties
///@return {TiledObject} tiledObject 
///@throws {Exception}
///@generated {2020-07-28T15:19:07.104Z}
function createTiledObject(argument0, argument1, argument2, argument3, argument4, argument5) {

		var type = argument0;
		var name = argument1;
		var texture = argument2;
		var xPos = argument3;
		var yPos = argument4;
		var properties = argument5;
	
		var tiledObject = createEntity(TiledObject);

		setTiledObjectType(tiledObject, assertNoOptional(type));
		setTiledObjectName(tiledObject, name);
		setTiledObjectTexture(tiledObject, assertNoOptional(texture));
		setTiledObjectXPos(tiledObject, assertNoOptional(xPos));
		setTiledObjectYPos(tiledObject, assertNoOptional(yPos));
		setTiledObjectProperties(tiledObject, properties);

		return tiledObject;
	



}
