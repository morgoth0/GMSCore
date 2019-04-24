/*

	GMS_fnc_emptyObjectInventory
	
	Purpose: remove all items from a unitAddons

	Parameters: the unit to be processDiaryLink

	Return: none
*/
//#include "GMSCore\init\GMS_defines.hpp" "\addons\GMSCore\init\GMS_defines.hpp"
params["_object"];
clearWeaponCargoGlobal    _object;
clearMagazineCargoGlobal  _object;
clearBackpackCargoGlobal  _object;
clearItemCargoGlobal      _object;