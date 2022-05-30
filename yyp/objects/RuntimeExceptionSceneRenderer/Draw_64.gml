///@description

	guardSurface(id, applicationSurface, "applicationSurface", RealWidth, RealHeight, true);
	gpuSetSurfaceTarget(applicationSurface);
	drawClear(COLOR_TRANSPARENT);
		
	#region Calculate text height
	draw_set_font(font_ibm_vga9);
	var horizontalMargin = 32;
	var verticalMargin = 48;
	var frameWidth = 4;
	
	var text = "" +
		stringParams("Software Failure. {0}.\n", isMobile() ? 
			"Touch anywhere to continue" : 
			"Press left mouse button to continue") +
			"\n\n" + getExceptionName(exception) + ": \n" + 
			charwrapString(
				getExceptionMessage(exception), 
				RealWidth - (2 * horizontalMargin) - (2 * frameWidth) - 16, "\n");
	var messageHeight = string_height(text) + (verticalMargin * 0.5);
	#endregion
		
	#region Draw frame
	if (blinkTimer > 30) {
		draw_set_color(c_red);
		draw_rectangle(
			horizontalMargin,
			verticalMargin,
			RealWidth - horizontalMargin,
			verticalMargin + messageHeight,
			false);
		draw_set_color(c_black);
		draw_rectangle(
			horizontalMargin + frameWidth,
			verticalMargin + frameWidth,
			RealWidth - horizontalMargin - frameWidth,
			verticalMargin + messageHeight - frameWidth,
			false);
	}
	#endregion
		
	#region Draw text
	var textXPosition = RealWidth / 2.0;
	var textYPosition = verticalMargin + (messageHeight / 2.0);
	draw_set_color(c_red);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(
		textXPosition,
		textYPosition,
		text);
	#endregion

	#region Draw trace
	var trace  = global.consoleTrace;
	if (isArray(trace)) {
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		var traceLength = getArrayLength(trace);
		var offset = 0;
		var logColor = make_color_rgb(2, 120, 204)
		for (var index = traceLength - 1; index >= 0; index--) {
			
			if (offset > RealHeight * 2) {
			
				break;
			}
			
			var log = trace[@ index];
			if (!isUndefined(log)) {
				
				log = wordwrapString(string(log), RealWidth - (2 * horizontalMargin), "\n", 3);
				
				var glitchHorizontal = (random(100) / 100) > 0.99 ? choose(1, 1, -1) * irandom(4) : 0;
				var glitchVertical = (random(100) / 100) > 0.99 ? choose(1, 1, -1) * irandom(2) : 0;
				
				var xPosition = horizontalMargin + frameWidth + glitchHorizontal,;
				var yPosition = (verticalMargin + messageHeight - frameWidth) + 32 + offset + glitchVertical;
				renderText(
					log,
					xPosition,
					yPosition,
					logColor,
					((random(10) / 10) * 0.1) + 0.95
				);

				
				offset = offset + string_height(log);
			}
		}
		draw_set_alpha(1);
	}
	#endregion

	gpuResetSurfaceTarget();
	
	drawSurface(applicationSurface, 0, 0);
	
