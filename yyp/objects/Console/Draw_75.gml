///@description Draw console box

	if (consoleHeight > 0) {
		
		#region Setup draw engine
		draw_set_font(font);
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		#endregion
		
		#region Setup anchor variables
		var width = RealWidth;
		var height = RealHeight < consoleHeight ? RealHeight : consoleHeight;
		var xAnchor = 0;
		var yAnchor = 0;
		var xInputAnchor = xAnchor + margin;
		var yInputAnchor = yAnchor + height - margin - fontHeight;
		#endregion
		
		#region Calculate command string position
		var keyboardString = charwrapString(">" + keyboard_string + promptOffset + " ", width - 2 * margin, "\n");
		var keyboardStringOffset = ((string_count("\n", keyboardString) - 1) * fontHeight) + margin ;
		#endregion
		
		#region Calculate command prompt position
		var cursorString = " ";
		repeat (string_length(keyboard_string)) { cursorString += " "; }
		cursorString = charwrapString(cursorString + promptChar, width - 2 * margin, "\n");
		#endregion
		
		#region Draw console box
		draw_set_alpha(0.75);
		draw_set_color(colorToGMColor(COLOR_BLACK));
		draw_rectangle(xAnchor, yAnchor, xAnchor + width, yAnchor + height + keyboardStringOffset, false);
		#endregion
		
		#region Draw console prompt
		draw_set_alpha(1.0);		
		draw_set_color(outputConsoleColor);
		draw_text(xInputAnchor, yInputAnchor, cursorString);
		
		draw_set_color(commandConsoleColor);
		draw_text(xInputAnchor, yInputAnchor, keyboardString);
		#endregion
		
		#region Draw console trace
		draw_set_color(outputConsoleColor);
		var xTraceAnchor = xInputAnchor
		var yTraceAnchor = yInputAnchor - fontHeight;
		var consoleTrace = getConsoleTrace(this);
		for (var index = stackSize - pageOffset - 1; index >= 0; index--) {
			if (yTraceAnchor < fontHeight) {
				break;	
			}
			
			var text = consoleTrace[index] == null ? "" : consoleTrace[index];
			var log = charwrapString(text, width - 2 * margin, "\n");
			var multilineOffset = string_count("\n", log);
			
			if (multilineOffset > 0) {
				yTraceAnchor -= (multilineOffset) * fontHeight;	
			}
			
			for (var key = mapFirst(consoleColors); iteratorFinish(key); key = mapNext(consoleColors, key)) {
				if (string_count(key, log) > 0) {
					var color = consoleColors[? key];	
					draw_set_color(color);
					break;
				}
				draw_set_color(outputConsoleColor);
			}
			
			draw_text(xTraceAnchor, yTraceAnchor, log);
			yTraceAnchor -= fontHeight;
		}
		#endregion
	}
