///@function destroyChronosTask(chronosTask)
///@description Destroy ChronosTask entity.
///@param {ChronosTask} chronosTask
///@throws {Exception}
///@generated {2021-05-01T23:43:41.226Z}

function destroyChronosTask(chronosTask) {


	
	var timer = getChronosTaskTimer(chronosTask);
	var duration = getChronosTaskDuration(chronosTask);
	var chronosEvent = getChronosTaskChronosEvent(chronosTask);
	
	destroyChronosEvent(chronosEvent);
	setChronosTaskChronosEvent(chronosTask, null);
	

	
}
