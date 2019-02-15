params["_player","_amtRespect"];
private _respect = _player getVariable ["ExileScore", 0];
_respect = _respect + (_amtRespect);
_player setVariable ["ExileScore", _respect];
format["setAccountScore:%1:%2", _respect,getPlayerUID _player] call ExileServer_system_database_query_fireAndForget;