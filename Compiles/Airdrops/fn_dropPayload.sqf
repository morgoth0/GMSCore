
//fn_dropPayload = {
	systemChat "Heli Arrived On Station";
	private["_marker","_smoke"];
	_group = group(_this);
	_aircraft = vehicle (_this);

	private _payload = _aircraft getVariable "payload";
	diag_log format["heli arrived on station, dropPayload called with heli = %1 and payload = %2",_heli,_payload];
	private _allowDamage = _aircraft getVariable "allowdamage";
	private _visibleMarker = _aircraft getVariable "visibleMarker";
	private _mapMarker = _aircraft getVariable "mapMarker";
	private _markerDeleteTime = _aircraft getVariable "markerDeleteTime";

	_pos = [position _supplyHeli select 0, position _supplyHeli select 1, 250]; 
	_chute = createVehicle ["I_Parachute_02_F",_pos,[],0,"FLY"];
	_payload setPos  _pos;
	_payload allowDamage false;
	_payload attachTo [_chute, [0, 0, -1.3]];

	if !(_aircraft getVariable["PayloadDelivered",false]) then
	{
		diag_log "=================";
		diag_log "payload delivered";
		_aircraft setVariable["PayloadDelivered",true];
	};	
	while {(getPosATL _payload) select 2 > 2} do {uiSleep 1};
	deleteVehicle _chute;
	uiSleep 1;
	if (_allowDamage) then {_payload allowDamage true};
	if (_visibleMarker) then {};
	if (_mapMarker) then 
	{
		_marker = createMarker[format["payload%1",_payload]];
		_marker setMarkerPos (getPos _payload);
		_marker setMarkerType "hd_dot";
		_marker setMarkerColor "COLORBLACK";
		_marker setMarkerText "Supplies";
	};

	
	