///@description 

	for (var key = mapFirst(keysState); iteratorFinish(key); key = mapNext(keysState, key)) {
		var keyState = keysState[? key];
		destroyKeyState(keyState);
	}
	destroyDataStructure(keysState, Map, "Unable to destroy keysState map");
	
