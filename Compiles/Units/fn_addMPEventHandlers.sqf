params["_group","_eventHandlers"];  // where _eventHandlers is an array with the format ["an MP event handler function, name of event handler (e.g., "mpkilled")].
{
	private _unit = _x;
	{
		_x addMPEventHandler[x select 1,{_this call (_x select 0)}];
	} count _eventHandlers;
}count (units _group);