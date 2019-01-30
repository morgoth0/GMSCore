params["_item"];
private _result = if ([_item] call GMS_fnc_getCfgType isEqualTo "") then {false} else {true};
_result