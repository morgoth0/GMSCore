
/*
	GMS_fnc_removeLauncher

	Purpose: remove launcher and rounds from a unit including any on the ground nearObjectsReady

	Parameters
		_unit: the unit to be processed

	Return: none.
*/
//#include "GMSCore\init\GMS_defines.hpp" "\addons\GMSCore\init\GMS_defines.hpp"
//#include "GMSCore\init\GMS_defines.hpp" "\addons\GMSCore\init\GMS_defines.hpp"
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