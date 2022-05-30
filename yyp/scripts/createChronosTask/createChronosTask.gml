///@function createChronosTask(timer, duration, chronosEvent)
///@description Constructor for ChronosTask entity.
///@param {Number} timer
///@param {Number} duration
///@param {ChronosEvent} chronosEvent
///@return {ChronosTask} chronosTask 
///@throws {Exception}
///@generated {2021-05-01T23:49:40.823Z}

function createChronosTask(timer, duration, chronosEvent) {

	var chronosTask = createEntity(ChronosTask);

	setChronosTaskTimer(chronosTask, assertNoOptional(timer));
	setChronosTaskDuration(chronosTask, assertNoOptional(duration));
	setChronosTaskChronosEvent(chronosTask, assertNoOptional(chronosEvent));

	return chronosTask;
	
}
