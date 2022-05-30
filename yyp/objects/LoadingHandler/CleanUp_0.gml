///@description cleanUp()

	for (var key = mapFirst(loadingStages); iteratorFinish(key); key = mapNext(loadingStages, key)) {
		
		var loadingStage = loadingStages[? key];
		if (isEntity(loadingStage, LoadingStage)) {
			
			destroyLoadingStage(loadingStage);
		}
	}
	
	destroyDataStructure(loadingStages, Map, "Unable to destroy LoadingHandler loadingStages map");
	destroyDataStructure(parameters, Map, "Unable to destroy LoadingHandler parameters map");