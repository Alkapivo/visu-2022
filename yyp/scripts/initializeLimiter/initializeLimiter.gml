///@function initializeLimiter(instance, limit)
///@description Setup limiter variables.
///@param {Id} instance
///@param {Integer} limit
function initializeLimiter(argument0, argument1) {

		var instance = argument0;
		var limit = argument1;
	
		setInstanceVariable(instance, "limiterCounter", 0);
		setInstanceVariable(instance, "limiterLimit", limit);
	



}
