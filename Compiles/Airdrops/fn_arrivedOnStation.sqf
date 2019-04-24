
//fn_arrivedOnStation = {

	_group = group(_this);
	_heli = vehicle (_this);
	diag_log format[]"Heli Arrived On Station at  %1",getPos _heli];	
	_heli setSpeedMode "LIMITED";
	_this call fn_dropPayload;