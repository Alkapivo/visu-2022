///@description cleanUp();

	super();
	
	for (var key = mapFirst(sprites); iteratorFinish(key); key = mapNext(sprites, key)) {
		var sprite = sprites[? key];
		sprite_delete(sprite);
	}
	destroyDataStructure(sprites, Map, "Unable to destroy sprites");
	
	for (var key = mapFirst(sounds); iteratorFinish(key); key = mapNext(sounds, key)) {
		var sound = sounds[? key];
		audio_destroy_stream(sound);
	}
	destroyDataStructure(sounds, Map, "Unable to destroy sounds");