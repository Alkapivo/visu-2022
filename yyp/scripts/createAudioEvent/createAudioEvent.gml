///@function createAudioEvent(assetName, trackPosition, priority, loop)
///@description Constructor for AudioEvent entity.
///@param {String} assetName
///@param {Number} trackPosition
///@param {Integer} priority
///@param {Boolean} loop
///@return {AudioEvent} audioEvent 
///@throws {Exception}
///@generated {2021-05-01T23:49:42.033Z}

function createAudioEvent(assetName, trackPosition, priority, loop) {

	var audioEvent = createEntity(AudioEvent);

	setAudioEventAssetName(audioEvent, assertNoOptional(assetName));
	setAudioEventTrackPosition(audioEvent, assertNoOptional(trackPosition));
	setAudioEventPriority(audioEvent, assertNoOptional(priority));
	setAudioEventLoop(audioEvent, assertNoOptional(loop));

	return audioEvent;
	
}
