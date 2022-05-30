///@function appendToString(sourceText, textToAppend, breakLine, breakLineSymbol)
///@description String builder
///@param {String} sourceText
///@param {String} textToAppend
///@param {Boolean} [breakLine=false]
///@param {String} [breakLineSymbol="\n"]
///@return {String} appendedText
function appendToString() {

		///checkArgumentCount(2, argument_count, appendToString);
	
		var sourceText = argument[0];
		var textToAppend = argument[1];
		var breakLine = argument_count > 2 ? argument[2] : false;
		var breakLineSymbol = argument_count > 3 ? argument[3] : "\n";
	
		var appendedText = stringParams("{0}{1}{2}", sourceText, textToAppend, breakLine ? breakLineSymbol : "");
	
		return appendedText;
	



}
