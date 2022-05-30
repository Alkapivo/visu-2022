///@description

	var tempException = catchException();
	if (isOptionalPresent(tempException)) {
		exception = tempException;
	} else {
		exception = createException(
			RuntimeException, 
			""
		);
	}
	
	blinkTimer += 1;
	if (blinkTimer > 60) {
		blinkTimer = 0;	
	}
	

	if (mouse_check_button(mb_left)) {
		game_restart();	
	}