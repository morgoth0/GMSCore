params["_unit"];
private _lancher = _unit getVariable["GMS_launcher",""];
if !(_lancher isEqualTo "") then
{
	private _rounds = getArray (configFile >> "CfgWeapons" >> _selectedLauncher >> "magazines");
	_unit removeWeapon _lancher;
	{
		_unit removeMagazines _x;
	} count _rounds;
	{deleteVehicle _x} count (_unit nearObjects [_lancher,5]);
};