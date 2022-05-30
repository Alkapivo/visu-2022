///@description Timelines reactor

	var destroyTimelineEntries = [];
	for (var key = mapFirst(timelines); iteratorFinish(key); key = mapNext(timelines, key)) {
		var timeline = timelines[? key];
		incrementTimeline(timeline);
		
		var time = getTimelineTime(timeline);
		var context = getTimelineContext(timeline);
		var stack = getTimelineStack(timeline);
		
		var gameEvents = getTopOfStack(stack);
		var gameEventsSize = getArrayLength(gameEvents);
		if (gameEventsSize > 0) {
			var gameEvent = gameEvents[0];
			if (time >= getGameEventTime(gameEvent)) {
				popStack(stack);
				
				logger("Start dispatching {0} events at time {1}", LogType.DEBUG, gameEventsSize, time);
				for (var index = 0; index < gameEventsSize; index++) {
					gameEvent = gameEvents[index];
					
					var gameEventTime = getGameEventTime(gameEvent);
					var gameEventType = getGameEventType(gameEvent);
					var gameEventEntity = getGameEventEntity(gameEvent);
										
					logger("Dispatching {0}: { time: {1}, realTime: {2} }", LogType.DEBUG, gameEventType, gameEventTime, time);
					
					#region GameEvent Dispatcher
					switch (getGameEventType(gameEvent)) {
						case "AudioEvent":
							var audioEvent = gameEventEntity;
							//sendAudioEvent(audioEvent);
							destroyAudioEvent(audioEvent);
							break;
						case "BossEvent":
							var bossEvent = gameEventEntity;
							sendBossEvent(bossEvent);
							destroyBossEvent(bossEvent);
							break;
						case "GridEvent":
							var gridEvent = gameEventEntity;
							applyGridEventOnGridRenderer(gridEvent);
							destroyGridEvent(gridEvent);
							break;
						case "JumbotronEvent":
							var jumbotronEvent = gameEventEntity;

							var gameRenderer = getGameRenderer();
							gameRenderer.jumbotronEvent = jumbotronEvent;
							gameRenderer.jumbotronEventTimer = -1;
							break;
						case "ParticleEvent":
							var particleEvent = gameEventEntity;
							var particleName = getParticleEventParticle(particleEvent)
							var particleTask = parseFieldsToParticleTask(particleName, getParticleEventFields(particleEvent));
							var particle = getParticleEventParticle(particleEvent);
							setParticleTaskParticle(particleTask, particle);
							sendParticleTask(particleTask);
							destroyParticleEvent(particleEvent);
							break;
						case "ShaderEvent":
							var shaderEvent = gameEventEntity;
							var shaderName = "shader" + getShaderEventName(shaderEvent);
							var shaderAsset = getAssetIndex(shaderName, AssetShader);
							if ((shaderAsset != null) && shader_is_compiled(shaderAsset)){
								var duration = getShaderEventDuration(shaderEvent);
								var state = getShaderEventData(shaderEvent) != null ? cloneMap(getShaderEventData(shaderEvent)) : createMap();
								var shaderTask = createShaderTask(shaderAsset, duration, state, 0.0, 0.7);
								var pipeline = isDataStructure(state, Map) ? getValueFromMap(state, "pipeline", "main") : "main";
								sendShaderTaskToShaderPipeline(shaderTask, pipeline);
							} else {
								logger("Cannot dispatch ShaderEvent: shader \"{0}\" wasn't {1}", LogType.WARNING,
									shaderName, shaderAsset == null ? "found" : "compiled");
							}
							destroyShaderEvent(shaderEvent);
							break;
						case "ShroomEmitterEvent":
							var shroomEmitterEvent = gameEventEntity;
							
							var amount = getShroomEmitterEventAmount(shroomEmitterEvent);
							var duration = getShroomEmitterEventDuration(shroomEmitterEvent);
							var interval = getShroomEmitterEventInterval(shroomEmitterEvent);
							var fieldsArray = getShroomEmitterEventTemplates(shroomEmitterEvent);
							var positionBegin = createPosition(0.0, 0.0);
							var positionEnd = createPosition(1.0, 0.0);
							var templates = []
							if (getArrayLength(fieldsArray) == 0) {
								var fields = createMap();
								var shroomTemplate = parseFieldsToShroomTemplate(fields);
								destroyMap(fields);
								pushArray(templates, shroomTemplate);
							} else {
								for (var fieldIndex = 0; fieldIndex < getArrayLength(fieldsArray); fieldIndex++) {
									var fields = fieldsArray[fieldIndex];
									var shroomTemplate = parseFieldsToShroomTemplate(fields);
									pushArray(templates, shroomTemplate);
								}	
							}
							
							spawnShroomEmitter(
								positionBegin,
								positionEnd,
								duration,
								amount,
								interval,
								templates);
							
							destroyShroomEmitterEvent(shroomEmitterEvent);
							break;
						case "ShroomEvent":
							var shroomEvent = gameEventEntity;
							var fields = getShroomEventFields(shroomEvent);
							var shroomTemplate = parseFieldsToShroomTemplate(fields);
							var position = parseFieldsToShroomPosition(fields);

							spawnShroom(shroomTemplate, position);
							
							destroyShroomEvent(shroomEvent);
							break;
						case "PlayerEvent":
							var playerEvent = gameEventEntity;
							var fields = getPlayerEventFields(playerEvent);
							var players = fetchPlayers();
							var playersSize = getListSize(players);
							if (playersSize == 0) {
							
								spawnSpaacePlayer("main", createInputHandler(KeyboardInputHandler));
								players = fetchPlayers();
								playersSize = getListSize(players);
							}
							for (var playerIndex = 0; playerIndex < playersSize; playerIndex++) {
								var player = players[| playerIndex];
								
								#region "sprite"
								var spriteName = fields[? "sprite"];
								if (spriteName != null) {
									var spriteIndex = getSpriteIndex(spriteName);
									if (spriteIndex != null) {
										var sprite = createSprite(spriteIndex, 0, 1.0, 1.0, 1.0, 0.0, c_white);
										var gridElement = createGridElement(
											cloneArray(getGridElementPosition(getSpaacePlayerGridElement(player))),
											sprite,
											cloneArray(getGridElementInfo(getSpaacePlayerGridElement(player))));
										setSpaacePlayerGridElement(player, gridElement);
											
										var collisionRadius = fetchCollisionRadiusFromSprite(sprite);
										setSpaacePlayerCollisionRadius(player, collisionRadius);
									}
								}
								#endregion
							}
							break;
						case "LyricsEvent":
							var lyricsEvent = gameEventEntity;
							var lyricsTask = serializeLyricsEvent(lyricsEvent);
							sendLyricsTaskToLyricsRenderer(lyricsTask);
							destroyLyricsEvent(lyricsEvent);
							break;							
					}
					#endregion
				}
			}
		} else {
			logger("Timeline {0} finished (real time: {1} [2})", LogType.DEBUG, key, time, context);
			pushArray(destroyTimelineEntries, key);
		}
	}
	
	var destroyEntriesSize = getArrayLength(destroyTimelineEntries);
	for (var index = 0; index < destroyEntriesSize; index++) {
		var entry = destroyTimelineEntries[index];
		removeFromMap(timelines, entry);
	}
