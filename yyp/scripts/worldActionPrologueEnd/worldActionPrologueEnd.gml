///@function worldActionPrologueEnd()
///@description Sequence action implementation.
function worldActionPrologueEnd() {

		clearException();
	
		var worldControllerState = getWorldInstanceStateData(storeWorldControllerHandler(getWorldController()));
		var playerState = getWorldControllerStatePlayerState(worldControllerState);
	
		var mobStatistic = getPlayerStateMobStatistic(playerState);
		var levelStatistic = getMobStatisticLevel(mobStatistic);
		var experience = getStatisticExperience(levelStatistic);
		var currentLevel = fetchLevelFromExperience(experience);
		var healthPoints = fetchHealthPointsFromLevel(currentLevel);
		var healthMaxPoints = fetchHealthPointsFromLevel(currentLevel);
		var healthPointsStatisticPoints = getMobStatisticHealthPoints(mobStatistic);
		setStatisticPointsValue(healthPointsStatisticPoints, healthPoints);
		setStatisticPointsMaxValue(healthPointsStatisticPoints, healthMaxPoints);
		setPlayerStateWorldPosition(playerState, createWorldPosition(WorldLocationType_TERRESTRIAL, 2, 146, 299));
		setPlayerStateFuel(playerState, 255.0); ///@todo const
		worldControllerState = serializeWorldControllerState(worldControllerState);
		var questManagerState = serializeQuestManagerState(getWorldInstanceStateData(storeQuestManagerHandler(getQuestManager())));
		var factManagerState = serializeFactManagerState(getWorldInstanceStateData(storeFactManagerHandler(getFactManager())));
		var loadingIntent = createLoadingIntent(
			SceneWorld, 
			createArrayMap(
				[
					"worldName",
					"worldStateName",
					"isExternal",
					"worldControllerState",
					"questManagerState",
					"factManagerState"
				],
				[
					"world_washagami",
					"world_washagami_state",
					false,
					worldControllerState,
					questManagerState,
					factManagerState
				]
			)
		);
		sendLoadingIntent(loadingIntent);
	



}
