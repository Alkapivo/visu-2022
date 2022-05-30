///@function createAudioContext(name, asset, sound, status)
///@description Constructor for AudioContext entity.
///@param {String} name
///@param {Optional<AssetSound>} asset
///@param {Optional<Sound>} sound
///@param {AudioContextStatus} status
///@return {AudioContext} audioContext 
///@throws {Exception}
///@generated {2021-05-01T23:49:42.058Z}

function createAudioContext(name, asset, sound, status) {

	var audioContext = createEntity(AudioContext);

	setAudioContextName(audioContext, assertNoOptional(name));
	setAudioContextAsset(audioContext, asset);
	setAudioContextSound(audioContext, sound);
	setAudioContextStatus(audioContext, assertNoOptional(status));

	return audioContext;
	
}
