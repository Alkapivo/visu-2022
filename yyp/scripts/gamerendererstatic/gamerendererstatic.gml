///@function getGameRendererShaderHandlers()
///@description Getter.
///@return {Map<AssetShader::AssetScript>} shaderHandlers
function getGameRendererShaderHandlers() {

	if (isOptionalPresent(getPlaygroundController())) {
		return getPlaygroundController().shaderHandlers;
	}
	
	if (isOptionalPresent(getGameRenderer())) {
		return getGameRenderer().shaderHandlers;
	}
}

///@function getGameRendererShaderPipelines()
///@description Getter.
///@return {Map<String::ShaderPipeline} shaderPipelines
function getGameRendererShaderPipelines() {

	if (isOptionalPresent(getPlaygroundController())) {
		return getPlaygroundController().shaderPipelines;
	}
	
	if (isOptionalPresent(getGameRenderer())) {
		return getGameRenderer().shaderPipelines;
	}
}

///@function getGameRendererShaderPipelinesNames()
///@description Getter.
///@return {List<String>}
function getGameRendererShaderPipelinesNames() {

	if (isOptionalPresent(getPlaygroundController())) {
		return getPlaygroundController().shaderPipelinesNames;
	}
	
	if (isOptionalPresent(getGameRenderer())) {
		return getGameRenderer().shaderPipelinesNames;
	}	
}

///@function getGameRendererShaderUniformSetters()
///@description Getter.
///@return {Map<AssetShader::AssetScript>} shaderUniformSetters
function getGameRendererShaderUniformSetters() {

	if (isOptionalPresent(getPlaygroundController())) {
		return getPlaygroundController().shaderUniformSetters;
	}
	
	if (isOptionalPresent(getGameRenderer())) {
		return getGameRenderer().shaderUniformSetters;
	}
}
///@function jumbotronScoreboardHandler(state)
///@description Render and resolve logic of jumbotron scoreboard.
///@param {Map<String::Object>} state
function jumbotronScoreboardHandler(argument0) {

		var state = argument0;
	
		var inputHandler = getSceneControllerInputHandler();
	
		if (isOptionalPresent(inputHandler)) {
			var options = getValueFromMap(state, "options", 
				createList(
					createTuple(asset_texture_empty, jumbotronScoreboardOptionRestart),
					createTuple(asset_texture_empty, jumbotronScoreboardOptionShare),
					createTuple(asset_texture_empty, jumbotronScoreboardOptionYoutube)
				)
			);
			var gameFinished = getValueFromMap(state, "gameFinished", false);
			if (!gameFinished) {
				
			}
			state[? "gameFinished"] = true;
		
			var optionsSize = getListSize(options);
			var pointer = getValueFromMap(state, "pointer", 0);			
			var elementWidth = sprite_get_width(asset_texture_empty);
			var elementHeight = sprite_get_height(asset_texture_empty);
			var elementMargin = 12;
			var orientation = ScreenOrientation.VERTICAL;
			var cooldown = getValueFromMap(state, "cooldown", 0.0);
			var theta = getValueFromMap(state, "theta", incrementTimer(0.0, 1.0, 1 / GAME_FPS));
		
			var previousOptionKeyPressed = orientation == ScreenOrientation.HORIZONTAL ? (
				getKeyStatePressed(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_LEFT)) ||
				getKeyStatePressed(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_A))
			) : (
				getKeyStatePressed(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_UP)) ||
				getKeyStatePressed(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_W))
			);
			var nextOptionKeyPressed = orientation == ScreenOrientation.HORIZONTAL ? (
				getKeyStatePressed(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_RIGHT)) ||
				getKeyStatePressed(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_D))
			) : (
				getKeyStatePressed(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_DOWN)) ||
				getKeyStatePressed(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_S))
			);
			var actionKeyPressed = 
				getKeyStatePressed(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_UP)) ||
				getKeyStatePressed(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_Z)) ||
				getKeyStatePressed(getInputHandlerKeyState(inputHandler, KeyboardKeyType.KEY_SPACE));
		
			pointer = clamp(pointer + (previousOptionKeyPressed ? -1 : 0) + (nextOptionKeyPressed ? 1 : 0), 0, optionsSize - 1);
			state[? "pointer"] = pointer;
		
			if (actionKeyPressed) {
				var option = options[| pointer];
				var handler = getTupleValue(option);
				cooldown = 0.7;
				if (isOptionalPresent(handler)) {
					runScript(handler);	
				}
			}
		
			if (cooldown > 0) {
				cooldown -=  0.1 * getDeltaTimeValue();
			}
			state[? "cooldown"] = cooldown;
		
			var screenWidth = GuiWidth;
			var screenHeight = GuiHeight;
			switch (orientation) {
				case ScreenOrientation.HORIZONTAL:
					var xAnchor = screenWidth * 0.5;
					var yAnchor = screenHeight * 0.6;
					var firstElementX = xAnchor - (((elementWidth + (2 * elementMargin)) * optionsSize) / 2.0)
					var firstElementY = yAnchor + (elementHeight / 2.0);
					var scale = 1.0;
					for (var index = 0; index < optionsSize; index++) {
						var xPosition = firstElementX + ((elementWidth + (2 * elementMargin)) * index);
						var yPosition = firstElementY;
					
						var option = options[| index];
						var spriteAsset = getTupleKey(option);
						var blendMode = index == pointer ? c_lime : c_fuchsia;
						var alpha = index == pointer ? 1.0 - cooldown : 1.0;
					
						draw_sprite_ext(spriteAsset, 0, xPosition, yPosition, scale, scale, 0.0, blendMode, alpha);
					}
					break;
				case ScreenOrientation.VERTICAL:
					var xAnchor = screenWidth * 0.5;
					var yAnchor = screenHeight * 0.7;
					var firstElementX = xAnchor - (elementWidth / 2.0)
					var firstElementY = yAnchor - (((elementHeight + (2 * elementMargin)) * optionsSize) / 2.0);
					var scale = 1.0;
					for (var index = 0; index < optionsSize; index++) {
						var xPosition = firstElementX;
						var yPosition = firstElementY + ((elementHeight + 2 * elementMargin) * index);
					
						var option = options[| index];
						var spriteAsset = getTupleKey(option);
						var blendMode = index == pointer ? c_lime : c_fuchsia;
						var alpha = index == pointer ? 1.0 - cooldown : 1.0;
					
						draw_sprite_ext(spriteAsset, 0, xPosition, yPosition, scale, scale, 0.0, blendMode, alpha);
					}
					break;
			}
		} else {
			logger("InputHandler is null", LogType.ERROR);
		}
	



}
///@function jumbotronScoreboardOptionRestart()
///@description Handler for option "Restart"
function jumbotronScoreboardOptionRestart() {

}
///@function jumbotronScoreboardOptionShare()
///@description Handler for option "Share"
function jumbotronScoreboardOptionShare() {

		
	



}
///@function jumbotronScoreboardOptionYoutube()
///@description Handler for option "Share"
function jumbotronScoreboardOptionYoutube() {



}
///@function shaderAbberationHandler(state)
///@description Shader handler.
///@param {Map<String::Object>} state
function shaderAbberationHandler(argument0) {

		var state = argument0;
	
		var parameterNames = [];
	
		defaultShaderTaskHandler(state, parameterNames);
	



}
///@function shaderEmbossHandler(state)
///@description Shader handler.
///@param {Map<String::Object>} state
function shaderEmbossHandler(argument0) {

		var state = argument0;
	
		var parameterNames = []
	
		defaultShaderTaskHandler(state, parameterNames);
	



}
///@function shaderLEDHandler(state)
///@description Shader handler.
///@param {Map<String::Object>} state
function shaderLEDHandler(argument0) {

		var state = argument0;
	
		var parameterNames = [ 
			"brightness",
			"ledSize" 
		];
	
		defaultShaderTaskHandler(state, parameterNames);
	



}
///@function shaderMagnifyHandler(state)
///@description Shader handler.
///@param {Map<String::Object>} state
function shaderMagnifyHandler(argument0) {

		var state = argument0;
	
		var parameterNames = [ 
			"positionX",
			"positionY",
			"radius",
			"minZoom",
			"maxZoom"
		];
	
		defaultShaderTaskHandler(state, parameterNames);
	



}
///@function shaderMosaicHandler(state)
///@description Shader handler.
///@param {Map<String::Object>} state
function shaderMosaicHandler(argument0) {

		var state = argument0;
	
		var parameterNames = [ "amount" ];
	
		defaultShaderTaskHandler(state, parameterNames);
	


}
///@function shaderPosterizationHandler(state)
///@description Shader handler.
///@param {Map<String::Object>} state
function shaderPosterizationHandler(argument0) {

		var state = argument0;
	
		var parameterNames = [ 
			"colorNumber", 
			"gamma"
		];
	
		defaultShaderTaskHandler(state, parameterNames);
	



}
///@function shaderPosterizationHandler(state)
///@description Shader handler.
///@param {Map<String::Object>} state
function shaderRevertHandler(argument0) {

		var state = argument0;
	
		var parameterNames = [];
	
		defaultShaderTaskHandler(state, parameterNames);
	



}
///@function shaderPosterizationHandler(state)
///@description Shader handler.
///@param {Map<String::Object>} state
function shaderRippleHandler(argument0) {

		var state = argument0;
	
		var parameterNames = [
			"positionX",
			"positionY",
			"amount",
			"distortion",
			"speed",
			"time"
		];
	
		defaultShaderTaskHandler(state, parameterNames);
	



}
///@function shaderScanlinesHandler(state)
///@description Shader handler.
///@param {Map<String::Object>} state
function shaderScanlinesHandler(argument0) {

		var state = argument0;
	
		var parameterNames = [
			"colorR",
			"colorG",
			"colorB",
			"colorA"
		];
	
		defaultShaderTaskHandler(state, parameterNames);
	



}
///@function shaderShockWaveHandler(state)
///@description Shader handler.
///@param {Map<String::Object>} state
function shaderShockWaveHandler(argument0) {

		var state = argument0;
	
		var parameterNames = [
			"positionX",
			"positionY",
			"amplitude",
			"refraction",
			"width",
			"time"
		];
	
		defaultShaderTaskHandler(state, parameterNames);
	



}
///@function shaderThermalHandler(state)
///@description Shader handler.
///@param {Map<String::Object>} state
function shaderSketchHandler(argument0) {

		var state = argument0;
	
		var parameterNames = [ "intensity" ];
	
		defaultShaderTaskHandler(state, parameterNames);
	



}
///@function shaderThermalHandler(state)
///@description Shader handler.
///@param {Map<String::Object>} state
function shaderThermalHandler(argument0) {

		var state = argument0;
	
		var parameterNames = [ "intensity" ];
	
		defaultShaderTaskHandler(state, parameterNames);
	
	


}
///@function shaderWaveHandler(state)
///@description Shader handler.
///@param {Map<String::Object>} state
function shaderWaveHandler(argument0) {

		var state = argument0;
	
		var parameterNames = [
			"amount",
			"distortion",
			"speed",
			"time"
		];
	
		defaultShaderTaskHandler(state, parameterNames);
	



}
///@function shaderAbberationUniformSetter(context, state, surface)
///@description Uniform setter.
///@param {Instance} context
///@param {Map<String::Object>} state
///@param {Surface} surface
function shaderAbberationUniformSetter(argument0, argument1, argument2) {

		var context = argument0;
		var state = argument1;
		var surface = argument2;
	



}
///@function shaderEmbossUniformSetter(context, state, surface)
///@description Uniform setter.
///@param {Instance} context
///@param {Map<String::Object>} state
///@param {Surface} surface
function shaderEmbossUniformSetter(argument0, argument1, argument2) {

		var context = argument0;
		var state = argument1;
		var surface = argument2;
	
		var width = surface_get_width(surface);
		var height = surface_get_height(surface);
	
		gpuSetShaderUniformFloat(context.shaderEmbossUniformResolution, width, height);
	



}
///@function shaderLEDUniformSetter(context, state, surface)
///@description Uniform setter.
///@param {Instance} context
///@param {Map<String::Object>} state
///@param {Surface} surface
function shaderLEDUniformSetter(argument0, argument1, argument2) {

		var context = argument0;
		var state = argument1;
		var surface = argument2;
	
		var width = surface_get_width(surface);
		var height = surface_get_height(surface);
	
		var asd = getValueFromMap(state, "brightness", 1.0);
		var def = getValueFromMap(state, "ledSize", 100);
	
		gpuSetShaderUniformFloat(context.shaderLEDUniformResolution, width, height);
		gpuSetShaderUniformFloat(context.shaderLEDUniformBrightness, getValueFromMap(state, "brightness", 1.0));
		gpuSetShaderUniformFloat(context.shaderLEDUniformLedSize, getValueFromMap(state, "ledSize", 100));
	



}
///@function shaderMagnifyUniformSetter(context, state, surface)
///@description Uniform setter.
///@param {Instance} context
///@param {Map<String::Object>} state
///@param {Surface} surface
function shaderMagnifyUniformSetter(argument0, argument1, argument2) {

		var context = argument0;
		var state = argument1;
		var surface = argument2;
	
		var width = surface_get_width(surface);
		var height = surface_get_height(surface);
	
		gpuSetShaderUniformFloat(context.shaderMagnifyUniformResolution, width, height);
		gpuSetShaderUniformFloat(context.shaderMagnifyUniformPosition, 
			width * getValueFromMap(state, "positionX", 0.5),
			height * getValueFromMap(state, "positionY", 0.5));
		gpuSetShaderUniformFloat(context.shaderMagnifyUniformRadius, getValueFromMap(state, "radius", 0.25));
		gpuSetShaderUniformFloat(context.shaderMagnifyUniformMinZoom, getValueFromMap(state, "minZoom", 0.40));
		gpuSetShaderUniformFloat(context.shaderMagnifyUniformMaxZoom, getValueFromMap(state, "maxZoom", 0.60));
	



}
///@function shaderMosaicUniformSetter(context, state, surface)
///@description Uniform setter.
///@param {Instance} context
///@param {Map<String::Object>} state
///@param {Surface} surface
function shaderPosterizationUniformSetter(argument0, argument1, argument2) {

		var context = argument0;
		var state = argument1;
		var surface = argument2;
	
		gpuSetShaderUniformFloat(context.shaderPosterizationUniformColorNumber, getValueFromMap(state, "colorNumber", 1));
		gpuSetShaderUniformFloat(context.shaderPosterizationUniformGamma, getValueFromMap(state, "gamma", 1));
	



}
///@function shaderRevertUniformSetter(context, state, surface)
///@description Uniform setter.
///@param {Instance} context
///@param {Map<String::Object>} state
///@param {Surface} surface
function shaderRevertUniformSetter(argument0, argument1, argument2) {

		var context = argument0;
		var state = argument1;
		var surface = argument2;
	



}
///@function shaderRippleUniformSetter(context, state, surface)
///@description Uniform setter.
///@param {Instance} context
///@param {Map<String::Object>} state
///@param {Surface} surface
function shaderRippleUniformSetter(argument0, argument1, argument2) {

		var context = argument0;
		var state = argument1;
		var surface = argument2;
	
		var width = surface_get_width(surface);
		var height = surface_get_height(surface);
	
		gpuSetShaderUniformFloat(context.shaderRippleUniformResolution, width, height);
		gpuSetShaderUniformFloat(context.shaderRippleUniformPosition, 
			width * getValueFromMap(state, "positionX", 0.5),
			height * getValueFromMap(state, "positionY", 0.5));
		gpuSetShaderUniformFloat(context.shaderRippleUniformAmount, getValueFromMap(state, "amount", 80));
		gpuSetShaderUniformFloat(context.shaderRippleUniformDistortion, getValueFromMap(state, "distortion", 30));
		gpuSetShaderUniformFloat(context.shaderRippleUniformSpeed, getValueFromMap(state, "speed", 5));
		gpuSetShaderUniformFloat(context.shaderRippleUniformTime, getValueFromMap(state, "time", 0));
	



}
///@function shaderRippleUniformSetter(context, state, surface)
///@description Uniform setter.
///@param {Instance} context
///@param {Map<String::Object>} state
///@param {Surface} surface
function shaderScanlinesUniformSetter(argument0, argument1, argument2) {

		var context = argument0;
		var state = argument1;
		var surface = argument2;
	
		var width = surface_get_width(surface);
		var height = surface_get_height(surface);
	
		gpuSetShaderUniformFloat(context.shaderScanlinesUniformResolution, width, height);
		gpuSetShaderUniformFloat(context.shaderScanlinesUniformColor, 
			getValueFromMap(state, "colorR", 0.0) / 255.0,
			getValueFromMap(state, "colorG", 0.0) / 255.0,
			getValueFromMap(state, "colorB", 0.0) / 255.0,
			getValueFromMap(state, "colorA", 0.0) / 255.0);
	



}
///@function shaderShockWaveniformSetter(context, state, surface)
///@description Uniform setter.
///@param {Instance} context
///@param {Map<String::Object>} state
///@param {Surface} surface
function shaderShockWaveUniformSetter(argument0, argument1, argument2) {

		var context = argument0;
		var state = argument1;
		var surface = argument2;
	
		var width = surface_get_width(surface);
		var height = surface_get_height(surface);
	
		gpuSetShaderUniformFloat(context.shaderShockWaveUniformResolution, width, height);
		gpuSetShaderUniformFloat(context.shaderShockWaveUniformPosition, 
			width * getValueFromMap(state, "positionX", 0.5),
			height * getValueFromMap(state, "positionY", 0.5));
		gpuSetShaderUniformFloat(context.shaderShockWaveUniformAmplitude, getValueFromMap(state, "amplitude", 17.5));
		gpuSetShaderUniformFloat(context.shaderShockWaveUniformRefraction, getValueFromMap(state, "refraction", 1.30));
		gpuSetShaderUniformFloat(context.shaderShockWaveUniformWidth, getValueFromMap(state, "width", 30));
		gpuSetShaderUniformFloat(context.shaderShockWaveUniformTime, getValueFromMap(state, "time", 0.8));
	



}
///@function shaderSketchUniformSetter(context, state, surface)
///@description Uniform setter.
///@param {Instance} context
///@param {Map<String::Object>} state
///@param {Surface} surface
function shaderSketchUniformSetter(argument0, argument1, argument2) {

		var context = argument0;
		var state = argument1;
		var surface = argument2;
	
		var width = surface_get_width(surface);
		var height = surface_get_height(surface);
	
		gpuSetShaderUniformFloat(context.shaderSketchUniformResolution, width, height);
		gpuSetShaderUniformFloat(context.shaderSketchUniformIntensity, getValueFromMap(state, "intensity", 0.6));
	
	


}
///@function shaderThermalUniformSetter(context, state, surface)
///@description Uniform setter.
///@param {Instance} context
///@param {Map<String::Object>} state
///@param {Surface} surface
function shaderThermalUniformSetter(argument0, argument1, argument2) {

		var context = argument0;
		var state = argument1;
		var surface = argument2;
	



}
///@function shaderWaveUniformSetter(context, state, surface)
///@description Uniform setter.
///@param {Instance} context
///@param {Map<String::Object>} state
///@param {Surface} surface
function shaderWaveUniformSetter(argument0, argument1, argument2) {

		var context = argument0;
		var state = argument1;
		var surface = argument2;
	
		gpuSetShaderUniformFloat(context.shaderWaveUniformAmount, getValueFromMap(state, "amount", 80));
		gpuSetShaderUniformFloat(context.shaderWaveUniformDistortion, getValueFromMap(state, "distortion", 30));
		gpuSetShaderUniformFloat(context.shaderWaveUniformSpeed, getValueFromMap(state, "speed", 5));
		gpuSetShaderUniformFloat(context.shaderWaveUniformTime, getValueFromMap(state, "time", 0.0));
	



}
///@function defaultShaderTaskHandler(state, parameterNames)
///@description Wrapper for initialize and update ShaderTask parameters in state.
///@param {Map<String::Object>} state
///@param {String[]} parameterNames
function defaultShaderTaskHandler(argument0, argument1) {

		var state = argument0;
		var parameterNames = argument1;
	
		initializeShaderTaskParametersInState(state, parameterNames);
		updateShaderTaskParametersInState(state, parameterNames);
	



}
///@function initializeShaderTaskParametersInState(state, parameterName)
///@description Initialize [ uniformFloat, *Begin, *End, *Factor, initialized ] parameters in ShaderTask state.
///@param {Map<String::Object>} state
///@param {String} parameterName
function initializeShaderTaskParameterInState(argument0, argument1) {

		var state = argument0;
		var parameterName = argument1;

		// Sanitize
		var parameterObject= state[? parameterName];
		var parameterBegin = 0.0;
		var parameterEnd = parameterBegin;
		var parameterFactor = 1.0;
		var parameterFactorChanger = 0.0;
	
		if (!isUndefined(parameterObject)) {
			if (isArray(parameterObject)) {
				var parameterArrayLength = getArrayLength(parameterObject);
				parameterBegin = parameterArrayLength > 0 ? parameterObject[0] : 1.0;
				parameterEnd = parameterArrayLength > 1 ? parameterObject[1] : parameterBegin;
				parameterFactor = parameterArrayLength > 2 ? parameterObject[2] : 1.0;
				parameterFactorChanger = parameterArrayLength > 3 ? parameterObject[3] : 0.0;
			} else {
				parameterBegin = parameterObject;
				parameterEnd = parameterBegin;
				parameterFactor = 1.0;
				parameterFactorChanger = 0.0;
			}
		} else {
			logger("Cannot find ShaderTask parameter \"{0}\"", LogType.WARNING, parameterName);
		}

		// Store
		state[? parameterName + "Begin"] = parameterBegin;
		state[? parameterName + "End"] = parameterEnd;
		state[? parameterName + "Factor"] = parameterFactor;
		state[? parameterName + "FactorChanger"] = parameterFactorChanger;
		state[? parameterName ] = parameterBegin;
	



}
///@function initializeShaderTaskParametersInState(state, parameterNames)
///@description Initialize [ uniformFloat, *Begin, *End, *Factor, initialized ] parameters in ShaderTask state.
///@param {Map<String::Object>} state
///@param {String[]} parameterNames
function initializeShaderTaskParametersInState(argument0, argument1) {

		var state = argument0;
		var parameterNames = argument1;
	
		var initialized = getValueFromMap(state, "initialized", false);
		if (initialized != true) {
			var parameterNamesLength = getArrayLength(parameterNames);
			for (var index = 0; index < parameterNamesLength; index++) {
				var parameterName = parameterNames[index];
				initializeShaderTaskParameterInState(state, parameterName);
			}
			state[? "initialized"] = true;	
		}
	



}
///@function updateShaderTaskParameterInState(state, parameterName)
///@description Update parameter entries in state.
///@param {Map<String::Object>} state
///@param {String} parameterName
function updateShaderTaskParameterInState(argument0, argument1) {

		var state = argument0;
		var parameterName = argument1;
	
		var parameterBegin = state[? parameterName + "Begin"];
		var parameterEnd = state[? parameterName + "End"];
		var parameterFactor = state[? parameterName + "Factor"];
		var parameterFactorChanger = state[? parameterName + "FactorChanger"];
		var parameter = state[? parameterName];
	
		var factorDirection = sign(parameterEnd - parameterBegin);
		var _futureParameterFactor = abs(parameterFactor + parameterFactorChanger)
		var futureParameterFactor = abs(_futureParameterFactor * getDeltaTimeValue()) * factorDirection * getDeltaTimeValue();
		var futureParameter = parameter + futureParameterFactor;
	
		if (factorDirection != 0) {
			if (((factorDirection == -1) && (futureParameter > parameterEnd)) ||
				((factorDirection ==  1) && (futureParameter < parameterEnd))) {
			
				parameterFactor = _futureParameterFactor;
				parameter = futureParameter;	
			} else {
				parameter = parameterEnd;
			}
		} else {
			parameter = parameterEnd;
		}
	
		state[? parameterName + "Factor"] = parameterFactor;
		state[? parameterName] = parameter;
	



}
///@function updateShaderTaskParameterInState(state, parameterNames)
///@description Update parameters entries in state.
///@param {Map<String::Object>} state
///@param {String[]} parameterNames
function updateShaderTaskParametersInState(argument0, argument1) {

		var state = argument0;
		var parameterNames = argument1;
	
		var parameterNamesLength = getArrayLength(parameterNames);
		for (var index = 0; index < parameterNamesLength; index++) {
			parameterName = parameterNames[index];
			updateShaderTaskParameterInState(state, parameterName);
		}
	



}
///@function convertJsonToShaderPipelinesInitializationArray(jsonString)
///@description Convert valid json to Array of Tuples, where key is shaderPipelineName and value is shaderPipelineLimit.
///@param {String} jsonString
///@return {Tuple<String::Integer>[]} initializationArray
function convertJsonToShaderPipelinesInitializationArray(argument0) {

		var jsonString = argument0;
		var tjsonArray = tj_decode(jsonString);
	
		// TODO capture tjson_error
		// TODO add try catch after GML update
		if (isTJsonArray(tjsonArray)) {
		
			var tjsonArrayLength = getArrayLength(tjsonArray);
			var initializationArray = createArray(tjsonArrayLength);
			for (var index = 0; index < tjsonArrayLength; index++) {
				var tjsonObject = tjsonArray[index];

				var name = getTJsonValue(tjsonObject, "name", null);
				var limit = getTJsonValue(tjsonObject, "limit", null);
			
				if ((name == null) || (limit == null)) {
					throwException(createException(ParseException, 
						stringParams("Cannot parse to shader pipelines initialization array at index {0}", index),
						runtimeExceptionHandler));
				}
			
				var tuple = createTuple(name, limit);
				initializationArray[index] = tuple;
			}
		
			return initializationArray;
		}
	
		throwException(createException(ParseException, 
			"Cannot parse to shader pipelines initialization array",
			runtimeExceptionHandler));
	



}
///@function createGameRenderer(layerId)
///@description Constructor.
///@param {Layer} [layerId]
///@return {GameRenderer} gameRenderer
function createGameRenderer() {

		var class = GameRenderer;
		var instanceLayer = argument_count > 0 ? argument[0] : getSystemLayer();
	
		var instance = defaultContextInstanceConstructor(class, "GameRenderer", instanceLayer);
	
		return instance;
	



}
///@function fetchShaderPipelineByName(name)
///@description Getter. Return null if pipeline wasn't found.
///@param {String} name
///@return {Optional<ShaderPipeline>} shaderPipeline
function fetchShaderPipelineByName(argument0) {

		var name = argument0;
	
		var shaderPipelines = getGameRendererShaderPipelines();
		var shaderPipeline = shaderPipelines[? name];
	
		return shaderPipeline == undefined ? null : shaderPipeline;
	
	


}
///@function fetchShaderTaskHandler(shader)
///@description Return handler script for shader.
///@param {AssetShader} shader
///@return {Optional<AssetScript>} script return null if handler wasn't found
function fetchShaderTaskHandler(argument0) {

		var shader = argument0;
		var shaderHandlers = getGameRendererShaderHandlers();
	
		var handler = shaderHandlers[? shader];
		if (isUndefined(handler)) {
			logger("Cannot find shader handler for shader \"{0}\"", LogType.WARNING,
				getAssetName(shader, AssetShader));
			handler = null;
		}
	
		return handler;
	
	


}
///@function fetchShaderTaskUniformSetter(shader)
///@description Return uniform setter script for shader.
///@param {AssetShader} shader
///@return {Optional<AssetScript>} script return null if handler wasn't found
function fetchShaderTaskUniformSetter(argument0) {

		var shader = argument0;
		var shaderUniformSetters = getGameRendererShaderUniformSetters();
	
		var handler = shaderUniformSetters[? shader];
		if (isUndefined(handler)) {
			logger("Cannot find shader uniform setter for shader \"{0}\"", LogType.WARNING,
				getAssetName(shader, AssetShader));
			handler = null;
		}
	
		return handler;
	
	


}
///@function gameRendererDebugClickHandler()
///@description Invoked by clicking on System Icon.
function gameRendererDebugClickHandler() {

		throwException(createException(NotImplementedException, "gameRendererDebugClickHandler() not implemented", null));
	



}
///@function getGameRenderer()
///@description Getter.
///@return {Optional<GameRenderer>} gameRenderer
function getGameRenderer() {

		return global.gameRendererContext;
	



}
///@function initializeShaderPipelines(shaderPipelinesInitializationArray)
///@description Register pipelines from array of tuples, where key is name and value is limit.
///@param {Tuple<String::Integer>[]} shaderPipelinesInitializationArray
function initializeShaderPipelines(argument0) {

		var shaderPipelinesInitializationArray = argument0;
	
		for (var index = 0; index < getArrayLength(shaderPipelinesInitializationArray); index++) {
			var tuple = shaderPipelinesInitializationArray[index];
			var name = getTupleKey(tuple);
			var limit = getTupleValue(tuple);
		
			registerShaderPipeline(name, limit);
		}
	
		logger("Finished ShaderPipelines initialization. Registered {0} ShaderPipelines.", 
			LogType.INFO, index);
	



}

///@function registerShaderPipeline(name, limit)
///@description Create new ShaderPipeline and register it on shaderPipelines.
///@param {String} name
///@param {Integer} limit
///@return {ShaderPipeline} shaderPipeline
function registerShaderPipeline(argument0, argument1) {

		var name = argument0;
		var limit = argument1;
	
		if (fetchShaderPipelineByName(name) != null) {
			logger("ShaderPipeline \"{0}\" already registered", LogType.WARNING, name);
			return fetchShaderPipelineByName(name);
		}
	
		// Register to shaderPipelinesNames
		var shaderPipelinesNames = getGameRendererShaderPipelinesNames();
		addToList(shaderPipelinesNames, name);
	
		// Register to shaderPipelines
		var shaderPipelines = getGameRendererShaderPipelines();
		var shaderPipeline = createShaderPipeline(
			createStack(),
			createStack(),
			limit);
		addToMap(shaderPipelines, name, shaderPipeline);
	
		logger("Registered ShaderPipeline {0} with priority {1}", LogType.INFO, 
			name, getListSize(shaderPipelinesNames));
	
		return shaderPipeline;


}
///@function sendParticleTask(particleTask)
///@description Send ParticleTask to GameRenderer particleTaskPipeline
///@param {ParticleTask} particleTask
function sendParticleTask(argument0) {

	var particleTask = argument0;

	var particleManager = getParticleManager();
	var particleTaskPipelines = particleManager.particleTaskPipelines;
	var particleTaskParticleSystem = getParticleTaskParticleSystem(particleTask);
	var particleTaskPipeline = particleTaskPipelines[particleTaskParticleSystem];
	
	addToList(particleTaskPipeline, particleTask);

}
///@function sendShaderTaskToShaderPipeline(shaderTask, shaderPipelineName)
///@description Add ShaderTask to their ShaderPipeline.
///@param {ShaderTask} shaderTask
///@param {String} shaderPipelineName
function sendShaderTaskToShaderPipeline(argument0, argument1) {

		var shaderTask = argument0;
		var shaderPipelineName = argument1;
	
		var shaderPipeline = fetchShaderPipelineByName(shaderPipelineName);
	
		if (shaderPipeline == null) {
			var defaultLimit = getPropertyReal("gameRenderer.shaderPipeline.defaultLimit", 2)
			logger("ShaderPipeline \"{0}\" wasn't registered. Registering with default limit ({1})", 
				LogType.WARNING, shaderPipelineName, defaultLimit);
			shaderPipeline = registerShaderPipeline(shaderPipelineName, defaultLimit);
			
		}
	
		var pipe = getShaderPipelinePipe(shaderPipeline)
		pushStack(pipe, shaderTask);
	



}
///@function spawnStar(positionBegin, positionEnd)
///@description Star factory.
///@param {Position} positionBegin
///@param {Position} positionEnd
///@return {Star} star
function spawnStar(argument0, argument1) {

		var positionBegin = argument0;
		var positionEnd = argument1;
	
		var precision = 100000;
		var position = createPosition(
			positionBegin[0] + random(precision * (positionEnd[0] - positionBegin[0])) / precision,
			positionBegin[1] + random(precision * (positionEnd[1] - positionBegin[1])) / precision);
		var target = createPosition(
			position[0] < 0.5 ? 
				((random(precision) / precision) * 0.5) + 0.0 :
				((random(precision) / precision) * 0.5) + 0.5, 
			1.0);
		var sprite = createSprite(asset_texture_star_1, 0, choose(1, 1.5, 1.6, 2, 2.5) * choose(1, 1.2, 1.6, 2, 2.2), choose(1, 1.5, 1.6, 2, 2.5) * choose(1, 1.2, 1.6, 2, 2.2), 1.0, 0.0, c_white);
		var speedValue = 0.0001 + 0.0002 * (random(precision) / precision);
		var scale = 0.1 + 0.9 * (random(precision) / precision);
		var alpha = 0.8 + (random(20) / 100);
		
		var star = createStar(position, target, sprite, speedValue, scale, alpha);

		addToList(getGameRenderer().stars, star);
	



}


///@param {String} jsonString
function parseJsonShaderTemplates(jsonString) {

    parseShaderTemplate = function(jsonObject) {
        
       
        var jsonParameters = Core.Collections.Maps.get(jsonObject, "parameters")
        var parameters = createMap();
        for (var index = 0; index < Core.Collections.Lists.size(jsonParameters); index++) {
        
            var parameter = Core.Collections.Lists.get(jsonParameters, index);
            Core.Collections.Maps.set(
				parameters,
				Core.Collections.Maps.get(parameter, "name"),
                [
                    Core.Collections.Maps.get(parameter, "start"),
                    Core.Collections.Maps.get(parameter, "end"),
                    Core.Collections.Maps.get(parameter, "factor"),
                    Core.Collections.Maps.get(parameter, "increment")
                ]
			);
        }

        var template = {
            name: Core.Collections.Maps.get(jsonObject, "name"),
            shader:  Core.Collections.Maps.get(jsonObject, "shader"),
            data: parameters 
        }
        return template;
    }    

    try {

        var gmJsonMap = Core.JSON.decode(jsonString);
		var gmJsonArray = Core.Collections.Maps.get(gmJsonMap, "default");
        for (var index = 0; index < Core.Collections.Lists.size(gmJsonArray); index++) {

            var gmJsonObject = Core.Collections.Lists.get(gmJsonArray, index);
            var template = parseShaderTemplate(gmJsonObject);
            logger("Parsed ShaderTemplate: {0}", LogType.INFO, template.name);
            saveInRepository(fetchShaderTemplateRepository(), template.name, template);
        }
		destroyDataStructure(gmJsonMap, Map);
    } catch (exception) {

        logger(exception.message, LogType.ERROR);
        printStackTrace();
    }
}