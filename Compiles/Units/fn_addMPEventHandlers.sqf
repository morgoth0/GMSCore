//#include "GMSCore\init\GMS_defines.hpp" "\addons\GMSCore\init\GMS_defines.hpp"
params["_group","_eventHandlers"];  // where _eventHandlers is an array with the format ["an MP event handler function, name of event handler (e.g., "mpkilled")].
diag_log format["[GMSCore] _addMPEventHandlers: _group = %1  | _eventHandlers = %2",_group,_eventHandlers];
{
	private _unit = _x;
	{
		_x params["_EH_Type","_function"];
		diag_log format["[GMSAI]  _addMPEventHandlers: _EH_Type = %1 | _function = %2",_EH_Type,_function];
		_unit addMPEventHandler[_EH_Type,{_this call format["%1;",_function]}];
	} count _eventHandlers;
}count (units _group);