params["_object","_eh"];
//diag_log format["_removeEventHandlers: _object = %1 | _eh = %2",_object,_eh];
{
	_object removeAllEventHandlers _x;
} forEach _eh;