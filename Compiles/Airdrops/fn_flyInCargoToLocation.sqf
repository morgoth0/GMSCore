/*
    Fly In Cargo To Location
    Spawns a transport heli , routes it to a location, the heli drops cargo specificed by an array, leaves and despawns.
    parameters: aircraft class name, cargo (either a single item or array of items), drop location, spawn distance (options, default 2000 m)
*/
//  [_pos,_aircraftType,_payloadObject,_allowDamage,_visibleMarker,_mapMarker,_mapMarkerDeleteTime,_spawnDistance] 
params["_airdropPos","_aircraftClassName","_payload",["_allowDamage",true],["_visibleMarker",true],["_mapMarker",true],["_mapMarkerDeleteTime",3000],["_spawnDistance",2000]];
diag_log format["flyInCargoToLocation called at %1",diag_tickTime];
_labels = ["_airdropPos","_aircraftClassName","_payload","_allowDamage","_visibleMarker","_mapMarker","_mapMarkerDeleteTime","_spawnDistance"];
{
	diag_log format["Value 3: _this select %1 = %2",_forEachIndex, _this select _forEachIndex, _labels select _forEachIndex];
}forEach _this;
private _spawnPos = (_airdropPos) getPos[_spawnDistance,random(359)];
_distanceToDropZone = _spawnPos distance _spawnPos;
_distanceToFirstWP = _distanceToDropZone - 500;
private _aircraft = createVehicle[_aircraftType,_spawnPos,[],0,"FLY"];

_aircraft setVariable["payload",_payload];
_aircraft setVariable["allowdamage",_allowdamage];
_aircraft setVariable["visibleMarker",_visibleMarker];
_aircraft setVariable["mapMarker",_mapMarker];
_aircraft setVariable["markerDeleteTime",_mapMarkerDeleteTime];

private _dir = _aircraft getRelDir (_airdropPos);
_m = createMarker["spawnPos",_spawnPos];
_m setMarkerType "mil_dot";
_m setMarkerText "Spawn Position";
diag_log format["flyInCargoToLocation: _spawnPos = %1",_spawnPos];
_aircraft setFuel 1;
_aircraft engineOn true;
_aircraft flyInHeight 150;
createVehicleCrew _aircraft;
_group = group(driver _aircraft);
_deliverPayloadLocation = _airdropPos;
_wp1Distance = (_aircraft distance _airdropPos) - 500;
_wp1 = _group addWaypoint [position _aircraft getPos[_wp1Distance, _aircraft getRelDir (_airdropPos)],1,1,"targetappoach"];
_wp1 setWaypointPosition [position _aircraft getPos[_wp1Distance, _aircraft getRelDir (_airdropPos)],0];
_wp1 setWaypointStatements["true","this call GMS_fnc_selectDropWaypoint;"];
_wp2 = _group addWaypoint [_airdropPos, 1,2, "targetPosition"];
_wp2 setWaypointSpeed "LIMITED";
_wp2 setWaypointStatements ["true","this call GMS_fnc_arrivedOnStation;"];
_wp3 = _group addWaypoint [_airdropPos, 0, 3, "prepareDropoff"];
_wp3 setWaypointStatements["true","this call GMS_fnc_hoverAndDropoff;"];
_wp3 setWaypointSpeed "LIMITED";
//_wp3 setWaypointTimeout [5,7,9];
_positionDespawn = (_airdropPos) getPos[1000,round(random(359))];
_m = createMarker["despawnPos",_positionDespawn];
_m setMarkerType "mil_dot";
_m setMarkerText "Despawn Here";
_wp4 = _group addWaypoint[_positionDespawn,0,3,"despanPosn"];
_wp4 setWaypointStatements["true","this call GMS_fnc_cleanup;"];
_wp4 setWaypointSpeed "NORMAL";