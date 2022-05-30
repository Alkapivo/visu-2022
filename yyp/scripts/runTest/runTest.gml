///@function runTest(testScriptName)
///@description Wrapper for running test
///@param {String} testScriptName
///@return {Boolean} testResult
function runTest(argument0) {

		var testScriptName = string(argument0);
		if (!isAsset(testScriptName, AssetScript)) {
			logger("[{0}] Unable to find test case", LogType.ERROR,
				testScriptName);
			return false;
		}

		var timeBefore = get_timer();
		logger("[{0}] Started", LogType.DEBUG, testScriptName);
	
		var testResult = script_execute(getAssetIndex(testScriptName, AssetScript));
	
		var timeAfter = (get_timer() - timeBefore) / 1000;
		var resultPrefix = testResult ? "positive" : "negative";
		logger("[{0}] Finished with {1} result. Test took {2} ms", LogType.DEBUG, 
			testScriptName, resultPrefix, timeAfter);



}
