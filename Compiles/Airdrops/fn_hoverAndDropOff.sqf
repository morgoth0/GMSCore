//fn_hoverAndDropoff = {
	_group = group _this;
	_heli = vehicle (_this);
	diag_log format["hover and drop waypoint reached at postion %1",getPos _heli];
	_heli call fn_dropPayload;	 
	_group setCurrentWaypoint[_group,4];