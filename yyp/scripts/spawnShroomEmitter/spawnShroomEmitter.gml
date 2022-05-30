///@function spawnShroomEmitter(positionBegin, positionEnd, duration, amount, interval, templates)
///@description ShroomEmitter spawner.
///@param {Position} positionBegin
///@param {Position} positionEnd
///@param {Number} duration
///@param {Integer} amount
///@param {Number} interval
///@param {ShroomTemplate[]} templates
function spawnShroomEmitter(argument0, argument1, argument2, argument3, argument4, argument5) {
	
		var positionBegin = argument0;
		var positionEnd = argument1;
		var duration = argument2;
		var amount = argument3;
		var interval = argument4;
		var templates = argument5;
	
		var shroomEmitter = createShroomEmitter(
			0.0,
			positionBegin,
			positionEnd,
			duration,
			amount,
			interval,
			templates);
		
		var shroomEmitters = fetchShroomEmitters();
		addToList(shroomEmitters, shroomEmitter);
	
							


}
