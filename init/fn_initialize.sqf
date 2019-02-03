/*
	By Ghostrider [GRG]
	Copyright 2018
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.
*/
if ( !(isServer) || hasInterface) exitWith{diag_log "[GMSCore] ERROR: GMSCore SHOULD NOT BE RUN ON A CLIENT"};
if !(isNil "GMSCore_Initialized") exitWith{diag_log "[GMSCore] ERROR: GMSCore HAS ALREADY BEEN LOADED"};
call compileFinal preprocessFileLineNumbers "addons\GMSCore\init\GMSCore_init.sqf";
diag_log format["[GMSCore] initialized at %1",diag_tickTime];
