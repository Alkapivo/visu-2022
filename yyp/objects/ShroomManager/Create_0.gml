///@description

	super();
	
	#region Fields
///@public:

	//@type {List<GridElement>}
	shrooms = createList();
	
	///@type {Map<String::ShaderEvent>}
	shroomShaderEventTemplates = createMap();
	
	///@type {String}
	currentShaderTemplate = ""
	
///@private:

	///@type {Number}
	templateTimer = 0.0;
	
	///@type {String[]}
	templateNames = [];

	#endregion

	#region Initialize shroomShaderEventTemplates
	
	shaderEventEffectEmboss = createShaderEvent(
		"Emboss",
		2.4,
		createMap());
	shaderEventEffectLED = createShaderEvent(
		"LED",
		2.2,
		createMap(
			[ "brightness", 1.5 ],
			[ "ledSize", 128 ]
		));
	shaderEventEffectMagnifyLeftToRight = createShaderEvent(
		"Magnify",
		3.0,
		createMap(
			[ "positionX", [ 0.3, 0.8, 0.002 ] ],
			[ "positionY", 0.5 ],
			[ "radius", [ 0.25, 0.40, 0.01 ] ],
			[ "minZoom", [ 0.30, 0.60, 0.02 ] ],
			[ "maxZoom", [ 0.60, 0.90, 0.02] ]));
	shaderEventEffectMagnifyRightToLeft = createShaderEvent(
		"Magnify",
		3.0,
		createMap(
			[ "positionX", [ 0.8, 0.3, 0.002 ] ],
			[ "positionY", 0.5 ],
			[ "radius", [ 0.25, 0.40, 0.01 ] ],
			[ "minZoom", [ 0.30, 0.60, 0.02 ] ],
			[ "maxZoom", [ 0.60, 0.90, 0.02] ]));
	shaderEventEffectMosaic = createShaderEvent(
		"Mosaic",
		2.6,
		createMap(
			[ "amount", [ 80, 512, 2, 0.01 ] ]));
	shaderEventEffectWave = createShaderEvent(
		"Wave",
		1.9,
		createMap(
			[ "amount", [ 15, 25, 0.05 ] ],
			[ "distortion", [ 30, 45, 0.05 ] ],
			[ "speed", [ 2 ] ],
			[ "time",  [ 0, 1000, 0.01 ] ]));
	shaderEventEffectThermal = createShaderEvent(
		"Thermal",
		2.4,
		createMap());
	shaderEventEffectRevert = createShaderEvent(
		"Revert",
		2.4,
		createMap());
	shaderEventEffectRipple = createShaderEvent(
		"Ripple",
		4.8,
		createMap(
			[ "positionX", 0.5 ],
            [ "positionY", [ 0.3, 0.8, 0.002 ] ],
            [ "amount", [ 30, 40, 0.2 ] ],
            [ "distortion", 30 ],
            [ "speed", [ 1, 5, 0.02 ] ],
            [ "time", [ 0, 1000, 0.1 ] ]
		));
		
	addToMap(shroomShaderEventTemplates, "Emboss", shaderEventEffectEmboss);
	addToMap(shroomShaderEventTemplates, "LED", shaderEventEffectLED);
	addToMap(shroomShaderEventTemplates, "MagnifyLeftToRight", shaderEventEffectMagnifyLeftToRight);
	addToMap(shroomShaderEventTemplates, "MagnifyRightToLeft", shaderEventEffectMagnifyRightToLeft);
	addToMap(shroomShaderEventTemplates, "Mosaic", shaderEventEffectMosaic);
	addToMap(shroomShaderEventTemplates, "Wave", shaderEventEffectWave);
	addToMap(shroomShaderEventTemplates, "Thermal", shaderEventEffectThermal);
	addToMap(shroomShaderEventTemplates, "Revert", shaderEventEffectRevert);
	addToMap(shroomShaderEventTemplates, "Ripple", shaderEventEffectRipple);

	templateNames = [
		"Emboss",
		"LED",
		"MagnifyLeftToRight",
		"MagnifyLeftToRight",
		"MagnifyLeftToRight",
		"MagnifyRightToLeft",
		"MagnifyRightToLeft",
		"MagnifyRightToLeft",
		"Mosaic",
		"Mosaic",
		"Mosaic",
		"Wave",
		"Wave",
		"Wave",
		"Thermal",
		"Revert",
		"Ripple",
		"Ripple",
		"Ripple"
	]
	
	var templateNameIndex = clamp(round(random(getArrayLength(templateNames) - 1)), 0, getArrayLength(templateNames) - 1);
	currentShaderTemplate = templateNames[templateNameIndex];
	#endregion
	
