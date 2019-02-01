params["_unit"];
private _nvg = _unit getVariable["GMS_nvg",""];
if !(_nvg isEqualTo "") then
{
    _unit unassignitem _nvg; 
    _unit removeweapon _nvg;
};