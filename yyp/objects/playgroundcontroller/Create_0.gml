/// @description GMObject.create()

	super()
	
	var grid = {
		width: 2.0,
		height: 1.5,
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
				sprite: createSprite(asset_texture_visu_shroom_01, 0, 1.0, 1.0, 1.0, 0.0, c_white),
				x: 0.6,
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
			surface: null,
			grid: grid,
		},
		create: method(this, function() {
			this.GMObject.state.surface = Core.Surfaces.get(
				this.GMObject.state.surface, 
				this.GMObject.state.grid.pixelWidth, 
				this.GMObject.state.grid.pixelHeight, 
				true
			);
		}),
		update: method(this, function() {
			this.GMObject.state.grid.update(this.GMObject.state.grid);
			this.mouseLook();
					
		    if (keyboard_check_direct(vk_escape)) {
		        game_end();
		    }
		}),
		preRender: method(this, function() {
			
			this.GMObject.state.surface = Core.Surfaces.get(
				this.GMObject.state.surface, 
				this.GMObject.state.grid.pixelWidth, 
				this.GMObject.state.grid.pixelHeight, 
				true
			);
			this.GMObject.state.grid.render(this.GMObject.state.grid, this.GMObject.state.surface);
		}),
		render: method(this, function() {
			
			Core.GPU.renderClearColor(GM_COLOR_BLACK, 1.0);
			
			var camera = camera_get_active();
			var camera_distance = 160;
			var xto = this.x;
			var yto = this.y;
			var zto = this.z;
			var xfrom = xto + camera_distance * dcos(this.look_dir) * dcos(this.look_pitch);
			var yfrom = yto - camera_distance * dsin(this.look_dir) * dcos(this.look_pitch);
			var zfrom = zto - camera_distance * dsin(this.look_pitch);

			this.viewMatrix = matrix_build_lookat(xfrom, yfrom, zfrom, xto, yto, zto, 0, 0, 1);
			this.projectionMatrix = matrix_build_projection_perspective_fov(-60, -window_get_width() / window_get_height(), 1, 32000);
			camera_set_view_mat(camera, this.viewMatrix);
			camera_set_proj_mat(camera, this.projectionMatrix);
			camera_apply(camera);
			
			var surfaceTexture = surface_get_texture(this.GMObject.state.surface);
			vertex_submit(this.vertexBuffer, pr_trianglelist, surfaceTexture);
		}),
		renderGUI: method(this, function() {
			
			//Core.GPU.renderClearColor(GM_COLOR_BLACK, 0.0);
			//Core.Surfaces.render(this.GMObject.state.surface, 0.0, 0.0);
			
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
	
	#region 3D
	applicationSurface = Core.Surfaces.create(GuiWidth, GuiHeight, false);
	x = 1024;
	y = 1920;
	z = 1024;
	look_dir = 270;
	look_pitch = -60;
	viewMatrix = null;
	projectionMatrix = null;
	isMouseLookEnabled = false
	mouseLook = method(this, function() {
		
		this.isMouseLookEnabled = keyboard_check_pressed(vk_space)
			? !this.isMouseLookEnabled 
			: this.isMouseLookEnabled;
		
		if (this.isMouseLookEnabled) {
			
			this.look_dir -= (window_mouse_get_x() - window_get_width() / 2) / 10;
		    this.look_pitch -= (window_mouse_get_y() - window_get_height() / 2) / 10;
		    this.look_pitch = clamp(this.look_pitch, -85, 85);
		    window_mouse_set(window_get_width() / 2, window_get_height() / 2);
		}

	    var move_speed = 4;
	    var dx = 0;
	    var dy = 0;
		
	    if (keyboard_check(ord("A"))) {
	        dx += dsin(look_dir) * move_speed;
	        dy += dcos(look_dir) * move_speed;
	    }

	    if (keyboard_check(ord("D"))) {
	        dx -= dsin(look_dir) * move_speed;
	        dy -= dcos(look_dir) * move_speed;
	    }

	    if (keyboard_check(ord("W"))) {
	        dx -= dcos(look_dir) * move_speed;
	        dy += dsin(look_dir) * move_speed;
	    }

	    if (keyboard_check(ord("S"))) {
	        dx += dcos(look_dir) * move_speed;
	        dy -= dsin(look_dir) * move_speed;
	    }
		
		if (keyboard_check(ord("Q"))) {
	        this.z += 1;
	    }

	    if (keyboard_check(ord("E"))) {
	        this.z -= 1;
	    }
		
		this.x += dx;
		this.y += dy;
		
		//print(look_dir, look_pitch, this.x, this.y, this.z);
	});
	
	gpu_set_ztestenable(true);
	gpu_set_zwriteenable(true);
	gpu_set_cullmode(cull_counterclockwise);
	application_surface_draw_enable(false);
	
	vertex_format_begin();
	vertex_format_add_position_3d();
	vertex_format_add_normal();
	vertex_format_add_texcoord();
	vertex_format_add_color();
	vertexFormat = vertex_format_end();
	vertexBuffer = vertex_create_buffer();
	vertex_begin(vertexBuffer, vertexFormat);
	var s = 2048;
	for (var i = 0; i < room_width; i += s) {
	    for (var j = 0; j < room_height; j += s) {
	        var color = c_white;
        
	        #region add data to the vertex buffer
	        appendPointToVertexBuffer(vertexBuffer, i, j, 0,                  0, 0, 1,        0, 0,       color, 1);
	        appendPointToVertexBuffer(vertexBuffer, i + s, j, 0,              0, 0, 1,        1, 0,       color, 1);
	        appendPointToVertexBuffer(vertexBuffer, i + s, j + s, 0,          0, 0, 1,        1, 1,       color, 1);

	        appendPointToVertexBuffer(vertexBuffer, i + s, j + s, 0,          0, 0, 1,        1, 1,       color, 1);
	        appendPointToVertexBuffer(vertexBuffer, i, j + s, 0,              0, 0, 1,        0, 1,       color, 1);
	        appendPointToVertexBuffer(vertexBuffer, i, j, 0,                  0, 0, 1,        0, 0,       color, 1);
	        #endregion
	    }
	}
	vertex_end(vertexBuffer);
	#endregion