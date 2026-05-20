// Test

ArgparRegister("test", [  ], [  ], [ true ]);
ArgparRegister("default", [  ], [ ty_string ], [ "" ]);
ArgparParse();
show_debug_message(ArgparGet("default"));