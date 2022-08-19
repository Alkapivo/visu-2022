///@param {string} key
function gmcallback_sendMidiMatrixEvent() {
	
	var key = "0x0";
	var midiController = getGameController().midiMatrixController
	sendMidiMatrixEvent(
		midiController.eventsPlayer,
		midiController.keymapConfig,
		key,
		midiController.eventsPlayer.recording.timer
	);
	
	logger("Send MidiMatrixEvent { key: {0} }", LogType.INFO, key);
}