
//fn_dropPayload = {
	systemChat "Heli Arrived On Station";
	private["_marker","_smoke"];
	params["_aircraft"];
	private _payload = _aircraft getVariable "payload";
	if (isNil "_payload") exitWith {};
	_aircraft setVariable["payload",nil];
	//_m = format["heli arrived on station, dropPayload called with heli = %1 and payload = %2",_aircraft,_payload];
	//systemChat _m;
	//diag_log _m;
	private _allowDamage = _aircraft getVariable "allowdamage";
	private _visibleMarker = _aircraft getVariable "visibleMarker";
	private _mapMarker = _aircraft getVariable ["mapMarker",false];
	private _dropPos = _aircraft getVariable["dropPos",getPos _aircraft];
	//_m = format["payload will be dropped at %1",_dropPos];
	//systemChat _m;
	//diag_log _m;
	_pos = [(position _aircraft) select 0,  (position _aircraft) select 1, 100]; 
	_chute = createVehicle ["I_Parachute_02_F",_pos,[],0,"FLY"];
	_payload setPos  _pos;
	_payload allowDamage false;
	_payload attachTo [_chute, [0, 0, -1.3]];

	if !(_aircraft getVariable["PayloadDelivered",false]) then
	{
		//diag_log "=================";
		//diag_log "payload delivered";
		_aircraft setVariable["PayloadDelivered",true];
	};	
	while {(getPosATL _payload) select 2 > 1.0} do {_time = diag_tickTime;waitUntil {(diag_tickTime - _time) > 2}};
	deleteVehicle _chute;
	_pos = getPosATL _payload;
	_payload setPosATL[_pos select 0,_pos select 1,0.2];
	_payload setVectorUp[0,0,1];
	uiSleep 1;
	if (_allowDamage) then {_payload allowDamage true};
	if (_visibleMarker) then {[_payload,300] call GMS_fnc_visibleMarker;};
	if (_mapMarker) then 
	{
		_marker = createMarker[format["payload%1",_payload]];
		_marker setMarkerPos (getPos _payload);
		_marker setMarkerType "hd_dot";
		_marker setMarkerColor "COLORBLACK";
		_marker setMarkerText "Supplies";
	};
	// push the marker to list of monitored markers GMS_var_monitoredMarkers pushBack [_marker, _aircraft getVariable "markerDeleteTime"];
	
	