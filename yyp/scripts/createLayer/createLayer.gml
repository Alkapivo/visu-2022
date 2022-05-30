///@function createLayer(name, depthValue)
///@description wrapper for layer_create.
///@param {String} name
///@param {Integer} depthValue (range: [-16000; 16000])
///@return {Layer} layerId
function createLayer(argument0, argument1) {

		var name = argument0;
		var depthValue = argument1;

		var layerId = layer_create(depthValue, name);
		logger("Created layer: { id: {0}, name: {1}, depth: {2} }", 
			LogType.DEBUG, layerId, name, depthValue);
		return layerId;
	



}
