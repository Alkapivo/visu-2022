///@description create()

	#region Fields
	
///@public:

	///@type {Camera}
	camera = camera_create();
	
	///@type {Integer}
	view = 0;
	
	///@type {ProjectionMatrix}
	projectionMatrix = matrix_build_projection_perspective_fov(45, view_get_wport(0)/view_get_hport(0), 1, 32000);
	
	///@type {AssetScript}
	updateScript = cameraUpdate;
	
	///@type {AssetScript}
	changeScript = cameraChange;
	
	///@type {Number}
	cameraShake = 0.0;
	
	///@type {Number}
	cameraShakeFactor = 0.5;
	
	
///@private:

	// 2D	
	
	///@type {Number}
	cameraSpeed = getPropertyReal("camera.speed", 1.0);
		
	///@type {Number}
	cameraMaxSpeed = getPropertyReal("camera.maxSpeed", 4.0);
		
	///@type {Number}
	cameraTurboSpeed = getPropertyReal("camera.turboSpeed", 16.0);
		
	///@type {Number}
	cameraAcceleration = getPropertyReal("camera.acceleration", 0.1);
		
	///@type {Number}
	cameraFriction = getPropertyReal("camera.friction", 0.2);
		
	///@type {Number}
	cameraXPosition = getPropertyReal("camera.cameraXPosition", 0);
		
	///@type {Number}
	cameraYPosition = getPropertyReal("camera.cameraYPosition", 0);
		
	///@type {Number}
	cameraVerticalSpeed = 0;
		
	///@type {Number}
	cameraHorizontalSpeed = 0;
		
	///@type {Number}
	cameraAngle = 0;
		
	///@type {Optional<~Camera>}
	cameraTarget = null;
	
	// 3D
		
	///@type {Number}
	cameraZPosition = getPropertyReal("camera.cameraZPosition", 0);
		
	///@type {Boolean}
	isMode3D = false;
		
	///@type {Number}
	cameraPitch = getPropertyReal("camera.pitch", 160.0);
		
	///@type {Number}
	cameraDirection = getPropertyReal("camera.direction", 90.0);
		
	///@type {Boolean}
	mouseLookChecked = false;
		
	///@type {Boolean}
	mouseLookAvailable = false;
	
	#endregion
	
	GMObject = {
		create: method(this, function() {
			
			registerContext(this);
			
			view_enabled = true;
		
			view_set_visible(this.view, true);
			camera_set_proj_mat(this.camera, this.projectionMatrix);
		
			view_set_camera(0, this.camera);
			camera_set_update_script(this.camera, cameraUpdate);
			camera_set_view_size(this.camera, ViewWidth, ViewHeight);
		
			cameraChange();
		}),
		updateEnd: method(this, function() {
			
			if keyboard_check_pressed(vk_f5) {
			
				this.isMode3D = !this.isMode3D
				window_set_cursor(cr_default);
				cameraChange();
			}
	
			if (this.isMode3D) {
		
		
				#region 3D mode
		
				#region Mouse look
				if (mouse_check_button(mb_left)) {
			
					#region Resolve if mouse isn't on any window
					if (!this.mouseLookChecked) {
						
						this.mouseLookAvailable = true;
						this.mouseLookChecked = true;
					}
					#endregion
		
					#region Mouse look
					if (this.mouseLookAvailable) {
				
						var windowWidth = window_get_width();
						var windowHeight = window_get_height();
						var mouseX = window_mouse_get_x();
						var mouseY = window_mouse_get_y();
				
						this.cameraDirection -= (mouseX - (windowWidth / 2.0)) / 10.0;
						this.cameraPitch += (mouseY - (windowHeight / 2.0)) / 10.0;
						var windowX = window_get_x() + (windowWidth / 2.0)
						var windowY = window_get_y() + (windowHeight / 2.0);
						display_mouse_set(windowX, windowY);
						window_set_cursor(cr_none);
					}
					#endregion
				}
		
				if (mouse_check_button_released(mb_left)) {
					this.mouseLookChecked = false;	
					window_set_cursor(cr_default);
				}
				#endregion

				#region Camera keyboard move
				var spd = keyboard_check(vk_shift) ? 3 : 8;
		
				if (keyboard_check(ord("W"))) {
					this.cameraXPosition += dcos(this.cameraDirection) * (spd * getDeltaTimeValue());
					this.cameraYPosition -= dsin(this.cameraDirection) * (spd * getDeltaTimeValue());
				}
				if (keyboard_check(ord("A"))) {
					this.cameraXPosition -= dsin(this.cameraDirection) * (spd * getDeltaTimeValue());
					this.cameraYPosition -= dcos(this.cameraDirection) * (spd * getDeltaTimeValue());
				}
				if (keyboard_check(ord("S"))) {
					this.cameraXPosition -= dcos(this.cameraDirection) * (spd * getDeltaTimeValue());
					this.cameraYPosition += dsin(this.cameraDirection) * (spd * getDeltaTimeValue());
				}
				if (keyboard_check(ord("D"))) {
					this.cameraXPosition += dsin(this.cameraDirection) * (spd * getDeltaTimeValue());
					this.cameraYPosition += dcos(this.cameraDirection) * (spd * getDeltaTimeValue());
				}
				if (keyboard_check(ord("E"))) {
					this.cameraZPosition += (spd * getDeltaTimeValue());
				}
				if (keyboard_check(ord("Q"))) {
					this.cameraZPosition -= (spd * getDeltaTimeValue());
				}
				#endregion
		
				var worldWidth = room_width;
				var worldHeight = room_height;
				this.cameraXPosition = clamp(this.cameraXPosition, 0, worldWidth);
				this.cameraYPosition = clamp(this.cameraYPosition, 0, worldHeight);
		
				print(this.cameraXPosition, this.cameraYPosition, this.cameraZPosition, this.cameraDirection, this.cameraPitch);
				#endregion
		
			} else {
		
				#region 2D mode
				this.cameraXPosition = 0;
				this.cameraYPosition = 0;
		
				if (instanceExists(cameraTarget)) {
			
					if (global.cameraSmoothFactor > 1.0) {
				
						this.cameraXPosition += (((this.cameraTarget.x - (ViewWidth / 2.0)) - this.cameraXPosition) / global.cameraSmoothFactor);
						this.cameraYPosition += (((this.cameraTarget.y - (ViewHeight / 2.0)) - this.cameraYPosition) / global.cameraSmoothFactor);	
					} else {
				
						this.cameraXPosition = ceil(this.cameraTarget.x - (ViewWidth / 2.0));
						this.cameraYPosition = ceil(this.cameraTarget.y - (ViewHeight / 2.0));	
					}
				}
		
				#region Camera shake
				var xDirection = cos(this.cameraShake) > 0 ? 1 : -1;
				var yDirection = sin(this.cameraShake) > 0 ? 1 : -1;
				var xCameraShake = this.cameraShake > 0 ? 
					(random(this.cameraShake * 0.7) + (this.cameraShake * 0.3)) * xDirection :
					0.0;
				var yCameraShake = this.cameraShake > 0 ?
					(random(this.cameraShake * 0.7) + (this.cameraShake * 0.3)) * yDirection :
					0.0;
		
				var maxCameraShake = 20;
				if (this.cameraShake > 0) {
					this.cameraShake = clamp(this.cameraShake - applyDeltaTime(this.cameraShakeFactor), 0, maxCameraShake);
				}
				#endregion
		
				camera_set_view_pos(this.camera, this.cameraXPosition, this.cameraYPosition);
				//print(this.cameraXPosition, this.cameraYPosition, this.cameraZPosition);
				#endregion
			}
	

		}),
		render: method(this, function() {
			
		}),
		cleanUp: method(this, function() {
			camera_destroy(this.camera);
			deregisterContext(this);
		})
	}
	
	this.GMObject.create();
	
