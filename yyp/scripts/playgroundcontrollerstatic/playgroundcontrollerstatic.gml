///@description createGridController()
///@return {Struct<Grid>}
function createGridManager() {
	
	var grid = {
		width: 2.0,
		height: 1.3,
		channels: 10,
		separators: {
			amount: 20,
			speed: 0.001,
			timer: 0.0,
		},
		pixelWidth: 512,
		pixelHeight: 512,
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
				name: "shroom",
				sprite: createSprite(asset_texture_visu_shroom_01, 0, 0.3, 0.3, 1.0, 0.0, c_white),
				x: 1.7,
				y: -0.3,
				state: {
					speed: 0.004,
				},
				handler: function(grid, element) {
					element.y += element.state.speed;
					
					var surfaceWidth = grid.pixelWidth
					var surfaceHeight = grid.pixelHeight
					var texture = getSpriteAssetIndex(element.sprite);
					var elementWidth = Core.Assets.Texture.getWidth(texture) / surfaceWidth;
					var elementHeight = Core.Assets.Texture.getHeight(texture) / surfaceHeight;
					
					if (element.y > grid.height + (elementHeight / 2.0)) {
						element.y = -1 * (elementHeight / 2.0);
					}
						
					var angle = getSpriteAngle(element.sprite);
					angle = angle > 360 ? angle - 360 : angle + 0.8;
					setSpriteAngle(element.sprite, angle);
				}
			},
			{
				name: "shroom",
				sprite: createSprite(asset_texture_visu_shroom_01, 0, 0.2, 0.2, 0.7, 0.0, c_white),
				x: 0.6,
				y: 0.0,
				state: {
					speed: 0.003
				},
				handler: function(grid, element) {
					element.y += element.state.speed;
					
					var surfaceWidth = grid.pixelWidth
					var surfaceHeight = grid.pixelHeight
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
				sprite: createSprite(asset_texture_visu_shroom_01, 0, 0.5, 0.5, 0.9, 0.0, c_white),
				x: 0.1,
				y: 0.0,
				state: {
					speed: 0.007
				},
				handler: function(grid, element) {
					element.y += element.state.speed;
					
					var surfaceWidth = grid.pixelWidth
					var surfaceHeight = grid.pixelHeight
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
				sprite: createSprite(asset_texture_visu_shroom_01, 0, 0.5, 0.5, 0.9, 0.0, c_white),
				x: 1.2,
				y: 0.0,
				state: {
					speed: 0.006
				},
				handler: function(grid, element) {
					element.y += element.state.speed;
					
					var surfaceWidth = grid.pixelWidth
					var surfaceHeight = grid.pixelHeight
					var texture = getSpriteAssetIndex(element.sprite);
					var elementWidth = Core.Assets.Texture.getWidth(texture) / surfaceWidth;
					var elementHeight = Core.Assets.Texture.getHeight(texture) / surfaceHeight;
					
					if (element.y > grid.height + (elementHeight / 2.0)) {
						element.y = -1 * (elementHeight / 2.0);
					}
				}
			},
			{
				name: "player",
				sprite: createSprite(asset_texture_visu_player, 0, 0.5, 0.5, 1.0, 0.0, c_white),
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
		),
		update: function(grid) {
			Core.Collections.Lists.forEach(grid.elements, function(element, grid) {
					element.handler(grid, element);
				}, grid);
			
			grid.view.update(grid);
		},
		render: function(grid, surface, wireframeSurface) {
		
			if (!Core.Surfaces.is(surface)) {
				throw "Cannot render grid on non-existing surface"
			}
			
			if (!Core.Surfaces.is(wireframeSurface)) {
				throw "Cannot render grid on non-existing surface"
			}
			
			Core.Surfaces.renderToSurface(wireframeSurface, function(surface, grid) {
				
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
			}, grid);
			Core.Surfaces.renderToSurface(surface, function(surface, grid) {
				
					Core.GPU.renderClearColor(GM_COLOR_BLACK, 0.0);
					var surfaceWidth = Core.Surfaces.getWidth(surface);
					var surfaceHeight = Core.Surfaces.getHeight(surface);
					if (Core.Collections.Lists.size(grid.elements) > 0) {
						Core.Collections.Lists.forEach(grid.elements, function(element, data) {
							
							var grid = data.grid;
							var surfaceWidth = data.surfaceWidth;
							var surfaceHeight = data.surfaceHeight;
							var texture = getSpriteAssetIndex(element.sprite);
							var xScale = getSpriteXScale(element.sprite);
							var yScale = getSpriteYScale(element.sprite);
							var elementWidth = (Core.Assets.Texture.getWidth(texture) / surfaceWidth) * xScale;
							var elementHeight = (Core.Assets.Texture.getHeight(texture) / surfaceHeight) * yScale;
							var viewX = grid.view.x;
							var viewY = grid.view.y;
							var viewWidth = grid.view.width;
							
							var renderXPosition = null;
							var renderYPosition = null;
							if ((Core.Numbers.isBetween(element.x + (elementWidth / 2.0), viewX, viewX + viewWidth))
								|| (Core.Numbers.isBetween(element.x - (elementWidth / 2.0), viewX, viewX + viewWidth))) {
							
								renderXPosition = (element.x - viewX) * surfaceWidth;
								renderYPosition = (element.y - viewY) * surfaceHeight;
							}
							
							if ((!isNumber(renderXPosition)) 
								&& (viewX < 0.0)) {
									
								var viewXOffset = grid.width + viewX;
								if ((Core.Numbers.isBetween(element.x + (elementWidth / 2.0), viewXOffset, grid.width))
									|| (Core.Numbers.isBetween(element.x - (elementWidth / 2.0), viewXOffset, grid.width))) {
									
									renderXPosition = ((element.x - grid.width) - viewX) * surfaceWidth;
									renderYPosition = ((element.y) - viewY) * surfaceHeight;
								}
							}
							
							if ((!isNumber(renderXPosition)) 
								&& (viewX + viewWidth + (elementWidth / 2.0) > grid.width)) {
								
								var viewXOffset = viewWidth - (grid.width - viewX);
								if ((Core.Numbers.isBetween(element.x + (elementWidth / 2.0), -1 * (elementWidth / 2.0), viewXOffset))
									|| (Core.Numbers.isBetween(element.x - (elementWidth / 2.0), -1 * (elementWidth / 2.0), viewXOffset))) {
									
									renderXPosition = ((element.x + grid.width) - viewX) * surfaceWidth;
									renderYPosition = ((element.y) - viewY) * surfaceHeight;
									
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
	return grid;
}

///@function appendPointToVertexBuffer(vbuffer, xx, yy, zz, nx, ny, nz, utex, vtex, color, alpha)
///@param {VertexBuffer} vbuffer
///@param xx
///@param yy
///@param zz
///@param nx
///@param ny
///@param nz
///@param utex
///@param vtex
///@param color
///@param alpha
function appendPointToVertexBuffer(vbuffer, xx, yy, zz, nx, ny, nz, utex, vtex, color, alpha) {

	vertex_position_3d(vbuffer, xx, yy, zz);
	vertex_normal(vbuffer, nx, ny, nz);
	vertex_texcoord(vbuffer, utex, vtex);
	vertex_color(vbuffer, color, alpha);
}
