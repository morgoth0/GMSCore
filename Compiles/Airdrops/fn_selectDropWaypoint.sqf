//fn_selectDropWaypoint = {

	private _group = group _this;
	diag_log format["waypoint 1 reached at %1, slowing for paratroop deployment",getPos (leader _group)];
	_heli setSpeedMode "LIMITED";	
	_group setCurrentWaypoint [_group, 2];
