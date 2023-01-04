///@description Star entity

///@function createStar(position, target, sprite, speedValue, scale, alpha)
///@description Constructor for Star entity.
///@param {Position} position
///@param {Position} target
///@param {Sprite} sprite
///@param {Number} speedValue
///@param {Number} scale
///@param {Number} alpha
///@return {Star} star 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.935Z}

function createStar(position, target, sprite, speedValue, scale, alpha) {

	var star = createEntity(Star);

	setStarPosition(star, assertNoOptional(position));
	setStarTarget(star, assertNoOptional(target));
	setStarSprite(star, assertNoOptional(sprite));
	setStarSpeedValue(star, assertNoOptional(speedValue));
	setStarScale(star, assertNoOptional(scale));
	setStarAlpha(star, assertNoOptional(alpha));

	return star;
	
}
///@function serializeStar(star)
///@description Serialize Star to JSON string.
///@param {Star} star
///@return {String} starJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.935Z}

function serializeStar(star) {

	var jsonObject = createJsonObject();

	appendEntityToJsonObject(
		jsonObject,
		"position",
		getStarPosition(star),
		"Position");
	
	appendEntityToJsonObject(
		jsonObject,
		"target",
		getStarTarget(star),
		"Position");
	
	appendEntityToJsonObject(
		jsonObject,
		"sprite",
		getStarSprite(star),
		"Sprite");
	
	appendFieldToJsonObject(
		jsonObject,
		"speedValue",
		getStarSpeedValue(star));	
	appendFieldToJsonObject(
		jsonObject,
		"scale",
		getStarScale(star));	
	appendFieldToJsonObject(
		jsonObject,
		"alpha",
		getStarAlpha(star));	

	var starJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return starJsonString;
	
}
///@function deserializeStar(jsonString)
///@description Deserialize Star from JSON String to Star entity.
///@param {String} jsonString
///@return {Star} star 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.935Z}

function deserializeStar(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var position = assertNoOptional(getJsonObjectFieldValue(jsonObject, "position", Entity, "Position"));
	var target = assertNoOptional(getJsonObjectFieldValue(jsonObject, "target", Entity, "Position"));
	var sprite = assertNoOptional(getJsonObjectFieldValue(jsonObject, "sprite", Entity, "Sprite"));
	var speedValue = assertNoOptional(getJsonObjectFieldValue(jsonObject, "speedValue"));
	var scale = assertNoOptional(getJsonObjectFieldValue(jsonObject, "scale"));
	var alpha = assertNoOptional(getJsonObjectFieldValue(jsonObject, "alpha"));

	destroyJsonObject(jsonObject);
	
	return createStar(position, target, sprite, speedValue, scale, alpha);
	
}
///@function destroyStar(star)
///@description Destroy Star entity.
///@param {Star} star
///@throws {Exception}
///@generated {2022-08-18T22:24:59.935Z}

function destroyStar(star) {


	
	var position = getStarPosition(star);
	var target = getStarTarget(star);
	var sprite = getStarSprite(star);
	var speedValue = getStarSpeedValue(star);
	var scale = getStarScale(star);
	var alpha = getStarAlpha(star);
	
	destroyPosition(position);
	setStarPosition(star, null);
	
	destroyPosition(target);
	setStarTarget(star, null);
	
	destroySprite(sprite);
	setStarSprite(star, null);
	

	
}
///@function getStarAlpha(star)
///@description Getter.
///@param {Star} star
///@return {Number} alpha 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.935Z}

function getStarAlpha(star) {

	return star[@ 5];
	
}
///@function getStarPosition(star)
///@description Getter.
///@param {Star} star
///@return {Position} position 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.935Z}

function getStarPosition(star) {

	return star[@ 0];
	
}
///@function getStarScale(star)
///@description Getter.
///@param {Star} star
///@return {Number} scale 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.935Z}

function getStarScale(star) {

	return star[@ 4];
	
}
///@function getStarSpeedValue(star)
///@description Getter.
///@param {Star} star
///@return {Number} speedValue 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.935Z}

function getStarSpeedValue(star) {

	return star[@ 3];
	
}
///@function getStarSprite(star)
///@description Getter.
///@param {Star} star
///@return {Sprite} sprite 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.935Z}

function getStarSprite(star) {

	return star[@ 2];
	
}
///@function getStarTarget(star)
///@description Getter.
///@param {Star} star
///@return {Position} target 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.935Z}

function getStarTarget(star) {

	return star[@ 1];
	
}
///@function setStarAlpha(star, alpha)
///@description Setter.
///@param {Star} star
///@param {Number} alpha
///@throws {Exception}
///@generated {2022-08-18T22:24:59.935Z}

function setStarAlpha(star, alpha) {

	star[@ 5] = alpha;
	
}
///@function setStarPosition(star, position)
///@description Setter.
///@param {Star} star
///@param {Position} position
///@throws {Exception}
///@generated {2022-08-18T22:24:59.935Z}

function setStarPosition(star, position) {

	star[@ 0] = position;
	
}
///@function setStarScale(star, scale)
///@description Setter.
///@param {Star} star
///@param {Number} scale
///@throws {Exception}
///@generated {2022-08-18T22:24:59.935Z}

function setStarScale(star, scale) {

	star[@ 4] = scale;
	
}
///@function setStarSpeedValue(star, speedValue)
///@description Setter.
///@param {Star} star
///@param {Number} speedValue
///@throws {Exception}
///@generated {2022-08-18T22:24:59.935Z}

function setStarSpeedValue(star, speedValue) {

	star[@ 3] = speedValue;
	
}
///@function setStarSprite(star, sprite)
///@description Setter.
///@param {Star} star
///@param {Sprite} sprite
///@throws {Exception}
///@generated {2022-08-18T22:24:59.935Z}

function setStarSprite(star, sprite) {

	star[@ 2] = sprite;
	
}
///@function setStarTarget(star, target)
///@description Setter.
///@param {Star} star
///@param {Position} target
///@throws {Exception}
///@generated {2022-08-18T22:24:59.935Z}

function setStarTarget(star, target) {

	star[@ 1] = target;
	
}
