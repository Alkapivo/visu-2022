///@description Mouse look

	#region Change camera 2D-3D
	///@todo remove;
	var IsWorldInitialized = true
	if (IsWorldInitialized) {
		
		/*
		if keyboard_check_pressed(vk_f5) {
			
			this.isMode3D = !this.isMode3D;
			window_set_cursor(cr_default);
			cameraChange();
		}
		*/
		
		/*
		if keyboard_check_pressed(vk_f5) {		
			//this.isMode3D = !this.isMode3D;
			//window_set_cursor(cr_default);
			//cameraChange();
			
			var menuEntries = generateSaveGameMenuEntries();
			if ((isDataStructure(menuEntries, List)) &&
				(getListSize(menuEntries) > 0)) {
				
				var menuEntry = menuEntries[| 0];
				if (isEntity(menuEntry, MenuEntry)) {
					
					var actionHandler = getMenuEntryActionHandler(menuEntry);
					var actionData = getMenuEntryActionData(menuEntry);
					sendNotification("AUTOSAVE - 01", c_aqua);
					runScript(actionHandler, this, actionData);	
				}
			}
		}
		
		if keyboard_check_pressed(vk_f6) {
			
			var menuEntries = generateLoadGameMenuEntries();
			if ((isDataStructure(menuEntries, List)) &&
				(getListSize(menuEntries) > 0)) {
				
				var menuEntry = menuEntries[| 0];
				if (isEntity(menuEntry, MenuEntry)) {
					
					var actionHandler = getMenuEntryActionHandler(menuEntry);
					var actionData = getMenuEntryActionData(menuEntry);
					sendNotification("LOAD AUTOSAVE - 01", c_aqua);
					runScript(actionHandler, this, actionData);	
				}
			}
		}
		*/
	}
	#endregion
	
	#region Camera smooth factor
	var cameraSmoothFactorValue = 0.2;
	var cameraSmoothFactorMaxValue = 128;
	global.cameraSmoothFactor = clamp(
		global.cameraSmoothFactor - cameraSmoothFactorValue,
		1.0,
		cameraSmoothFactorMaxValue
	);
	
	if (instanceExists(cameraTarget)) {
	
		var ptd = point_distance(
			cameraTarget.x,
			cameraTarget.y,
			cameraXPosition + (ViewWidth / 2.0),
			cameraYPosition + (ViewHeight / 2.0)
		);
		
		if (ptd > 256) { 
			global.cameraSmoothFactor = 0;
		}
	}
	
	global.cameraSmoothConst = 0;
	if (global.cameraSmoothConst > 0.0) {
	
		global.cameraSmoothFactor = global.cameraSmoothConst + global.cameraSmoothFactor;
	}
	#endregion

	if (this.isMode3D) {
		
		
		#region 3D mode
		
		#region Mouse look
		if (mouse_check_button(mb_left)) {
			
			#region Resolve if mouse isn't on any window
			if (!mouseLookChecked) {
				mouseLookAvailable = true;
				var windowManager = getWindowManager(); 
				if (windowManager != null) {
					var windowsPipeline = windowManager.windowsPipeline;
					for (var index = 0; index < getListSize(windowsPipeline); index++) {
						var window = windowsPipeline[| index];	
						if (!isUndefined(window)) {
							var isPointInRectangle = point_in_rectangle(
								getMouseGuiX(), 
								getMouseGuiY(),
								window.xAnchor,
								window.yAnchor,
								window.xAnchor + window.width,
								window.yAnchor + window.height);
							if (isPointInRectangle) {
								mouseLookAvailable = false;
							}
						}
					}
				}
				mouseLookChecked = true;
			}
			#endregion
		
			#region Mouse look
			if (mouseLookAvailable) {
				
				var windowWidth = window_get_width();
				var windowHeight = window_get_height();
				var mouseX = window_mouse_get_x();
				var mouseY = window_mouse_get_y();
				
				cameraDirection -= (mouseX - (windowWidth / 2.0)) / 10.0;
				cameraPitch += (mouseY - (windowHeight / 2.0)) / 10.0;
				var windowX = window_get_x() + (windowWidth / 2.0)
				var windowY = window_get_y() + (windowHeight / 2.0);
				display_mouse_set(windowX, windowY);
				window_set_cursor(cr_none);
			}
			#endregion
		}
		
		if (mouse_check_button_released(mb_left)) {
			mouseLookChecked = false;	
			window_set_cursor(cr_default);
		}
		#endregion

		#region Camera keyboard move
		var spd = keyboard_check(vk_shift) ? 0.25 : 1;
		
		if (keyboard_check(ord("W"))) {
			cameraXPosition += dcos(cameraDirection) * (spd * getDeltaTimeValue());
			cameraYPosition -= dsin(cameraDirection) * (spd * getDeltaTimeValue());
		}
		if (keyboard_check(ord("A"))) {
			cameraXPosition -= dsin(cameraDirection) * (spd * getDeltaTimeValue());
			cameraYPosition -= dcos(cameraDirection) * (spd * getDeltaTimeValue());
		}
		if (keyboard_check(ord("S"))) {
			cameraXPosition -= dcos(cameraDirection) * (spd * getDeltaTimeValue());
			cameraYPosition += dsin(cameraDirection) * (spd * getDeltaTimeValue());
		}
		if (keyboard_check(ord("D"))) {
			cameraXPosition += dsin(cameraDirection) * (spd * getDeltaTimeValue());
			cameraYPosition += dcos(cameraDirection) * (spd * getDeltaTimeValue());
		}
		if (keyboard_check(ord("E"))) {
			cameraZPosition += (spd * getDeltaTimeValue());
		}
		if (keyboard_check(ord("Q"))) {
			cameraZPosition -= (spd * getDeltaTimeValue());
		}
		#endregion
		
		var worldWidth = room_width;
		var worldHeight = room_height;
		cameraXPosition = clamp(cameraXPosition, 0, worldWidth - global.viewWidth);
		cameraYPosition = clamp(cameraYPosition, 0, worldHeight - global.viewHeight);
		
		#endregion
		
	} else {
		
		#region 2D mode
		var worldWidth = room_width;
		var worldHeight = room_height;
		cameraXPosition = clamp(cameraXPosition, 0, worldWidth - global.viewWidth);
		cameraYPosition = clamp(cameraYPosition, 0, worldHeight - global.viewHeight);
		
		if (instanceExists(cameraTarget)) {
			
			if (global.cameraSmoothFactor > 1.0) {
				
				cameraXPosition += (((cameraTarget.x - (global.viewWidth / 2.0)) - cameraXPosition) / global.cameraSmoothFactor);
				cameraYPosition += (((cameraTarget.y - (global.viewHeight / 2.0)) - cameraYPosition) / global.cameraSmoothFactor);	
			} else {
				
				cameraXPosition = ceil(cameraTarget.x - (global.viewWidth / 2.0));
				cameraYPosition = ceil(cameraTarget.y - (global.viewHeight / 2.0));	
			}
		}
		
		#region Camera shake
		var xDirection = cos(cameraShake) > 0 ? 1 : -1;
		var yDirection = sin(cameraShake) > 0 ? 1 : -1;
		var xCameraShake = cameraShake > 0 ? 
			(random(cameraShake * 0.7) + (cameraShake * 0.3)) * xDirection :
			0.0;
		var yCameraShake = cameraShake > 0 ?
			(random(cameraShake * 0.7) + (cameraShake * 0.3)) * yDirection :
			0.0;
		
		var maxCameraShake = 20;
		if (cameraShake > 0) {
			cameraShake = clamp(cameraShake - applyDeltaTime(cameraShakeFactor), 0, maxCameraShake);
		}
		#endregion
		
		camera_set_view_pos(camera, cameraXPosition, cameraYPosition);
		#endregion
		
	}
	
