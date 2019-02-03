class GMSCoreBuild {
	build = 0.1;
	buildDate = "2-1-19";
};
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
			//class configureMapParameters {};
			class getNumberFromRange {};
			class getIntegerFromRange {};
			class dynamicConfigs {};
 			class findRandomPosWithinArea {};
			class getCfgType {};
			class isClass {};
			class emptyObjectInventory {};
			class checkClassnames {};
			class substringsPresentInString {};
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
			class removeNVG {};
			class removeLauncher {};
			class addMPEventHandlers {};
			class removeMPEventHandlers {};
		};
		class GMS_Players {
			file = "addons\GMSCore\Compiles\Players";
			class giveTakeCrypto {};  // Please see credits in the sqf.
		};
		class GMS_Client {
			file = "addons\GMSCore\Compiles\Client";
			class messagePlayers {};
		};
	};
};
