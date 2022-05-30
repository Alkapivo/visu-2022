///@function destroyTiledLayer(tiledLayer)
///@description Destroy TiledLayer entity.
///@param {TiledLayer} tiledLayer
///@throws {Exception}
///@generated {2020-07-28T15:19:06.871Z}
function destroyTiledLayer(argument0) {

		var tiledLayer = argument0;
	
		var name = getTiledLayerName(tiledLayer);
		var opacity = getTiledLayerOpacity(tiledLayer);
		var type = getTiledLayerType(tiledLayer);
		var xPos = getTiledLayerXPos(tiledLayer);
		var yPos = getTiledLayerYPos(tiledLayer);
		var properties = getTiledLayerProperties(tiledLayer);
		var data = getTiledLayerData(tiledLayer);
		var width = getTiledLayerWidth(tiledLayer);
		var height = getTiledLayerHeight(tiledLayer);
		var objects = getTiledLayerObjects(tiledLayer);
		var vertexBufferGroups = getTiledLayerVertexBufferGroups(tiledLayer);
		var layers = getTiledLayerLayers(tiledLayer);
	
		if (isOptionalPresent(properties)) {
			destroyDataStructure(properties, Map, "Unable to destroy Map properties in TiledLayer");
		}
		setTiledLayerProperties(tiledLayer, null);
	
		if (isOptionalPresent(objects)) {
			for (var index = 0; index < getArrayLength(objects); index++) {
				var entity = objects[@ index];
				destroyTiledObject(entity);
			}
		}
		setTiledLayerObjects(tiledLayer, null);
	
		if (isOptionalPresent(vertexBufferGroups)) {
			for (var index = 0; index < getArrayLength(vertexBufferGroups); index++) {
				var entity = vertexBufferGroups[@ index];
				destroyVertexBufferGroup(entity);
			}
		}
		setTiledLayerVertexBufferGroups(tiledLayer, null);
	
		if (isOptionalPresent(layers)) {
			for (var index = 0; index < getArrayLength(layers); index++) {
				var entity = layers[@ index];
				destroyTiledLayer(entity);
			}
		}
		setTiledLayerLayers(tiledLayer, null);
	

	



}
