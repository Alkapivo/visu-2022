///@function fileExists(filepath, storageType)
///@description Check if file exists.
///@param {String} filepath
///@param {StorageType} [storageType=StorageType.LOCAL]
function fileExists() {

		///checkArgumentCount(1, argument_count, fileExists);

		var filepath = argument[0];
		var storageType = argument_count > 1 ? argument[1] : StorageType.LOCAL;
	
		if (isHtml5()) {
			switch (storageType) {
				case StorageType.LOCAL:
					return webStorageFileExistsOnServer(filepath) == "true";
					break;
				case StorageType.WEB_LOCAL_STORAGE:
					return webStorageFileExistsOnLocalStorage(filepath) == "true";
					break;
				default:
					logger("Unrecognized StorageType", LogType.ERROR);
					return false;
					break;
			}
		} else {
			return file_exists(filepath);
		}
	



}
