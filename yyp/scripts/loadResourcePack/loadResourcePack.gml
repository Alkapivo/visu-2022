///@function loadResourcePack(path)
///@description Loader
///@param {String} path to resource pack directory
function loadResourcePack(argument0) {

		var path = argument0;
	
		var resourcePackJsonString = readStringFromFile(working_directory + path, "index.json");
		var resourcePack = deserializeResourcePack(resourcePackJsonString);
	
	#region Sprites
		var sprites = getResourcePackSprites(resourcePack);
		var spritesSize = getArrayLength(sprites);
		for (var index = 0; index < spritesSize; index++) {
			var entry = sprites[index];
			var options = getResourcePackEntryOptions(entry);
		
			if (options != null)  {
				loadResource(
					getResourcePackEntryName(entry),
					AssetTexture,
					path + "/" + getResourcePackEntryPath(entry),
					options);
			} else {
				loadResource(
					getResourcePackEntryName(entry),
					AssetTexture,
					path + "/" + getResourcePackEntryPath(entry));
			}
		}
	#endregion
	
	#region Sounds
		var sounds = getResourcePackSounds(resourcePack);
		var soundsSize = getArrayLength(sounds);
		for (var index = 0; index < soundsSize; index++) {
			var entry = sounds[index];
			var options = getResourcePackEntryOptions(entry);
		
			if (options != null)  {
				loadResource(
					getResourcePackEntryName(entry),
					AssetSound,
					path + "/" + getResourcePackEntryPath(entry),
					options);
			} else {
				loadResource(
					getResourcePackEntryName(entry),
					AssetSound,
					getResourcePackEntryPath(entry));
			}
		}
	#endregion
	
	#region Timelines
		var timelines = getResourcePackTimelines(resourcePack);
		var timelinesSize = getArrayLength(timelines);
		for (var index = 0; index < timelinesSize; index++) {
			var entry = timelines[index];
			var options = getResourcePackEntryOptions(entry);
		
			var timelineManager = getTimelineManager();
			if (options != null)  {
				var time = getValueFromMap(options, "time", 0.0);
				var timelineName = getResourcePackEntryName(entry);
				var timelinePath = getResourcePackEntryPath(entry);
				var tempTimeline = loadTimelineFromFile(path + "/" + timelinePath);
				var timeline = createTimeline(time, getTimelineManager(), convertTimelineToTimelineStack(tempTimeline));
				timelineManager.timelines[? timelineName] = timeline;
				destroyDataStructure(tempTimeline, Map, "Unable to destroy tempTimeline");
			} else {
				var timelineName = getResourcePackEntryName(entry);
				var timelinePath = getResourcePackEntryPath(entry);
				var tempTimeline = loadTimelineFromFile(path + "/" + timelinePath);
				var timeline = createTimeline(0.0, timelineManager, convertTimelineToTimelineStack(tempTimeline));
				timelineManager.timelines[? timelineName] = timeline;
				destroyDataStructure(tempTimeline, Map, "Unable to destroy tempTimeline");
			}
		}
	#endregion
	

	
	



}
