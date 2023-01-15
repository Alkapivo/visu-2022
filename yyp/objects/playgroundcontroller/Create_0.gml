/// @description GMObject.create()

	super()

	GMObject = {
		state: {
			surface: null,
			wireframeSurface: null,
			grid: null,
		},
		create: method(this, function(data) {
			
			this.GMObject.state.grid = data.grid;
			this.GMObject.state.surface = Core.Surfaces.get(
				this.GMObject.state.surface, 
				this.GMObject.state.grid.pixelWidth, 
				this.GMObject.state.grid.pixelHeight, 
				true
			);
			this.GMObject.state.wireframeSurface = Core.Surfaces.get(
				this.GMObject.state.wireframeSurface, 
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
			this.GMObject.state.wireframeSurface = Core.Surfaces.get(
				this.GMObject.state.wireframeSurface, 
				this.GMObject.state.grid.pixelWidth, 
				this.GMObject.state.grid.pixelHeight, 
				true
			);
			
			this.GMObject.state.grid.render(
				this.GMObject.state.grid, 
				this.GMObject.state.surface, 
				this.GMObject.state.wireframeSurface
			);
		}),
		render: method(this, function() {
			
			Core.Surfaces.setTarget(this.applicationSurface);
			Core.GPU.renderClearColor(GM_COLOR_BLACK, 1.0);
			
			var camera = camera_get_active();
			var camera_distance = 160;
			
			var xto = this.x;
			var yto = this.y;
			var zto = this.z;
			var xfrom = xto + camera_distance * dcos(this.cameraDirection) * dcos(this.cameraPitch);
			var yfrom = yto - camera_distance * dsin(this.cameraDirection) * dcos(this.cameraPitch);
			var zfrom = zto - camera_distance * dsin(this.cameraPitch);
			
			this.viewMatrix = matrix_build_lookat(xfrom, yfrom, zfrom, xto, yto, zto, 0, 0, 1);
			this.projectionMatrix = matrix_build_projection_perspective_fov(-60, -window_get_width() / window_get_height(), 1, 32000);
			camera_set_view_mat(camera, this.viewMatrix);
			camera_set_proj_mat(camera, this.projectionMatrix);
			camera_apply(camera);
			
			//(Core.Surfaces.getWidth(this.GMObject.state.wireframeSurface) * 0.5) / 2.0
			matrix_set(matrix_world, matrix_build(
				256, 0, 256, 
				0, 0, 0, 
				0.75, 1, 1
			));
			vertex_submit(this.vertexBuffer, pr_trianglelist, surface_get_texture(this.GMObject.state.wireframeSurface));
			matrix_set(matrix_world, matrix_build_identity());
			
			
			matrix_set(matrix_world, matrix_build(
				0, 0, 512, 
				0, 0, 0, 
				1, 1, 1
			));
			vertex_submit(this.vertexBuffer, pr_trianglelist, surface_get_texture(this.GMObject.state.surface));
			matrix_set(matrix_world, matrix_build_identity());
			
			Core.Surfaces.resetTarget();
		}),
		renderGUI: method(this, function() {
			
			Core.GPU.renderClearColor(GM_COLOR_BLACK, 0.0);
			Core.Surfaces.render(this.applicationSurface, 0.0, 0.0);
			
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

	this.GMObject.create({ grid: createGridManager() });
	
	#region 3D
	applicationSurface = Core.Surfaces.create(GuiWidth, GuiHeight, false);
	x = 1024;
	y = 2400;
	z = 512;
	cameraDirection = 270;
	cameraPitch = -30;
	viewMatrix = null;
	projectionMatrix = null;
	isMouseLookEnabled = false
	pitchTimer = 0.0;
	directionTimer = 0.0;
	mouseLook = method(this, function() {
		
		this.pitchTimer = incrementTimer(this.pitchTimer, pi * 2);
		this.directionTimer = incrementTimer(this.pitchTimer, pi * 2);
		//this.cameraPitch -= 
		//this.cameraDirection -= sin(this.directionTimer);
		this.z += cos(this.pitchTimer) * 4.0;
		
		this.isMouseLookEnabled = keyboard_check_pressed(vk_space)
			? !this.isMouseLookEnabled 
			: this.isMouseLookEnabled;
		
		if (this.isMouseLookEnabled) {
			
			this.cameraDirection -= (window_mouse_get_x() - window_get_width() / 2) / 10;
		    this.cameraPitch -= (window_mouse_get_y() - window_get_height() / 2) / 10;
		    this.cameraPitch = clamp(this.cameraPitch, -85, 85);
		    window_mouse_set(window_get_width() / 2, window_get_height() / 2);
		}

	    var move_speed = 16;
	    var dx = 0;
	    var dy = 0;
		var dz = 0;
		
	    if (keyboard_check(ord("A"))) {
	        dx += dsin(this.cameraDirection) * move_speed;
	        dy += dcos(this.cameraDirection) * move_speed;
			print(cameraDirection, cameraPitch, this.x, this.y, this.z);
	    }

	    if (keyboard_check(ord("D"))) {
	        dx -= dsin(this.cameraDirection) * move_speed;
	        dy -= dcos(this.cameraDirection) * move_speed;
			print(cameraDirection, cameraPitch, this.x, this.y, this.z);
	    }

	    if (keyboard_check(ord("W"))) {
	        dx -= dcos(this.cameraDirection) * move_speed;
	        dy += dsin(this.cameraDirection) * move_speed;
			print(cameraDirection, cameraPitch, this.x, this.y, this.z);
	    }

	    if (keyboard_check(ord("S"))) {
	        dx += dcos(this.cameraDirection) * move_speed;
	        dy -= dsin(this.cameraDirection) * move_speed;
			print(cameraDirection, cameraPitch, this.x, this.y, this.z);
	    }
		
		if (keyboard_check(ord("Q"))) {
	        dz += move_speed;
			print(cameraDirection, cameraPitch, this.x, this.y, this.z);
	    }

	    if (keyboard_check(ord("E"))) {
	        dz -= move_speed;
			print(cameraDirection, cameraPitch, this.x, this.y, this.z);
	    }
		
		this.x += dx;
		this.y += dy;
		this.z += dz;
	});
	
	gpu_set_ztestenable(true);
	gpu_set_zwriteenable(true);
	gpu_set_cullmode(cull_counterclockwise);
	application_surface_draw_enable(false);
	/*
	vertex_format_begin();
		vertex_format_add_position_3d();
		vertex_format_add_normal();
		vertex_format_add_texcoord();
		vertex_format_add_color();
	vertexFormat = vertex_format_end();
	vertexBuffer = vertex_create_buffer();
		
	vertex_begin(vertexBuffer, vertexFormat);
		var _width = this.GMObject.state.grid.pixelWidth;
		var _height = this.GMObject.state.grid.pixelHeight;
		var color = GM_COLOR_WHITE;
	
		appendPointToVertexBuffer(vertexBuffer, 0, 0, 0, 0, 0, 1, 0, 0, color, 1);
		appendPointToVertexBuffer(vertexBuffer, _width + _height, 0, 0, 0, 0, 1, 1, 0, color, 1);
		appendPointToVertexBuffer(vertexBuffer, _width + _height, _width, 0, 0, 0, 1, 1, 1, color, 1);

		appendPointToVertexBuffer(vertexBuffer, _width + _height, _width, 0, 0, 0, 1, 1, 1, color, 1);
		appendPointToVertexBuffer(vertexBuffer, 0, _width, 0, 0, 0, 1, 0, 1, color, 1);
		appendPointToVertexBuffer(vertexBuffer, 0, 0, 0, 0, 0, 1, 0, 0, color, 1);
	vertex_end(vertexBuffer);
	*/
	vertex_format_begin();
		vertex_format_add_position_3d();
		vertex_format_add_normal();
		vertex_format_add_texcoord();
		vertex_format_add_color();
	vertexFormat = vertex_format_end();
	vertexBuffer = vertex_create_buffer();
		
	vertex_begin(vertexBuffer, vertexFormat);
		var _width = 512;
		var _height = 512;
		var color = GM_COLOR_WHITE;
		
		appendPointToVertexBuffer(vertexBuffer, 0, 0, 0, 0, 0, 1, 0, 0, color, 1);
        appendPointToVertexBuffer(vertexBuffer, _width, 0, 0,  0, 0, 1, 1, 0, color, 1);
        appendPointToVertexBuffer(vertexBuffer, _width, _height, 0, 0, 0, 1, 1, 1, color, 1);

        appendPointToVertexBuffer(vertexBuffer, _width, _height, 0, 0, 0, 1, 1, 1, color, 1);
        appendPointToVertexBuffer(vertexBuffer, 0, _height, 0, 0, 0, 1, 0, 1, color, 1);
        appendPointToVertexBuffer(vertexBuffer, 0, 0, 0, 0, 0, 1, 0, 0, color, 1);
	vertex_end(vertexBuffer);
	
	var surfaceTexture = surface_get_texture(this.GMObject.state.wireframeSurface);
	vertex_submit(this.vertexBuffer, pr_trianglelist, surfaceTexture);
	
	#endregion