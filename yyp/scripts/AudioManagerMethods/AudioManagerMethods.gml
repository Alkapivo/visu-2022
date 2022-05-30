///@export getAudioManagerChannels(AudioManager): Optional<Map<String::AudioChannel>>
///@export cleanUpAudioManager()
///@export createAudioManager(Optional<any[]>): AudioManager
///@export 
///@export
///@export
///@export
///@export
///@export
///@export
///@export
///@export
///@export
///@export
///@export

	
///@param {T?AudioManager} audioManager
///@return {Optional<Map<String::AudioChannel>>} channels
function getAudioManagerChannels(audioManager) {

	return getInstanceVariable(audioManager, FieldAudioManager_channels);
}

function cleanUpAudioManager() {

}

///@description GenericManager constructor handler for AudioManager.
///@param {Optional<any[]>} params
///@return {AudioManager} audioManager
function createAudioManager(params) {

	if ((isArray(params)) &&
		(getArrayLength(params) >= 1)) {
	
		var context = params[0];
		var channels = getAudioManagerChannels(context);
		if (isDataStructure(channels, Map)) {
		
			///@todo
		}
	}
}

///@param {T?Manager} context
///@param {GenericEvent} event
function genericAudioManagerEventHandler(context, event) {

	var channels = getAudioManagerChannels(context);
	if (isDataStructure(channels, Map)) {
	
		var eventData = getGenericEventData(event);
		if (isEntity(eventData, ArrayMap)) {
					
			var channelName = getDefaultValue(getValueFromArrayMap(eventData, "channel"), "default");
			var audioChannel = channels[? channelName];
			///@todo
		}
	}
}

///@description GenericManager step handler for AudioManager.
///@param {Optional<any[]>} params
function stepAudioManager(params) {

	if ((isArray(params)) &&
		(getArrayLength(params) >= 1)) {
	
		var context = params[0];
		
		#region Resolve AudioManager::channels
		var channels = getInstanceVariable(context, FieldAudioManager_channels);
		if (isDataStructure(channels, Map)) {
		
			for (var audioChannel = mapFirst(channels);
					iteratorFinish(audioChannel);
					audioChannel = mapNext(channels, audioChannel)) {
				
				///@todo
			}
		}
		#endregion
	}
}

///@param {Optional<AssetSound>} sfxAsset
function sendSfxPipelineRequest(sfxAsset) {

	if (IsCutsceneMode) {
	
		return null;
	}

	if (isAudio(sfxAsset)) {
	
		var sound = audio_play_sound(sfxAsset, 200, false);
		audio_sound_gain(sound, getSfxGain(), 0.0);
	}
}

///@param {Tuple<AssetSound::Optional<GenericEntity<T?Notification>|any>} sfxRequest
function sendSfxRequest(sfxRequest) {

	if (IsCutsceneMode) {
	
		return null;
	}

	var context = getSceneAudioManager();
	var sfxQueue = getInstanceVariable(context, "sfxQueue");
	if (!isDataStructure(sfxQueue, Queue)) {
		
		sfxQueue = createQueue();
		setInstanceVariable(context, "sfxQueue", sfxQueue);
	}
	
	if ((isDataStructure(sfxQueue, Queue)) &&
		(isEntity(sfxRequest, Tuple))) {
		
		pushQueue(sfxQueue, sfxRequest);
	}
}

///@description Wrapper for sfxQueue
///@param {GMInstance} context
///@return {any} response
function sfxQueueDispatcher(context) {
	
	var response = createEmptyOptional();
	
	if (IsCutsceneMode) {
	
		return response;
	}
	
	///@inject {Queue<Tuple<AssetSound::Optional<GenericEntity<Tuple|JumbotronTask>>>>}
	var sfxQueue = getInstanceVariable(context, "sfxQueue");
	if (!isDataStructure(sfxQueue, Queue)) {
		
		sfxQueue = createQueue();
		setInstanceVariable(context, "sfxQueue", sfxQueue);
	}
	
	///@inject {Optional<AudioContext>}
	var sfxQueueAudioContext = getInstanceVariable(context, "sfxQueueAudioContext");
	if ((isEntity(sfxQueueAudioContext, AudioContext)) &&
		(audioContextFinished(sfxQueueAudioContext))) {
		
		stopAudioContextPlayback(sfxQueueAudioContext);
		
		setInstanceVariable(context, "sfxQueueAudioContext", null);
		return response;
	}
	
	var sfxQueueSize = getQueueSize(sfxQueue);
	if (sfxQueueSize > 0) {
		
		if ((isEntity(sfxQueueAudioContext, AudioContext)) &&
			(!audioContextFinished(sfxQueueAudioContext))) {
			
			return response;
		}
		
		var sfxEvent = popQueue(sfxQueue);
		if (!isEntity(sfxEvent, Tuple)) {
		
			return response;
		}
		
	#region Dispatch key
		var asset = getTupleKey(sfxEvent);
		if (isAudio(asset)) {
			
			if (isEntity(sfxQueueAudioContext, AudioContext)) {
				
				stopAudioContextPlayback(sfxQueueAudioContext);
			}
			
			sfxQueueAudioContext = createAudioContext(
				getAssetName(asset, AssetSound),
				asset,
				createEmptyOptional(),
				AudioContextStatus_INTENT
			);
			var volume = getSfxGain();
						
			response = startAudioContextPlayback(
				sfxQueueAudioContext, 
				createArrayMap([ "volume" ], [ volume ])
			);
						
			setInstanceVariable(context, "sfxQueueAudioContext", sfxQueueAudioContext);
		}
	#endregion

	#region Dispatch value
		var genericEntity = getTupleValue(sfxEvent);
		if (isEntity(genericEntity, GenericEntity)) {
			
			var sfxDataObject = getGenericEntityObject(genericEntity);
			var sfxDataType = getGenericEntityType(genericEntity);
			if (isEntity(sfxDataObject, sfxDataType)) {
					
				switch (sfxDataType) {
				
					case JumbotronTask:
								
						sendJumbotronTask(sfxDataObject);	
									
						break;
									
					case Tuple:	
									
						sendNotification(
							getTupleKey(sfxDataObject),
							getTupleValue(sfxDataObject)
						);
									
						break;
					
				}
			}
		}
	#endregion
	}
	
	return response;
}

///@description Deregister current SceneAudioManager bean.
function deregisterSceneAudioManager() {

	var contextName = "sceneAudioManagerContext";
	
	if (globalVariableExists(contextName)) {
		var contextValue = variable_global_get(contextName);
		if (contextValue == null) {
			throwException(createException(RuntimeException, 
				stringParams("SceneController {0} was already deregistered", contextName), runtimeExceptionHandler));
		}
		setGlobalVariable(contextName, null);
		logger("SceneController {0} was deregistered", LogType.DEBUG, contextName);
	} else {
		throwException(createException(RuntimeException, 
			stringParams("Trying to unregister context {0} that has not been registered", LogType.ERROR, contextName), 
			runtimeExceptionHandler));
	}
}

///@param {T?AudioManager} manager
///@param {String} channelId
///@return {Optional<AudioChannel>} audioChannel
function fetchAudioManagerAudioChannelById(manager, channelId) {
	
	var channels = getAudioManagerChannels(manager);
	var audioChannel = getFromMap(channels, channelId);
	
	return audioChannel;
}

///@description Register passed context as SceneAudioManager bean.
///@param {?Controller} controller
function registerSceneAudioManager(audioManager) {

	var contextName = "sceneAudioManagerContext";
	
	if (globalVariableExists(contextName)) {
		var contextValue = getGlobalVariable(contextName);
		if (contextValue != null) {
			throwException(createException(RuntimeException, 
				stringParams("Trying to set context for variable {0} which already exists", contextName), 
				runtimeExceptionHandler));
		}
	}
	
	setGlobalVariable(contextName, audioManager);
	logger("SceneAudioManager {0} was registered", LogType.DEBUG, contextName);
}

///@param {AudioManager} audioManager
///@param {Optional<WorldInstanceState<AudioManagerState>>} worldInstanceState
function restoreAudioManagerHandler(audioManager, worldInstanceState) {

	var audioManagerState = getWorldInstanceStateData(worldInstanceState);
	if (isEntity(audioManagerState, AudioManagerState)) {
		var name = getAudioManagerStateName(audioManagerState)	
		setInstanceVariable(audioManager, "name", name);
	}
}

///@param {AudioManager} audioManager
///@return {WorldInstanceState<AudioManagerState>} worldInstanceState
///@throws {InvalidEntityException}
function storeAudioManagerHandler(audioManager) {

	var name = getDefaultValue(
		getInstanceVariable(audioManager, "name"),
		"@mock"	
	);
	
	var audioManagerState = createAudioManagerState(name);	
	var worldInstanceState = createWorldInstanceState("AudioManagerState", audioManagerState);
	
	return worldInstanceState;
}

///@return {Optional<AudioManager>} audioManager
function getAudioManager() {

	return global.audioManagerContext;
}

///@return {Optional<AudioManager>} audioManager
function getSceneAudioManager() {

	return global.sceneAudioManagerContext;
}
	
