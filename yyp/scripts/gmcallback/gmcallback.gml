///@param {string} key
///@jscallback gml_Script_gmcallback_sendMidiMatrixKey(_inst = -1, _other = -1, key)
function gmcallback_sendMidiMatrixKey(key) {
	
	try {
		var midiController = getGameController().midiMatrixController
		var eventsPlayer = midiController.eventsPlayer;
		var keymapConfig = midiController.keymapConfig;
		var timestamp = isStruct(eventsPlayer.recording)
			? eventsPlayer.recording.timer
			: 0.0;
		sendMidiMatrixEvent(
			eventsPlayer,
			keymapConfig,
			key,
			timestamp
		);
		logger("Send MidiMatrixEvent { key: {0} }", LogType.INFO, key);
	} catch (exception) {
	
		logger("{0}", LogType.ERROR, exception.message);
		printStackTrace();
	}
}

///@param {string} key
function dupa(key) {
	
	try {
		var midiController = getGameController().midiMatrixController
		var eventsPlayer = midiController.eventsPlayer;
		var keymapConfig = midiController.keymapConfig;
		var timestamp = isStruct(eventsPlayer.recording)
			? eventsPlayer.recording.timer
			: 0.0;
		sendMidiMatrixEvent(
			eventsPlayer,
			keymapConfig,
			key,
			timestamp
		);
		logger("Send MidiMatrixEvent { key: {0} }", LogType.INFO, key);
	} catch (exception) {
	
		logger("{0}", LogType.ERROR, exception.message);
		printStackTrace();
	}
}
