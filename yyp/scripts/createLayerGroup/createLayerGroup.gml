///@function createLayerGroup(layerId, tilemap)
///@description Constructor for LayerGroup entity.
///@param {Layer} layerId
///@param {Tilemap} tilemap
///@return {LayerGroup} layerGroup 
///@throws {Exception}
///@generated {2020-07-28T15:19:08.406Z}
function createLayerGroup(argument0, argument1) {

		var layerId = argument0;
		var tilemap = argument1;
	
		var layerGroup = createEntity(LayerGroup);

		setLayerGroupLayerId(layerGroup, assertNoOptional(layerId));
		setLayerGroupTilemap(layerGroup, assertNoOptional(tilemap));

		return layerGroup;
	



}
