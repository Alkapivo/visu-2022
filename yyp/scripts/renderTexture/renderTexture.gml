///@function renderTexture(texture, frame, xPosition, yPosition, xScale, yScale, alpha, angle, color)
///@description Wrapper for draw_sprite_ext.
///@param {AssetTexture} texture
///@param {Number} xPosition
///@param {Number} yPosition
///@param {Number} [frame=0]
///@param {Number} [xScale=1.0]
///@param {Number} [yScale=1.0]
///@param {Number} [alpha=1.0]
///@param {Number} [angle=0.0]
///@param {Number} [color=c_white]
function renderTexture() {

		///checkArgumentCount(3, argument_count, renderTexture);

		var texture = argument[0];
		var xPosition = argument[1];
		var yPosition = argument[2];
		var frame = argument_count > 3 ? argument[3] : 0.0;
		var xScale = argument_count > 4 ? argument[4] : 1.0;
		var yScale = argument_count > 5 ? argument[5] : 1.0;
		var alpha = argument_count > 6 ? argument[6] : 1.0;
		var angle = argument_count > 7 ? argument[7] : 0.0;
		var color = argument_count > 8 ? argument[8] : c_white;
	
		draw_sprite_ext(texture, frame, xPosition, yPosition, xScale, yScale, angle, color, alpha);
	



}
