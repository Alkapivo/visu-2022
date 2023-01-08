/// @description GMObject.create()

	super()
	
	GuiWidth = 1280;
	GuiHeight = 720;
	var grid = {
		width: 2.0,
		height: 1.5,
		channels: 10,
		separators: {
			amount: 20,
			speed: 0.001,
			timer: 0.0,
		},
		view: {
			width: 1.0,
			height: 1.0,
			x: 1.0,
			y: 0.0,
			follow: {
				target: null,
				xMargin: 0.33,
				yMargin: 0.5
			},
			update: function(grid) {

				if (Core.Structs.is(grid.view.follow.target)) {
					var viewX = grid.view.x;
					var viewWidth = grid.view.width;
					var viewXMargin = grid.view.follow.xMargin;
					var targetX = grid.view.follow.target.x;
					if (targetX >= viewX + viewWidth - viewXMargin) {
						var viewXTarget = targetX + viewXMargin - viewWidth;
						grid.view.x = viewXTarget;
					}
					
					if (targetX <= viewX + viewXMargin) {
						var viewXTarget = targetX - viewXMargin;
						grid.view.x = viewXTarget;
					}
					
					var viewY = grid.view.y;
					var viewHeight = grid.view.height;
					var viewYMargin = grid.view.follow.yMargin;
					var targetY = grid.view.follow.target.y;
					if (targetY >= viewY + viewHeight - viewYMargin) {
						grid.view.y = targetY + viewYMargin - viewHeight;
					}
					
					if (targetY <= viewY + viewYMargin) {
						grid.view.y = targetY - viewYMargin;
					}
					
				}
				grid.view.x = clamp(grid.view.x, -1 * grid.view.width, grid.width);
				grid.view.y = clamp(grid.view.y, 0.0, grid.height - grid.view.height);
			}
		},
		elements: Core.Collections.Lists.create(
			{
				name: "player",
				sprite: createSprite(asset_texture_visu_player, 0, 1.0, 1.0, 1.0, 0.0, c_white),
				x: 1.5,
				y: 0.8,
				state: {
					speed: 0.01
				},
				handler: function(grid, element) {
					
					var input = {
						keyLeft: keyboard_check(vk_left),
						keyRight: keyboard_check(vk_right),
						keyUp: keyboard_check(vk_up),
						keyDown: keyboard_check(vk_down),
					}
					
					grid.view.follow.target = element;
					if (input.keyLeft) {
						element.x -= element.state.speed
					}
					
					if (input.keyRight) {
						element.x += element.state.speed
					}
					
					if (element.x > grid.width) {
						grid.view.x = grid.view.x - grid.width;
						element.x = abs(element.x) - (floor(abs(element.x) / grid.width) * grid.width);
					}
					
					if (element.x < 0.0) {
						grid.view.x = grid.view.x + grid.width;
						element.x = grid.width - (abs(element.x) - (floor(abs(element.x) / grid.width) * grid.width));
					}
					element.x = clamp(element.x, 0.0, grid.width);
					
					if (input.keyUp) {
						element.y -= element.state.speed
					}
					
					if (input.keyDown) {
						element.y += element.state.speed
					}
					element.y = clamp(element.y, 0.0, grid.height);
				}
			},
			{
				name: "shroom",
				sprite: createSprite(asset_texture_visu_shroom_01, 0, 1.0, 1.0, 1.0, 0.0, c_white),
				x: 1.8,
				y: 0.0,
				state: {
					speed: 0.005
				},
				handler: function(grid, element) {
					element.y += element.state.speed;
					
					var surfaceWidth = GuiWidth;
					var surfaceHeight = GuiHeight;
					var texture = getSpriteAssetIndex(element.sprite);
					var elementWidth = Core.Assets.Texture.getWidth(texture) / surfaceWidth;
					var elementHeight = Core.Assets.Texture.getHeight(texture) / surfaceHeight;
					
					if (element.y > grid.height + (elementHeight / 2.0)) {
						element.y = -1 * (elementHeight / 2.0);
					}
				}
			},
			{
				name: "shroom",
				sprite: createSprite(asset_texture_visu_shroom_01, 0, 1.0, 1.0, 1.0, 0.0, c_white),
				x: 0.6,
				y: 0.0,
				state: {
					speed: 0.006
				},
				handler: function(grid, element) {
					element.y += element.state.speed;
					
					var surfaceWidth = GuiWidth;
					var surfaceHeight = GuiHeight;
					var texture = getSpriteAssetIndex(element.sprite);
					var elementWidth = Core.Assets.Texture.getWidth(texture) / surfaceWidth;
					var elementHeight = Core.Assets.Texture.getHeight(texture) / surfaceHeight;
					
					if (element.y > grid.height + (elementHeight / 2.0)) {
						element.y = -1 * (elementHeight / 2.0);
					}
				}
			}
		),
		update: function(grid) {
			Core.Collections.Lists.forEach(grid.elements, function(element, grid) {
					element.handler(grid, element);
				}, grid);
			
			grid.view.update(grid);
		},
		render: function(grid, surface) {
		
			if (!Core.Surfaces.is(surface)) {
				throw "Cannot render grid on non-existing surface"
			}
			
			Core.Surfaces.renderToSurface(surface, function(surface, grid) {
				
					Core.GPU.renderClearColor(GM_COLOR_BLACK, 0.0);
				
					var surfaceWidth = Core.Surfaces.getWidth(surface);
					var surfaceHeight = Core.Surfaces.getHeight(surface);
					if (grid.channels > 0) {
						
						var channelWidth = grid.view.width / grid.channels;
						var viewX = grid.view.x;
						var viewXOffset = viewX - (floor(viewX / channelWidth) * channelWidth);
						for (var index = 0; index <= grid.channels; index++) {
					
							var xStart = (index * channelWidth) - viewXOffset;
							var yStart = 0.0;
							var xEnd = xStart;
							var yEnd = yStart + grid.view.height;
							draw_line_color(
								xStart * surfaceWidth, 
								yStart * surfaceHeight, 
								xEnd * surfaceWidth, 
								yEnd * surfaceHeight, 
								c_fuchsia, 
								c_fuchsia
							);
						}
					}
					
					if (grid.separators.amount > 0) {
					
						var viewY = grid.view.y;
						var separatorHeight = grid.height / grid.separators.amount;
						var timer = grid.separators.timer;
						timer += applyDeltaTime(grid.separators.speed);
						grid.separators.timer = timer > separatorHeight
							? timer - separatorHeight
							: timer;
						for (var index = 0; index <= grid.separators.amount; index++) {
						
							var xStart = 0.0;
							var yStart = (index * separatorHeight) + timer - viewY
							var xEnd = 1.0;
							var yEnd = yStart;
							draw_line_color(
								xStart * surfaceWidth, 
								yStart * surfaceHeight, 
								xEnd * surfaceWidth, 
								yEnd * surfaceHeight, 
								c_fuchsia, 
								c_fuchsia
							);
						}
					}
					
					if (Core.Collections.Lists.size(grid.elements) > 0) {
						
						Core.Collections.Lists.forEach(grid.elements, function(element, data) {
							
							var grid = data.grid;
							var surfaceWidth = data.surfaceWidth;
							var surfaceHeight = data.surfaceHeight;
							var texture = getSpriteAssetIndex(element.sprite);
							var elementWidth = Core.Assets.Texture.getWidth(texture) / surfaceWidth;
							var elementHeight = Core.Assets.Texture.getHeight(texture) / surfaceHeight;
							var viewX = grid.view.x;
							var viewY = grid.view.y;
							var viewWidth = grid.view.width;
							
							var renderXPosition = null;
							var renderYPosition = null;
							if ((Core.Numbers.isBetween(element.x + (elementWidth / 2.0), viewX, viewX + viewWidth))
								|| (Core.Numbers.isBetween(element.x - (elementWidth / 2.0), viewX, viewX + viewWidth))) {
							
								renderXPosition = (element.x - (elementWidth / 2.0) - viewX) * surfaceWidth;
								renderYPosition = (element.y - (elementHeight / 2.0) - viewY) * surfaceHeight;
							}
							
							if ((!isNumber(renderXPosition)) 
								&& (viewX < 0.0)) {
									
								var viewXOffset = grid.width + viewX;
								if ((Core.Numbers.isBetween(element.x + (elementWidth / 2.0), viewXOffset, grid.width))
									|| (Core.Numbers.isBetween(element.x - (elementWidth / 2.0), viewXOffset, grid.width))) {
									
									renderXPosition = ((element.x - grid.width) - (elementWidth / 2.0) - viewX) * surfaceWidth;
									renderYPosition = ((element.y) - (elementHeight / 2.0) - viewY) * surfaceHeight;
								}
							}
							
							if ((!isNumber(renderXPosition)) 
								&& (viewX + viewWidth + (elementWidth / 2.0) > grid.width)) {
								
								var viewXOffset = viewWidth - (grid.width - viewX);
								if ((Core.Numbers.isBetween(element.x + (elementWidth / 2.0), -1 * (elementWidth / 2.0), viewXOffset))
									|| (Core.Numbers.isBetween(element.x - (elementWidth / 2.0), -1 * (elementWidth / 2.0), viewXOffset))) {
									
									renderXPosition = ((element.x + grid.width) - (elementWidth / 2.0) - viewX) * surfaceWidth;
									renderYPosition = ((element.y) - (elementHeight / 2.0) - viewY) * surfaceHeight;
									
								}
							}
							
							if (isNumber(renderXPosition)) {
								Core.Sprites.render(element.sprite, renderXPosition, renderYPosition);
							}
						}, { grid: grid, surfaceWidth: surfaceWidth, surfaceHeight: surfaceHeight });
					}
				}, grid);
		},
	};
	
	GMObject = {
		state: {
			surface: Core.Surfaces.create(GuiWidth, GuiHeight, true),
			grid: grid
		},
		create: method(this, function() {
			this.GMObject.state.surface = Core.Surfaces.get(this.GMObject.state.surface, GuiWidth, GuiHeight, true)
		}),
		update: method(this, function() {
			this.GMObject.state.grid.update(this.GMObject.state.grid);
		}),
		renderGUI: method(this, function() {
			
			Core.GPU.renderClearColor(GM_COLOR_BLACK, 1.0);
			
			this.GMObject.state.surface = Core.Surfaces.get(this.GMObject.state.surface, GuiWidth, GuiHeight, true);
			this.GMObject.state.grid.render(this.GMObject.state.grid, this.GMObject.state.surface);
			
			Core.Surfaces.render(this.GMObject.state.surface, 0.0, 0.0);
			
			var grid = this.GMObject.state.grid;
			
			var text = stringParams("view.x: {0}\nview.y: {1}\n{2}", 
				grid.view.x, 
				grid.view.y,
				Core.Structs.is(grid.view.follow.target) 
					? stringParams("target.x: {0}\ntarget.y: {1}", grid.view.follow.target.x, grid.view.follow.target.y)
					: ""
			);
			
			Core.GPU.setConfig({
				font: asset_font_ibm_ps2thin4,
				horizontalAlign: GM_HALIGN_LEFT,
				verticalAlign: GM_VALIGN_TOP,
			});
			
			Core.Fonts.Render.outlinedText(text, 32, 32);
		}),
	}

	this.GMObject.create();