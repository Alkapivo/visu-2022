///@function construct(assetClass, layerId, xPos, yPos)
///@description `new` operator. Create new instance.
///@param {AssetClass} assetClass
///@param {Layer} [layerId=layer]
///@param {Number} [xPos=0.0]
///@param {Number} [yPos=0.0]
function construct() {

		///checkArgumentCount(1, argument_count, construct)
	
		var assetClass = argument[0];
		var layerId = argument_count > 1 ? argument[1] : layer;
		var xPos = argument_count > 2 ? argument[2] : 0.0;
		var yPos = argument_count > 3 ? argument[3] : 0.0;
	
		var instance = instance_create_layer(xPos, yPos, layerId, assetClass);
		setInstanceVariable(instance, "instanceLifecycle", true);
	
		return instance;
	



}
