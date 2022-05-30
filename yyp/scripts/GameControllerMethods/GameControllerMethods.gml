///@return {Optional<GameController>} gameController
function getGameController() {

	return global.gameControllerContext;
}

///@param {T?GMInstance} context
function resolveGameplayTime(context) {
		
	#region Sanitize
	var __gameplayTime = injectInstanceVariable(context, "gameplayTime", 0.0);
	if (!isNumber(__gameplayTime)) {
		
		__gameplayTime = 0.0;
		logger(
			"gameplayTime wasn't a number. Restoring default value: {0}", 
			LogType.WARNING,
			__gameplayTime
		);
	}
		
	if (__gameplayTime >= MAX_NUMBER - 1) {
		
		__gameplayTime = 0;
		logger(
			"Reset gameplayTime due to overflow. { gameplayTime: {0}, MAX_NUMBER: {1} }", 
			LogType.WARNING, 
			__gameplayTime,
			MAX_NUMBER
		);
	}
	#endregion
		
	__gameplayTime = applyDeltaTime(__gameplayTime);
	setInstanceVariable(context, "gameplayTime", __gameplayTime);
}

///@param {T?GMInstance} [context=getSceneController()]
///@return {Optional<Number>} gameplayTime
function getGameplayTime() {

	return getInstanceVariable(argument_count > 0 ? argument[0] : getSceneController(), "gameplayTime");
}

///@param {Integer} [playerIndex]
///@return {Number} score
function getGameplayScore() {

	var playerId = argument_count > 0 ? argument[0] : 0;
	return ""; ///@mock
}

function sendNotification(notification, color) {
	
	logger("{0}", LogType.DEBUG, notification); 
}