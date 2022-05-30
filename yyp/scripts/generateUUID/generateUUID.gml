///@function generateUUID()
///@description Generate valid UUID
///@return {String} uuid;
function generateUUID() {

		var bytes = createArray(16);
		for (var index = 0; index < getArrayLength(bytes); index++) {
			bytes[index] = irandom(255);
		}
	
		bytes[@ 6] = (0x40 | (bytes[6] & 0xF));
		bytes[@ 8] = (0x80 | (bytes[8] & 0x3F));

		var rawUUID = convertByteArrayToHex(bytes);

		var uuid = string_copy(rawUUID, 1, 8) + "-" +
			string_copy(rawUUID, 9, 4) + "-" +
			string_copy(rawUUID, 13, 4) + "-" +
			string_copy(rawUUID, 17, 4) + "-" +
			string_copy(rawUUID, 21, 12);
	
		return uuid;
	



}
