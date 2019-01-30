[] call GMS_fnc_configureMapParameters;
GMS_modType = if (!isNull (configFile >> "CfgPatches" >> "exile_server")) then {"Exile"} else {if (!isnull (configFile >> "CfgPatches" >> "a3_epoch_server")) then {"Epoch"} else {""}};
GMS_modType == "";
if ((tolower GMS_modType) isEqualto "epoch") then {
	GMS_Side = INDEPENDENT;
};
if ((toLower GMS_modType) isEqualTo "exile") then
{
	GMS_Side = EAST;
};

GMS_unitType = "I_G_Sharpshooter_F";
GMSCore_Initialized = true;
GMS_formation = "WEDGE";
/*
diag_log format["GMSCore: cfgType for I_G_Sharpshooter_F = %1",[GMS_unitType] call GMS_fnc_getCfgType];
diag_log format["GMSCore: isClass for I_G_Sharpshooter_F = %1",[GMS_unitType] call GMS_fnc_isClass];
diag_log format["GMSCore: getCfgType for Nonsens = %1",["Nonsens"] call GMS_fnc_getCfgType];
uisleep 1;
diag_log "[GMSCore] GMS_init COMPLETED";