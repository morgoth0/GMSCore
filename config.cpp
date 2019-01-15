class CfgPatches {
	class GMSCore {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {};
	};
};
class CfgFunctions {
	class GMS {
		class GMS_Initialization {
			file = "addons\GMSCore\init";
			class Initialize {postInit = 1;};
		};
		class GMS_CoreFunctions {
			file = "addons\GMSCore\Compiles\Functions";
			class getNumberFromRange {};
			class getIntegerFromRange {};
			class dynamicConfigs {};
 			class findRandomPosWithinArea {};
		};
		class GMS_Units {
			file = "addons\GMSCore\Compiles\Units";
			class spawnInfantryGroup {};
			class despawnInfantryGroup {};
			class setupGroupSkills {};
			class setupGroupGear {};
			class setupGroupBehavior {};			
			class unitRemoveAllGear {};
			class setupGroupMoney {};
		};
	};
};
