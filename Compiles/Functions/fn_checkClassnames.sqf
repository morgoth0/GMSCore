/*

	GMS_fnc_checkClassnames

	Purpose: to validate classnames used for AI gear or other puposes

	Parametsrs:
		_classnames: an array of strings, each representing a possible className

		_return: true if the string is a valid classname.

*/
//#include "GMSCore\init\GMS_defines.hpp" "\addons\GMSCore\init\GMS_defines.hpp"
params["_classNames"];
//diag_log format["[GMS] fn_checkClassNames: _classNames = %1",_classNames];
private _return = [];
for "_i" from 1 to (count _classNames) do
{
	private _name = _classNames deleteAt 0;
	if ([_name] call GMS_fnc_isClass) then 
	{
		_return pushBack _name;
	} else {
		diag_log format["[GMSCore] fn_checkClassNames: invalid classname %1",_name];
	};
};
//diag_log format["_[GMSCore] fn_checkClassNames:  _return = %1",_return];
_return