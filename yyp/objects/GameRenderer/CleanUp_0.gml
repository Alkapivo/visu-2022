///@description GMObject 

	

	cleanUp = function() {
	
		super();
		deregisterSceneRenderer();
	
		if (this.jumbotronEvent != null) {
			destroyJumbotronEvent(this.jumbotronEvent);	
		}
		destroyDataStructure(this.jumbotronState, Map, "Unable to destroy jumbotronState");

		destroyDataStructure(this.shaderPipelinesNames, List, "Unable to destroy shader pipelines names")
	
		for (var key = mapFirst(this.shaderPipelines); iteratorFinish(key); key = mapNext(this.shaderPipelines, key)) {
			var shaderPipeline = this.shaderPipelines[? key];
			destroyShaderPipeline(shaderPipeline);
		}
		destroyDataStructure(this.shaderPipelines, Map, "Unable to destroy shaderPipelines");

		destroyDataStructure(this.shaderHandlers, Map, "Unable to destroy shader handlers");
		destroyDataStructure(this.shaderUniformSetters, Map, "Unable to destroy shader uniform setters");
	
		destroySurface(this.applicationSurface);
		destroySurface(this.screenSurface);
		destroySurface(this.gameSurface);
		destroySurface(this.shaderSurface);		
		destroySurface(this.guiSurface);
		destroySurface(this.jumbotronSurface);
	
		destroyDataStructure(this.scoreNotifyEffectPipeline, List, "Unable to destroy scoreNotifyEffectPipeline");
	}
	
	this.cleanUp();
	
