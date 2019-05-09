//fn_cleanup = {
	_heli = vehicle _this;
	[group _this] call GMS_fnc_despawnInfantryGroup;
	deleteVehicle _heli;
	//systemChat "transport cleanup handled";