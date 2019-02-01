params["_group","_gear",["_launchersPerGroup",1],["_useNVG",false]];

	#define GMS_primary 0
	#define GMS_secondary 1
	#define GMS_throwable 2
	#define GMS_headgear 3
	#define GMS_uniforms 4
	#define GMS_vests 5
	#define GMS_backpacks 6
	#define GMS_items 7
	#define GMS_throawables 8
	#define GMS_launchers 9
	#define GMS_nvg 10

private _lanchersAdded = 0;
{
	private _unit = _x;
	_unit call GMS_fnc_unitRemoveAllGear;
	if !((_gear select GMS_headgear) isEqualTo []) then 
	{
		_unit addHeadgear (selectRandom (_gear select GMS_headgear));
	};
	if !((_gear select GMS_uniforms) isEqualTo []) then
	{
	_unit forceAddUniform (selectRandom (_gear select GMS_uniforms));
	};
	if !((_gear select GMS_vests)  isEqualTo []) then 
	{
		_unit addVest (selectRandom (_gear select GMS_vests));
	};	
	if !((_gear select GMS_backpacks)  isEqualTo []) then 
	{
		_unit addBackpack selectRandom (_gear select GMS_backpacks);
	};
	if !((_gear select GMS_primary) isEqualTo []) then
	{
		private _weap = selectRandom (_gear select GMS_primary);  
		_unit addWeaponGlobal  _weap; 
		private _ammoChoices = getArray (configFile >> "CfgWeapons" >> _weap >> "magazines");
		private _optics = getArray (configfile >> "CfgWeapons" >> _weap >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
		private _pointers = getArray (configFile >> "CfgWeapons" >> _weap >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
		private _muzzles = getArray (configFile >> "CfgWeapons" >> _weap >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
		private _underbarrel = getArray (configFile >> "CfgWeapons" >> _weap >> "WeaponSlotsInfo" >> "UnderBarrelSlot" >> "compatibleItems");
		private _legalOptics = _optics;
		_unit addMagazines [selectRandom _ammoChoices, 3];
		if (random 1 < 0.4) then {_unit addPrimaryWeaponItem (selectRandom _muzzles)};
		if (random 1 < 0.4) then {_unit addPrimaryWeaponItem (selectRandom _legalOptics)};
		if (random 1 < 0.4) then {_unit addPrimaryWeaponItem (selectRandom _pointers)};
		if (random 1 < 0.4) then {_unit addPrimaryWeaponItem (selectRandom _muzzles)};
		if (random 1 < 0.4) then {_unit addPrimaryWeaponItem (selectRandom _underbarrel)};
		if ((count(getArray (configFile >> "cfgWeapons" >> _weap >> "muzzles"))) > 1) then 
		{
			_unit addMagazine "1Rnd_HE_Grenade_shell";
		};
	};
	if !((_gear select GMS_secondary)  isEqualTo []) then
	{
		private _weap = selectRandom (_gear select GMS_secondary);
		_unit addWeaponGlobal  _weap; 
		private _ammoChoices = getArray (configFile >> "CfgWeapons" >> _weap >> "magazines");
		_unit addMagazines [selectRandom _ammoChoices, 2];
	};
	if !((_gear select GMS_items) isEqualTo []) then
	{
		for "_i" from 1 to (1+floor(random(5))) do 
		{
			_unit addItem (selectRandom (_gear select GMS_items));
		};
	};
	if !((_gear select GMS_throawables) isEqualTo []) then
	{
		if (round(random 1) <= 0.6) then 
		{
			_unit addItem selectRandom (_gear select GMS_throawables);
		};	
	};
	if !((_gear select GMS_launchers) isEqualTo [] && _lanchersAdded < _launchersPerGroup) then
	{
		private _selectedLauncher = selectRandom (_gear select GMS_launchers);
		_unit addWeaponGlobal _selectedLauncher;
		_unit setVariable["GMS_launcher",_selectedLauncher];
		for "_i" from 1 to 3 do 
		{
			_unit addItemToBackpack (getArray (configFile >> "CfgWeapons" >> _selectedLauncher >> "magazines") select 0); // call BIS_fnc_selectRandom;
		};
		_lanchersAdded = _lanchersAdded + 1;
	};
	if !((_gear select GMS_nvg) isEqualTo []) then
	{
		if(sunOrMoon < 0.2 && _useNVG)then
		{
			private _selectedNVG = selectRandom (_gear select GMS_nvg);
			_unit addWeapon _selectedNVG;
			_unit setVariable["GMS_nvg",_selectedNVG];
		};
	};
} count (units _group);















/*
GMSAI_gearBlue = [
	_primary, 		//[]  primary weapons
	_handguns, 		// [] secondary weapons
	_throwableExplosives,  // [] throwables
	_headgear, 		//[] headgear
	_uniforms, 		// [] uniformItems
	_vests, 		//[] vests
	_backpacks, 	//[] backpacks
	_items, 		// [] items and equipment
	_launchers, 	// launchers
	_nvg
];