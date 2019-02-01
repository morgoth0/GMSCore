//[] call GMS_fnc_configureMapParameters;
GMS_modType = if (!isNull (configFile >> "CfgPatches" >> "exile_server")) then {"Exile"} else {if (!isnull (configFile >> "CfgPatches" >> "a3_epoch_server")) then {"Epoch"} else {""}};
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
