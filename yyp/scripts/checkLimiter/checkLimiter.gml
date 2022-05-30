///@function checkLimiter(instance)
///@description Check limiter
///@param {Id} instance
///@return {Integer} isLimitReached
function checkLimiter(argument0) {

		return argument0.limiterCounter >= getInstanceVariable(argument0, "limiterLimit");
	



}
