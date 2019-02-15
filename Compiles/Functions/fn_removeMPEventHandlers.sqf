params["_object","_eh"];
diag_log format["_removeMPEventHandlers: _object = %1 | _eh = %2",_object,_eh];
{
    _object removeAllMPEventHandlers _x;
} forEach _eh;