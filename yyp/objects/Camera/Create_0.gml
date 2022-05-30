///@description create()

	registerContext(this);
	
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
	cameraSpeed = 5;//getPropertyReal("camera.speed", 1.0);
		
	///@type {Number}
	cameraMaxSpeed = getPropertyReal("camera.maxSpeed", 4.0);
		
	///@type {Number}
	cameraTurboSpeed = 0.7;//getPropertyReal("camera.turboSpeed", 16.0);
		
	///@type {Number}
	cameraAcceleration = getPropertyReal("camera.acceleration", 0.1);
		
	///@type {Number}
	cameraFriction = getPropertyReal("camera.friction", 0.2);
		
	///@type {Number}
	cameraXPosition = 0;
		
	///@type {Number}
	cameraYPosition = 0;
		
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
	cameraZPosition = getPropertyReal("camera.zPosition", -384);
		
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
	
	#region Initialize view
	
	view_enabled = true;
		
	view_set_visible(view, true);
	camera_set_proj_mat(camera, projectionMatrix);
		
	view_set_camera(0, camera);
	camera_set_update_script(camera, cameraUpdate);
	camera_set_view_size(camera, global.viewWidth, global.viewHeight);
		
	cameraChange();
	
	#endregion
	
