params["_item"];
private _return = "";
if (isClass(configFile >> "CfgWeapons" >> _item)) then 
{
    _return = "CfgWeapons"
} else {
    if (isClass(configFile >> "CfgVehicles" >> _item)) then 
    {
        _return = "CfgVehicles"
    } else {
        if (isClass(configFile >> "CfgMagazines" >> _item)) then 
        {
            _return = "CfgMagazines"
        } else {
            if (isClass(configFile >> "CfgGlasses" >> _item)) then {_return = "CfgGlasses"};
        };
    };
};
_return