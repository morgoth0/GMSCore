params["_player","_amtTabs"];
_tabs = _player getVariable ["ExileMoney", 0];
_tabs = _tabs + _amtTabs;
_player setVariable ["ExileMoney", _tabs, true];
format["setPlayerMoney:%1:%2", _tabs, _player getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;