/*
	GMS_fnc_getNumberFromRange

	Purpose: find a random number within a range of N1 and N2.
	Parameters: _data in the format [_min,_max]. If _min == _max, _min is returned. If _data == [_min] or _min, _min is returned.
	Returns: a random number within the specified range.
*/
//#include "GMSCore\init\GMS_defines.hpp" "\addons\GMSCore\init\GMS_defines.hpp"
params["_data"];
_value = objNull;
if ((typeName _data) isEqualTo "ARRAY") then
{
	if ((count _data) == 1) then
	{
		_value = _data select 0;
	} else {
		if ((count _data) == 2) then
		{
			_min = _data select 0;
			_max = _data select 1;
			if (_max > _min) then 
			{
				_value = _min + random(_max - _min);
			} else {
				_value = _min;
			};
		} else {
			diag_log format["[GMSAI] Error: Array %1 must have 1 or 2 scalar elements",_data];
		};
	};
};
if (typeName _data isEqualTo "SCALAR") then
{
	_value = _data;
};
//diag_log format["_getIntegerFromRange: _this = %1 | _data = %2 | _value = %3",_this,_data,_value];
_value