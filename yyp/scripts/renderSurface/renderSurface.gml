///@function renderSurface(surface, xPosition, yPosition, [xScale], [yScale], [angle], [alpha], [blendColors], [origin], [textureBegin], [textureEnd])
///@description Wrapper for draw_surface_general with surface origin.
///@param {Surface} surface
///@param {Integer} [xPosition=0]
///@param {Integer} [yPosition=0]
///@param {Number} [xScale]
///@param {Number} [yScale]
///@param {Number} [angle] in degree
///@param {Number} [alpha] normalized
///@param {GMColor|GMColor[]} [blendColors] can be one color or array of four. Corner order: [ top-left, top-right, bottom-right, bottom-left ]
///@param {Position} [origin] normalized
///@param {Position} [textureBegin] normalized
///@param {Position} [textureEnd] normalized
function renderSurface() {

		///checkArgumentCount(1, argument_count, drawSurface);
	
		var surface = argument[0];
		var xPosition = argument_count > 1? argument[1] : 0.0;
		var yPosition = argument_count > 2 ? argument[2] : 0.0;
		var xScale = argument_count > 3 ? argument[3] : 1.0;
		var yScale = argument_count > 4 ? argument[4] : 1.0;
		var angle = argument_count > 5 ? argument[5] : 0.0;
		var alpha = argument_count > 6 ? argument[6] : 1.0;
		var blendColors = argument_count > 7 ? argument[7]: [ c_white, c_white, c_white, c_white ];
		var origin = argument_count > 8 ? argument[8] : createPosition(0.0, 0.0);
		var textureBegin = argument_count > 9 ? argument[9] : createPosition(0.0, 0.0);
		var textureEnd = argument_count > 10 ? argument[10] : createPosition(1.0, 1.0);
	
	#region Sanitize blendColors
		if (!(isArray(blendColors)) ||
			!(getArrayLength(blendColors) > 3)) {
			var blendColor = isArray(blendColors) && getArrayLength(blendColors) > 0 ? blendColors[0] : c_white;
			blendColors = [
				blendColor,
				blendColor,
				blendColor,
				blendColor
			];
		}
	#endregion
	
	#region Render normalized positions
		var width = surface_get_width(surface);
		var height = surface_get_height(surface);
		var surfaceXOrigin = getPositionHorizontal(origin) * width;
		var surfaceYOrigin = getPositionVertical(origin) * height;
		var surfaceXOriginBegin = getPositionHorizontal(textureBegin) * width;
		var surfaceYOriginBegin = getPositionVertical(textureBegin) * height;
		var surfaceXOriginEnd = getPositionHorizontal(textureEnd) * width;
		var surfaceYOriginEnd = getPositionVertical(textureEnd) * height;
		var xPoint = xPosition + ((width * origin[0]) - (dcos(angle) * (surfaceXOrigin * xScale)) - (dsin(angle) * (surfaceYOrigin * yScale)));
		var yPoint = yPosition + ((height * origin[1]) - (dcos(angle) * (surfaceYOrigin * yScale)) + (dsin(angle) * (surfaceXOrigin * xScale)));
	#endregion
	

		draw_surface_general(
			surface,
			surfaceXOriginBegin,
			surfaceYOriginBegin,
			surfaceXOriginEnd,
			surfaceYOriginEnd,
			xPoint,
			yPoint,
			xScale,
			yScale,
			angle,
			blendColors[0],
			blendColors[1],
			blendColors[2],
			blendColors[3],
			alpha);
	



}
