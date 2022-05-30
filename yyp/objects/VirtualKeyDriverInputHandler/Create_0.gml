///@description 

	super();
	
	#region Fields
	
///@public:

	///@type {KeySchema}
	keySchema = createMap(
		createTuple(KeyboardKeyType.KEY_UP, ord("T")),
		createTuple(KeyboardKeyType.KEY_LEFT, ord("F")),
		createTuple(KeyboardKeyType.KEY_RIGHT, ord("H")),
		createTuple(KeyboardKeyType.KEY_DOWN, ord("G")),
		createTuple(KeyboardKeyType.KEY_SPACE, ord("Y"))
	);

///@private:


	#endregion