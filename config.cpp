class GMSCoreBuild {
	build = 0.1;
	buildDate = "2-15-19";
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
			file = "GMSCore\init";
			//class Initialize {postInit = 1;};
		};
		class GMS_CoreFunctions {
			file = "GMSCore\Compiles\Functions";
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
			class removeEventHandlers {};
			class removeMPEventHandlers {};
		};
		class GMS_Units {
			file = "GMSCore\Compiles\Units";
			class spawnInfantryGroup {};
			class despawnInfantryGroup {};
			class setupGroupSkills {};
			class setupGroupGear {};
			class setupGroupBehavior {};			
			class unitRemoveAllGear {};
			class setupGroupMoney {};
			class removeNVG {};
			class removeLauncher {};
			class throwSmoke {};
			class healSelf {};
		};
		class GMS_Vehicles {
			file = "GMSCore\Compiles\Vehicles";
			class loadVehicleCrew {};
		};
		class GMS_Crates {
			file = "GMSCore\Compiles\Crates";
			class spawnCrate {}; // which can be any object, but is a crate by default.
			class addItem {};
			class addItemsFromArray {};  // weighted array either a single array, or array of arrays.
			class spawnPayload {};
			class visibleMarker {};
		};
		class GMS_Airdrops {
			file = "GMSCore\Compiles\Airdrops";
			class selectDropWaypoint {};
			class flyInCargoToLocation {};
			//class dropCargoAtLocation {};
			class arrivedOnStation {};
			class cleanUp {};
			class dropPayload {};
			class hoverAndDropOff {};
		};
		class GMS_Players {
			file = "GMSCore\Compiles\Players";
			class giveTakeCrypto {};  // Please see credits in the sqf.
			class giveTakeRespect {};
			class giveTakeTabs {};
			class updatePlayerKills {};
		};
		class GMS_Client {
			file = "GMSCore\Compiles\Client";
			class messagePlayers {};
		};
	};
};
