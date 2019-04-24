/*
	GMS_fnc_setGroupSkills

	Purpose: set skills for all units in a group.

	Parameters
		_group: the group to which this ACE_explosives_fnc_getPlacedExplosives
		_skills: an array of skills

	Return: nonoe
*/
//#include "GMSCore\init\GMS_defines.hpp" "\addons\GMSCore\init\GMS_defines.hpp"
params["_group","_skills"];
//diag_log format["_setupGroupSkills: _group = %1 | _skills = %2",_group,_skills];
_skills params["_accuracy","_aimingSpeed","_shake","_spotDistance","_spotTime","_courage","_reloadSpeed","_commanding","_general"];
{
	//_x setSkill _general;
	_x setSkill ["aimingAccuracy", _accuracy];
	_x setSkill ["aimingSpeed", _aimingSpeed];
	_x setSkill ["aimingShake", _shake];
	_x setSkill ["commanding", _commanding];
	_x setSkill ["courage", _courage];
	_x setSkill ["general", _general];
	_x setSkill ["reloadSpeed", _reloadSpeed];
	_x setSkill ["spotDistance", _spotDistance];
	_x setSkill ["spotTime", _spotTime];
} forEach (units _group);