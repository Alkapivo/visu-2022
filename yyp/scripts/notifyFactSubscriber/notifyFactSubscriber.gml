///@function notifyFactSubscriber(subscriber)
///@description Set factNotifify in subscriber.
function notifyFactSubscriber(argument0) {

	#macro FactNotify "factNotify"

		var subscriber = argument0;
	
		setInstanceVariable(subscriber, FactNotify, true);
	



}
