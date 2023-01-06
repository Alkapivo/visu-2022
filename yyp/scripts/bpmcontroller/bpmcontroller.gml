function createBPMController(config) {

	var bpmController = {
		state: {
			bpmTimer: 0.0,
			bpm: 60,
			events: [
				"x", "x", "x", "y", ".", ".", ".", "."
			],
			eventPointer: 0
		},
		create: function(context, config) {
			
			context.state.bpm = config.bpm;
		},
		update: function(context) {
		
			if (global.isGameplayStarted) {
				var timer = context.state.bpmTimer
				var duration = GAME_FPS / context.state.bpm
				timer += applyDeltaTime(FRAME_MS);
				if (timer >= duration) {
			
					timer = timer - duration;
				
					var eventPointer = context.state.eventPointer + 1;
					if (eventPointer > Core.Collections.Arrays.size(context.state.events) - 1) {
				
						eventPointer = 0;
					}
					context.state.eventPointer = eventPointer;
				}
				context.state.bpmTimer = timer;
			}
		},
		render: function(context) {
		
			var xBegin = 300;
			var yBegin = 200;
			var symbolWidth = 12;
			var symbolHeight = 20;
			var font = asset_font_ibm_ps2thin4;
			 
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			draw_set_font(font);
			draw_set_color(c_white);
			draw_set_alpha(1.0);
		
			var events = context.state.events;
			var eventPointer = context.state.eventPointer;
			var eventString = "";
			var size = Core.Collections.Arrays.size(events);
			for (var index = 0; index < size; index++) {
			
				var event = events[index];
				var symbol = index == eventPointer 
					? stringParams("{0}\n^", event)
					: event;
				
				renderText(symbol, xBegin + symbolWidth * index, yBegin);
			}
		}
	}
	
	bpmController.create(bpmController, config);
	
	return bpmController;
}