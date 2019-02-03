/*
	GMS_fnc_setGroupSkills

	Purpose: set skills for all units in a group.

	Parameters
		_group: the group to which this ACE_explosives_fnc_getPlacedExplosives
		_skills: an array of skills

	Return: nonoe
*/

params["_group","_skills"];
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
} count (units _group);

/*
GMSAI_skillBlue = [ 
	// _skills params["_accuracy","_aimingSpeed","_shake","_spotDistance","_spotTime","_courage","_reloadSpeed","_commanding","_general"];
	0.15,  // accuracy
	0.15,  // aiming speed
	0.15, // aiming shake
	0.50, // spot distance
	0.50, // spot time
	0.50, // courage
	0.50, // reload speed
	0.75, // commanding
	0.70 // general, affects decision making
];