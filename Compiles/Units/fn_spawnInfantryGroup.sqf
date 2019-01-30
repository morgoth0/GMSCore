params["_groupPos","_units","_alertDistance"];
private _group = createGroup GMS_side;
_players = _groupPos nearEntities["Man",_alertDistance] select {isPlayer _x};
{_group reveal[_x,1]} forEach _players;
for "_i" from 1 to _units do
{
	_u = _group createUnit [GMS_unitType,_groupPos,[],10,"NONE"];
	if (toLower(GMS_modType) isEqualTo "epoch") then {_u setVariable ["LAST_CHECK",28800,true]};	
};
_group

