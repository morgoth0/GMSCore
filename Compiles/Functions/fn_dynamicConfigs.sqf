params[["_blackListedItems",[]]];
_GMSCore_headgearList = [];
_GMSCore_SkinList = [];
_GMSCore_vests = [];
_GMSCore_backpacks = [];
_GMSCore_Pistols = [];
_GMSCore_primaryWeapons = [];
//_GMSCore_throwable = [];
_allWeaponRoots = ["Pistol","Rifle","Launcher"];
_allWeaponTypes = ["AssaultRifle","MachineGun","SniperRifle","Shotgun","Rifle","Pistol","SubmachineGun","Handgun","MissileLauncher","RocketLauncher","Throw","GrenadeCore"];
_addedBaseNames = [];
_allBannedWeapons = [];
_wpnAR = []; //Assault Rifles
_wpnARG = []; //Assault Rifles with GL
_wpnLMG = []; //Light Machine Guns
_wpnSMG = []; //Sub Machine Guns
_wpnDMR = []; //Designated Marksman Rifles
_wpnLauncher = [];
_wpnSniper = []; //Sniper rifles
_wpnHandGun = []; //HandGuns/Pistols
_wpnShotGun = []; //Shotguns
_wpnThrow = []; // throwables
_wpnUnknown = []; //Misc
_wpnUnderbarrel = [];
_wpnMagazines = [];
_wpnOptics = [];
_wpnPointers = [];
_wpnMuzzles = [];
_allBannedWearables = [];
_uniforms = [];
_headgear = []; 
_glasses = []; 
_masks = []; 
_backpacks = []; 
_vests = [];
_goggles = []; 
_NVG = []; 
_misc = [];
_baseClasses = [];	
_classnameList = [];
{
	private _temp = [_x] call bis_fnc_itemType;
	_itemCategory = _temp select 0;
	_itemType = _temp select 1;
	_price = _GMSCore_maximumItemPriceInAI_Loadouts;
	if (toLower(_GMSCore_modType) isEqualTo "epoch") then
	{
		_price = getNumber(missionConfigFile >> "CfgPricing" >> _x >> "price");
	};
	if (toLower(_GMSCore_modType)  isEqualTo "exile") then
	{
		_price = getNumber(missionConfigFile >> "CfgExileArsenal" >> _x >> "price");
	};
	if (_price < _GMSCore_maximumItemPriceInAI_Loadouts) then
	{
	if (_itemCategory isEqualTo "Weapon") then
	{
		switch (_itemType) do
		{
			case "AssaultRifle": {if !(_x in _blackListedItems) then {_wpnAR pushBack _x}};
			case "MachineGun": {if !(_x in _blackListedItems) then {_wpnLMG pushBack _x}};
			case "SubmachineGun": {if !(_x in _blackListedItems) then {_wpnSMG pushBack _x}};
			case "Shotgun": {if !(_x in _blackListedItems) then {_wpnShotGun pushBack _x}};
			case "Rifle": {if !(_x in _blackListedItems) then {_wpnAR pushBack _x}};
			case "SniperRifle": {if !(_x in _blackListedItems) then {_wpnSniper pushBack _x}};
			case "Handgun": {if !(_x in _blackListedItems) then {_wpnHandGun pushBack _x}};
			case "Launcher": {if !(_x in _blackListedItems) then {_wpnLauncher pushBack _x}};
			case "RocketLauncher": {if !(_x in _blackListedItems) then {_wpnLauncher pushBack _x}};
			case "Throw": {if !(_x in _blackListedItems) then {_wpnThrow pushBack _x}};
		};
	};
	
	if (_itemCategory isEqualTo "Item") then
	{
		switch (_itemType) do
		{
			case "AccessoryMuzzle": {if !(_x in _blackListedItems) then {_wpnMuzzles pushBack _x}};
			case "AccessoryPointer": {if !(_x in _blackListedItems) then {_wpnPointers pushBack _x}};
			case "AccessorySights": {if !(_x in _blackListedItems) then {_wpnOptics pushBack _x}};
			case "AccessoryBipod": {if !(_x in _blackListedItems) then {_wpnUnderbarrel pushBack _x}};
			case "Binocular": {if !(_x in _blackListedItems) then {_misc pushBack _x}};
			case "Compass": {if !(_x in _blackListedItems) then {_misc pushBack _x}};
			case "GPS": {if !(_x in _blackListedItems) then {_misc pushBack _x}};
			case "NVGoggles": {if !(_x in _blackListedItems) then {_NVG pushBack _x}};		
		};
	};
		
	if (_itemCategory isEqualTo "Equipment") then
	{
		switch (_itemType) do
		{
			case "Glasses": {if !(_x in _blackListedItems) then {_glasses pushBack _x}};
			case "Headgear": {if !(_x in _blackListedItems) then {_headgear pushBack _x}};
			case "Vest": {if !(_x in _blackListedItems) then {_vests pushBack _x}};
			case "Uniform": {if !(_x in _blackListedItems) then {_uniforms pushBack _x}};
			case "Backpack": {if !(_x in _blackListedItems) then {_backpacks pushBack _x}};
		};
	};
	};
} forEach _classnameList;

private _return = 
	[_wpnAR + _wpnLMG + _wpnSMG + _wpnShotGun + _wpnSniper,
	_wpnHandGun,
	_headgear,
	_uniforms,
	_vests,
	_wpnThrow,
	_wpnLauncher
	];
diag_log format["Compilation of dynamic AI Loadouts complete at %1",diag_tickTime];
_return