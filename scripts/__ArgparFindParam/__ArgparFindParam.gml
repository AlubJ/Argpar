// Feather disable all

function __ArgparFindParam(_token)
{
    static _system = __ArgparSystem();
    
    with (_system)
    {
        var _names = variable_struct_get_names(__parameters);
        
        for (var _i = 0; _i < array_length(_names); _i++)
        {
            var _param = __parameters[$ _names[_i]];
            
            if (array_contains(_param.aliases, _token))
            {
                return _param;
            }
        }
    }
    
    return undefined;
}