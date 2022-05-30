///@function invokeLimiter(instance, [amount])
///@description Increment limiterCounter
///@param {Id} instance
///@param {Integer} [amount]
function invokeLimiter() {

		var instance = id;
		var amount = argument_count > 1 ? (argument[1]) : 1;
		if (argument_count < 1) {
			logger("invokeLimiter must have at least 1 argument provided", LogType.ERROR);
		} else {
			instance = argument[0]	
		}
	
		instance.limiterCounter += amount;


}
