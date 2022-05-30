///@function createAudioManagerState(name)
///@description Constructor for AudioManagerState entity.
///@param {Optional<String>} name
///@return {AudioManagerState} audioManagerState 
///@throws {Exception}
///@generated {2021-05-01T23:43:36.009Z}

function createAudioManagerState(name) {

	var audioManagerState = createEntity(AudioManagerState);

	setAudioManagerStateName(audioManagerState, name);

	return audioManagerState;
	
}
