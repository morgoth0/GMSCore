
if ( !(isServer) || hasInterface) exitWith{};
if !(isNil "GMSCore_Initialized") exitWith{};
execVM "addons\GMSCore\init\GMSCore_init.sqf";
diag_log "[GMSCore] initialized";
true