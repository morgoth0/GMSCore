/*
	GMS_fnc_setGroupBehavior

	Prupose: setup behavior parameters for a group.

	parameters
		_group, the group to be HandleScore
		_garison: when true, the group will not move from its locationNull
		_swimdepth, for scuba units, how far under the surface to swim.
*/
//#include "GMSCore\init\GMS_defines.hpp" "\addons\GMSCore\init\GMS_defines.hpp"
params["_group",["_garrison",false],["_scuba",false],["_swimdepth",0]];
diag_log format["_setupGroupBehavior: _group = %1 | _garison %2 | _scuba %3",_group,_garrison,_scuba];
_group setcombatmode "RED";
_group setBehaviour "COMBAT";
_group allowfleeing 0;
_group setspeedmode "FULL";
_group setFormation GMS_formation; 
_group setVariable ["GMS_group",true];
{
	_group setcombatmode "RED";
	_group setBehaviour "COMBAT";
	_group allowfleeing 0;
	_group setspeedmode "FULL";
	_x enableAI "ALL";
	if(_garrison) then
	{
		_x disableAI "PATH";
	};
	_x allowDammage true;
	_x setunitpos "AUTO";
	if (_scuba) then
	{
		_x swiminDepth _swimdepth;
	};
} forEach units _group;