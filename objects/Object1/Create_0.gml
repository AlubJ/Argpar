// Test

ArgparRegister("test", [  ], [  ], [ false ]);
ArgparRegister("default", [  ], [ ty_string ], [ "" ]);
ArgparRegister("resolution", [ "res" ], [ ty_real, ty_real ], [1366, 768] );
ArgparParse();

if (ArgparGet("test") == true)
{
    show_message($"Arg test == true");
}

show_message($"{ArgparGet("resolution")}");