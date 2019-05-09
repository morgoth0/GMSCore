
//fn_arrivedOnStation = {

	private _group = group(_this);
	private _aircraft = vehicle (_this);
	//_m = format["Heli Arrived On Station at  %1",getPos _aircraft];	
	//diag_log _m;
	//systemChat _m;
	_aircraft setSpeedMode "LIMITED";
	_group setCurrentWaypoint[_group,_aircraft getVariable "wp3Index"];

