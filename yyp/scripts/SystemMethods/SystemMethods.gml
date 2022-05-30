///@export getCurrentConfig(): Config
///@export getSystemEventPipeline(): Pipeline<SystemEvent>
///@export getSystemInstanceFieldModifierTaskPipeline(): Map<String::FieldModifierTask>
///@export getSystemLoadingIntentEventPipeline(): Stack<SystemEvent>
///@export abortInstanceFieldModifierTask(T?GMInstance, String)
///@export createDefaultSettings(): Settings
///@export createInstanceFieldModifierTaskKey(String, String): String
///@export createRenderLayer(): Layer
///@export generateFieldModifierTask(T?GMInstance, String, Number, Number, Number, Integer): FieldModifierTask
///@export getInstanceFieldModifierTask(instance, fieldName): ?FieldModifierTask
///@export getRenderLayer(): Layer
///@export getSystemLayer(): Layer
///@export sendFieldModifierTask(FieldModifierTask)
///@export sendLoadingIntent(LoadingIntent)
///@export sendSystemEvent(SystemEvent)
///@export setSystemInstanceFieldModifierTaskPipeline(Map<String::FieldModifierTask>)
///@export setSystemLoadingIntentEventPipeline(Stack<SystemEvent)
///@export getSystem(): System
///@export getSettingsRepository(): Optional<Repository<Settings>>
///@export saveSettingsRepository()

///@return {Config} config
function getCurrentConfig() {

	return os_get_config();
}

///@return {Pipeline<SystemEvent>} systemEventPipeline
function getSystemEventPipeline() {

	return global.systemEventPipeline;
}

///@return {Map<String::FieldModifierTask>} instanceFieldModifierTaskPipeline
function getSystemInstanceFieldModifierTaskPipeline() {

	var reactor = getSystem().instanceFieldModifierTaskReactor;
	return getReactorData(reactor);
}

///@return {Stack<SystemEvent>} loadingIntentEventPipeline
function getSystemLoadingIntentEventPipeline() {

	return getSystem().loadingIntentEventPipeline;
}

///@description Delete entry from instanceFieldModifierTaskPipeline.
///@param {Instance} instance
///@param {String} fieldName
function abortInstanceFieldModifierTask(instance, fieldName) {

	var map = getSystem().instanceFieldModifierTaskPipeline;
	var key = createInstanceFieldModifierTaskKey(instance, fieldName)
	removeFromMap(map, key);
}

///@return {Settings} settings
function createDefaultSettings() {

	var viewSettings = createSettings("view", createMap(
		createTuple("windowWidth", "1024"),
		createTuple("windowHeight", "768"),
		createTuple("guiPixelScale", "1.0"),
		createTuple("viewPixelScale", "1.0"),
		createTuple("fullscreen", "false")));
	var systemSettings = createSettings("system", createMap(
		createTuple("version", GM_version),
		createTuple("enableDebugOverlay", "false")));
	var windowManagerSettings = createSettings("windowManager", createMap());
	var consoleSettings = createSettings("console", createMap());
			
	var defaultSettings = createMap(
		createTuple("view", viewSettings),
		createTuple("system", systemSettings),
		createTuple("windowManager", windowManagerSettings),
		createTuple("console", consoleSettings));
		
	return defaultSettings;
}

///@description Key generator for map instanceFieldModifierTaskPipeline.
///@param {Instance} instance
///@param {String} fieldName
///@return {String} key
function createInstanceFieldModifierTaskKey(fieldName, key) {

	return string(fieldName) + "." + string(key);
}

///@description Create render_layer 
///@return {Layer} renderLayer
function createRenderLayer() {

	var renderLayer = layer_get_id(getPropertyString("renderer.renderLayer", "render_layer"));
	if (renderLayer == -1) {
		
		renderLayer = layer_create(getPropertyReal("render.renderLayerDepth", -4200), "render_layer");
	}
	
	return renderLayer;
}

///@param {T?GMInstance} instance
///@param {String} fieldName
///@param {Number} targetValue
///@param {Number} factorValue
///@param {Number} [factorFrequency=1]
///@param {Integer} [currentTick=0]
///@return {FieldModifierTask} fieldModifierTask
function generateFieldModifierTask(instance, fieldName, targetValue, factorValue) {

	var factorFrequency = argument_count > 4 ? argument[4] : 1;
	var currentTick = argument_count > 5 ? argument[5] : 0;

	var fieldModifierTask = createFieldModifierTask(instance, fieldName, targetValue, factorValue, factorFrequency, currentTick)
	return fieldModifierTask;
}

///@param {Instance} instance
///@param {String} fieldName
///@return {Optional<FieldModifierTask>} 
function getInstanceFieldModifierTask(instance, fieldName) {
	
	var instanceFieldModifierTaskPipeline = getInstanceVariable(getSystem(), "instanceFieldModifierTaskPipeline");
	var key = createInstanceFieldModifierTaskKey(instance, fieldName);
	var task = instanceFieldModifierTaskPipeline[? key];
	
	return isUndefined(task) ? null : task;
}

///@return {Layer} layerId
function getRenderLayer() {

	return getSystem().renderLayer;
}

///@return {Layer} layerId
function getSystemLayer() {

	return getSystem().systemLayer;
}

///@param {FieldModifierTask} fieldModifierTask
function sendFieldModifierTask(fieldModifierTask) {

	if (isEntity(fieldModifierTask, FieldModifierTask)) {
		
		var reactor = getSystem().instanceFieldModifierTaskReactor;
		var key = createInstanceFieldModifierTaskKey(
			getFieldModifierTaskInstance(fieldModifierTask),
			getFieldModifierTaskFieldName(fieldModifierTask)
		);
		
		removeFromMap(getReactorData(reactor), key);
		addElementToReactor(reactor, fieldModifierTask, key);
	}
}

///@descritpion Add loadingIntent to System::loadingIntentPipeline.
///@param {LoadingIntent} loadingIntent
function sendLoadingIntent(loadingIntent) {

	if (isEntity(loadingIntent, LoadingIntent)) {
		
		addElementToPipeline(getSystem().loadingIntentPipeline, loadingIntent);	
	}
}

///@descritpion Add systemEvent to global::systemEventPipeline.
///@param {SystemEvent} systemEvent
function sendSystemEvent(systemEvent) {

	if (isEntity(systemEvent, SystemEvent)) {
		
		addElementToPipeline(getSystemEventPipeline(), systemEvent);
	}
}

///@param {Map<String::FieldModifierTask>} pipeline
function setSystemInstanceFieldModifierTaskPipeline(pipeline) {
	
	getSystem().instanceFieldModifierTaskPipeline = pipeline;
}

///@param {Stack<SystemEvent>} pipeline
function setSystemLoadingIntentEventPipeline(pipeline) {
	
	getSystem().loadingIntentEventPipeline = pipeline;
}

///@return {System} system;
function getSystem() {

	return global.systemContext;
}

///@return {Optional<Repository<Settings>>} settingsRepository
function getSettingsRepository() {

	var settingsRepository = getInstanceVariable(global.systemContext, "settingsRepository");

	return settingsRepository;
}

///@description Save settings repository to settings.json file
function saveSettingsRepository() {

	var settingsRepository = getSettingsRepository();
	if (settingsRepository != null) {
			
		var jsonDecodeMethod = getDefaultJsonDecoderType();
		setDefaultJsonDecoderType(JsonDecoderType.GMJSON);
		var serializedSettingsRepository = serializeRepository(settingsRepository);
		setDefaultJsonDecoderType(jsonDecodeMethod);
		
		if (!isHtml5()) {
				
			writeStringToFile(serializedSettingsRepository, working_directory + "settings.json");
		}
	}
}

