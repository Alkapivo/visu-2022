///@function createTiledLayer(name, opacity, type, xPos, yPos, properties, data, width, height, objects, vertexBufferGroups, layers)
///@description Constructor for TiledLayer entity.
///@param {String} name
///@param {Number} opacity
///@param {String} type
///@param {Number} xPos
///@param {Number} yPos
///@param {Optional<Map<String::String>>} properties
///@param {Optional<String>} data
///@param {Optional<Integer>} width
///@param {Optional<Integer>} height
///@param {Optional<TiledObject[]>} objects
///@param {Optional<VertexBufferGroup[]>} vertexBufferGroups
///@param {Optional<TiledLayer[]>} layers
///@return {TiledLayer} tiledLayer 
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function createTiledLayer(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11) {

		var name = argument0;
		var opacity = argument1;
		var type = argument2;
		var xPos = argument3;
		var yPos = argument4;
		var properties = argument5;
		var data = argument6;
		var width = argument7;
		var height = argument8;
		var objects = argument9;
		var vertexBufferGroups = argument10;
		var layers = argument11;
	
		var tiledLayer = createEntity(TiledLayer);

		setTiledLayerName(tiledLayer, assertNoOptional(name));
		setTiledLayerOpacity(tiledLayer, assertNoOptional(opacity));
		setTiledLayerType(tiledLayer, assertNoOptional(type));
		setTiledLayerXPos(tiledLayer, assertNoOptional(xPos));
		setTiledLayerYPos(tiledLayer, assertNoOptional(yPos));
		setTiledLayerProperties(tiledLayer, properties);
		setTiledLayerData(tiledLayer, data);
		setTiledLayerWidth(tiledLayer, width);
		setTiledLayerHeight(tiledLayer, height);
		setTiledLayerObjects(tiledLayer, objects);
		setTiledLayerVertexBufferGroups(tiledLayer, vertexBufferGroups);
		setTiledLayerLayers(tiledLayer, layers);

		return tiledLayer;
	



}
