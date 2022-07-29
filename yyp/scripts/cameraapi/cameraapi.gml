///@export cameraChange()
///@export cameraUpdate()
///@export getCameraReference(): Camera
///@export getCameraX(): Number
///@export getCameraY(): Number
///@export createCamera(Layer)
///@export deregisterSceneCamera() 
///@export getCamera(): Camera
///@export registerSceneCamera(Camera)
	
///@description Change Camera between 2D and 3D mode.
function cameraChange() {

	var camera = getCamera();
	if ((isInstanceTypeOf(camera, Camera)) &&
		(instanceExists(camera))) {
			
		var gmCamera = view_camera[camera.view];
		camera_destroy(gmCamera);
	
		if (camera.isMode3D) {
			var cameraReference = camera_create();
		
			view_enabled = true;
			view_set_visible(camera.view, true);
		
			camera.camera = cameraReference;
			camera.projectionMatrix = matrix_build_projection_perspective_fov(
				-60,
				-ViewWidth/ViewHeight, 
				32, 
				32000
			);
			
			camera_set_proj_mat(cameraReference, camera.projectionMatrix);
			view_set_camera(camera.view, cameraReference);
			camera_set_update_script(cameraReference, cameraUpdate);
			
			application_surface_draw_enable(true);
			gpu_set_zwriteenable(true); // Enables writing to the z-buffer
			gpu_set_ztestenable(true); // Enables the depth testing, so far away things are drawn beind closer things
			gpu_set_cullmode(cull_counterclockwise);
			gpu_set_texfilter(true);
			
			camera.cameraXPosition = 286.83;
			camera.cameraYPosition = 613.66;
			camera.cameraZPosition = 463.65;
			camera.cameraDirection = 88.60;
			camera.cameraPitch = 1.0;
		} else {
			
			var cameraReference = camera_create();
			
			view_enabled = true;
			view_set_visible(camera.view, true);
			
			camera.camera = cameraReference;
			camera.projectionMatrix = matrix_build_projection_ortho(
				ViewWidth, 
				ViewHeight, 
				1, 
				2048
			);
			
			camera_set_proj_mat(cameraReference, camera.projectionMatrix);
			view_set_camera(camera.view, cameraReference);
			camera_set_view_size(cameraReference, ViewWidth, ViewHeight);
			camera_set_view_pos(cameraReference, 0, 0);
			camera_set_update_script(cameraReference, cameraUpdate);
			
			application_surface_draw_enable(false);
			gpu_set_zwriteenable(false);
			gpu_set_ztestenable(false);
			gpu_set_cullmode(cull_noculling);
		}	
	}
}

///@description Matrix builder, used when Camera is in 3D mode.
function cameraUpdate() {

	var camera = getCamera();
	
	if (camera.isMode3D) {
		var matrix = matrix_build_lookat(
			camera.cameraXPosition, 
			camera.cameraYPosition, 
			camera.cameraZPosition,	
			camera.cameraXPosition + dcos(camera.cameraDirection), 
			camera.cameraYPosition - dsin(camera.cameraDirection), 
			camera.cameraZPosition - dcos(camera.cameraPitch) * 2, 
			0, 
			0, 
			1
		);
		var gmCamera = view_camera[camera.view];
		
		camera_set_view_mat(gmCamera, matrix);	
	}
}

///@return {Camera} camera
function getCameraReference() {

	return global.cameraContext == null ? null : global.cameraContext.camera;
}
	
///@return {Number}
function getCameraX() {

	var camera = getCamera();
	
	if (camera == null) {
		
		return mouse_x;	
	} else {
		
		return camera.cameraXPosition;
	}
}
	
///@return {Number}
function getCameraY() {

	var camera = getCamera();
	
		if (camera == null) {
			return mouse_y;	
		} else {
			return camera.cameraYPosition;
		}


}
		
///@param {Layer} [layerId=getRenderLayer()]
///@return {Camera} camera
function createCamera() {

	var layerId = argument_count > 0 ? argument[0] : getRenderLayer();
	var camera = createEmptyOptional();

	if (instance_exists(Camera)) {
		
		camera = Camera.id;
		logger("Camera already initialized", LogType.WARNING);
	} else {
		
		camera = construct(Camera, layerId);
		logger("Camera initialized", LogType.INFO);
	}
	
	return camera;
}

///@description Deregister current SceneCamera bean.
function deregisterSceneCamera() {

	var contextName = "sceneCameraContext";
	
	if (globalVariableExists(contextName)) {
		var contextValue = getGlobalVariable(contextName);
		if (!isOptionalPresent(contextValue)) {
			throwException(
				createException(
					RuntimeException, 
					stringParams("SceneController {0} was already deregistered", contextName), 
					runtimeExceptionHandler
				)
			);
		}
		setGlobalVariable(contextName, null);
		logger("SceneController {0} was deregistered", LogType.DEBUG, contextName);
	} else {
		throwException(
			createException(
				RuntimeException, 
				stringParams("Trying to unregister context {0} that has not been registered", LogType.ERROR, contextName), 
				runtimeExceptionHandler
			)
		);
	}
}
	
///@return {Camera} camera
function getCamera() {

	return global.cameraContext;
}
	
///@description Register passed context as SceneCamera bean.
///@param {?Camera} camera
function registerSceneCamera(camera) {

	var contextName = "sceneCameraContext";	
	if (globalVariableExists(contextName)) {
		var contextValue = variable_global_get(contextName);
		if (!isOptionalPresent(contextValue)) {
			throwException(
				createException(
					RuntimeException, 
					stringParams("Trying to set context for variable {0} which already exists", contextName), 
					runtimeExceptionHandler
				)
			);
		} else {
			setGlobalVariable(contextName, camera);
			logger("SceneCamera {0} was registered", LogType.DEBUG, contextName);
		}
	}
}
