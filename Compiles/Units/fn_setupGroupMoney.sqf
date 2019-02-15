/*
	GMS_fnc_setGroupMoney

	Purpose: set the mony for units in a group.

	Parameters:
		_group, the group to be processed 
		_skillLevel: skill level of the group 
		_money: an array of money to add based on skill leaveVehicle

	Return: none

*/
#include "\addons\GMSCore\init\GMS_defines.hpp"
params["_group","_skillLevel","_money"];
if (GMS_modType isEqualTo "Epoch") then
{
	{_x setVariable["Crypto", (2 + (2*_skillLevel) + floor(random(_money select _skillLevel)))]} count (units _group);
};
if (GMS_modType isEqualTo "Exile") then
{
	{_x setVariable["ExileMoney", (2 + (2*_skillLevel) + floor(random(_money select _skillLevel)))]} count (units _group);
};
