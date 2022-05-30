///@function getPixelScale(toCompare, maxSize, pixelScale, factor, maxDepth)
///@description Calculate pixel scale.
///@param {Integer} toCompare
///@param {Integer} maxSize 
///@param {Number} [pixelScale=1.0]
///@param {Number} [factor=0.5]
///@param {Integer} [maxDepth=3]
///@return {Number} pixelScale
function getPixelScale() {

		var toCompare = argument[0];
		var maxSize = argument[1];
		var pixelScale = argument_count > 2 ? argument[2] : 1.0;
		var factor = argument_count > 3 ? argument[3] : 0.5
		var maxDepth = argument_count > 4 ? argument[4] : 3;

		for (var index = 0; toCompare * pixelScale > maxSize; index++) {
			pixelScale *= factor;
			if (index > maxDepth) {
				break;
			}
		}
	
		return pixelScale;
	



}
