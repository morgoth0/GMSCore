params["_group",["_garrison",false],["_scuba",false],["_swimdepth",0]];
_group setcombatmode "RED";
_group setBehaviour "COMBAT";
_group allowfleeing 0;
_group setspeedmode "FULL";
_group setFormation GMS_formation; 
_group setVariable ["GMS_group",true];
{
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