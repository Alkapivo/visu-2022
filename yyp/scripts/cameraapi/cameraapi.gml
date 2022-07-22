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
				45, 
				GuiWidth /GuiHeight, 
				1, 
				2048);

			camera.cameraXPosition += global.viewWidth * 0.5;
			camera.cameraYPosition += global.viewHeight * 0.5;
			camera_set_proj_mat(cameraReference, camera.projectionMatrix);
			view_set_camera(camera.view, cameraReference);
			camera_set_update_script(cameraReference, cameraUpdate);
		} else {
			
			var cameraReference = camera_create();
			camera.camera = cameraReference;
			camera.projectionMatrix = matrix_build_projection_ortho(
				global.viewWidth, 
				global.viewHeight, 
				1, 
				2048);
			camera.cameraXPosition -= global.viewWidth * 0.5;
			camera.cameraYPosition -= global.viewHeight * 0.5;
			
			camera_set_proj_mat(cameraReference, camera.projectionMatrix);
			view_set_camera(camera.view, cameraReference);
			camera_set_view_size(cameraReference, global.viewWidth, global.viewHeight);
			camera_set_view_pos(cameraReference, camera.cameraXPosition, camera.cameraYPosition);
			camera_set_update_script(cameraReference, cameraUpdate);
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
