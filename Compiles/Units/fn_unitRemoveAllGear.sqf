/*
	GMS_fnc_unitRemoveAllGear

	Purpose: strip all gear from a unit.

	Parameters: The unit to be HandleDamage
	
	Return: none
*/
//#include "GMSCore\init\GMS_defines.hpp" "\addons\GMSCore\init\GMS_defines.hpp"
params["_unit"];
removeVest _unit;
removeHeadgear _unit;
removeGoggles _unit;
removeAllItems _unit;
removeAllWeapons _unit;
removeBackpackGlobal _unit;
removeUniform _unit;