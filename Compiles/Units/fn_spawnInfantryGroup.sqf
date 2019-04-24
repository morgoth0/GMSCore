/*
	GMS_fnc_spawnInfantryGroup

	Purpose: spawn a group of N infantry units as a specified position.

	Parameters
		_groupPos: postion at which to spawn the overall group; individual units will be spawned at safe spots in the region of the group position.
		_units: number of units to spawn for the group.
		_alertDistance: how far to search for players that the group should know about.
		
	Return: the group that was spawned.
*/
//#include "GMSCore\init\GMS_defines.hpp" "\addons\GMSCore\init\GMS_defines.hpp"
params["_groupPos","_units","_alertDistance"];
private _group = createGroup GMS_side;
_players = _groupPos nearEntities["Man",_alertDistance] select {isPlayer _x};
{_group reveal[_x,1]} forEach _players;
for "_i" from 1 to _units do
{
	_u = _group createUnit [GMS_unitType,_groupPos,[],10,"NONE"];
	if (toLower(GMS_modType) isEqualTo "epoch") then {_u setVariable ["LAST_CHECK",28800,true]};	
};
_group

