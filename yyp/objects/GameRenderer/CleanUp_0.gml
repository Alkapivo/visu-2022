///@description

	super();
	deregisterSceneRenderer();
	
	if (jumbotronEvent != null) {
		destroyJumbotronEvent(jumbotronEvent);	
	}
	destroyDataStructure(jumbotronState, Map, "Unable to destroy jumbotronState");

	destroyDataStructure(shaderPipelinesNames, List, "Unable to destroy shader pipelines names")
	
	for (var key = mapFirst(shaderPipelines); iteratorFinish(key); key = mapNext(shaderPipelines, key)) {
		var shaderPipeline = shaderPipelines[? key];
		destroyShaderPipeline(shaderPipeline);
	}
	destroyDataStructure(shaderPipelines, Map, "Unable to destroy shaderPipelines");

	destroyDataStructure(shaderHandlers, Map, "Unable to destroy shader handlers");
	destroyDataStructure(shaderUniformSetters, Map, "Unable to destroy shader uniform setters");
	
	destroySurface(applicationSurface);
	destroySurface(screenSurface);
	destroySurface(gameSurface);
	destroySurface(shaderSurface);		
	destroySurface(guiSurface);
	destroySurface(jumbotronSurface);
	
	destroyDataStructure(scoreNotifyEffectPipeline, List, "Unable to destroy scoreNotifyEffectPipeline");
	
