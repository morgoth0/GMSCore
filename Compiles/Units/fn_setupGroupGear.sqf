params["_group","_gear",["_launchersPerGroup",1],["_useNVG",false]];

	#define GMS_primary 0
	#define GMS_secondary 1
	#define GMS_throwable 2
	#define GMS_headgear 3
	#define GMS_uniforms 4
	#define GMS_vests 5
	#define GMS_backpacks 6
	#define GMS_launchers 7
	#define GMS_nvg 8
	#define GMS_binocs 9
	#define GMS_foodAndDrinks 10
	#define GMS_medical 11
	#define GMS_loot 12

private _lanchersAdded = 0;
(_gear select GMS_primary) params["_weapons","_chancePrimary","_chancePrimaryOptic","_chancePrimaryMuzzle","_chancePrimaryPointer","_chancePrimaryUnderbarrel"];
(_gear select GMS_secondary) params["_secondaryWeapons","_chanceSecondaryWeapon","_chanceSecondaryWeaponOptic","_chanceSecondaryWeaponMuzzle","_chanceSeconaryWeaponPointer"];
(_gear select GMS_throawables) params["_throawables","_chanceThroables"];
(_gear select GMS_headgear) params["_headgear","_chanceHeadgear"];
(_gear select GMS_uniforms) params["_uniforms","_chanceUniform"];
(_gear select GMS_vests) params["_vests","_chanceVest"];
{_gear select GMS_backpacks) params["_backpacks","_chanceBackpack"];
(_gear select GMS_launchers) params["_launchers","_chanceLaunchers"];
(_gear select GMS_nvg) params["_nvg","_chanceNVG"];
(_gear select GMS_binocs params["_binoculars","_chanceBinoculars"];
(_gear select GMS_foodAndDrinks) params ["_food","_chanceFood"];
(_gear select GMS_medical) params["_medical","_chanceMedical]"];
(_gear select GMS_loot) params["_loot","_chanceLoot"];

{
	private _unit = _x;
	_unit call GMS_fnc_unitRemoveAllGear;	
	if (random(1) < _chancePrimary) && !(_weapons isEqualTo {})) then
	{
		private _weap = selectRandom _weapons;  
		_unit addWeaponGlobal  _weap; 
		private _ammoChoices = getArray (configFile >> "CfgWeapons" >> _weap >> "magazines");
		private _optics = getArray (configfile >> "CfgWeapons" >> _weap >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
		private _pointers = getArray (configFile >> "CfgWeapons" >> _weap >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
		private _muzzles = getArray (configFile >> "CfgWeapons" >> _weap >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
		private _underbarrel = getArray (configFile >> "CfgWeapons" >> _weap >> "WeaponSlotsInfo" >> "UnderBarrelSlot" >> "compatibleItems");
		_unit addMagazines [selectRandom _ammoChoices, 3];
		if (random 1 < _chancePrimaryMuzzle) then {_unit addPrimaryWeaponItem (selectRandom _muzzles)};
		if (random 1 < _chancePrimaryOptic) then {_unit addPrimaryWeaponItem (selectRandom _optics)};
		if (random 1 < _chancePrimaryPointer) then {_unit addPrimaryWeaponItem (selectRandom _pointers)};
		if (random 1 < _chancePrimaryUnderbarrel) then {_unit addPrimaryWeaponItem (selectRandom _underbarrel)};
		if ((count(getArray (configFile >> "cfgWeapons" >> _weap >> "muzzles"))) > 1) then 
		{
			_unit addMagazine "1Rnd_HE_Grenade_shell";
		};
	};
	if (random(1) < _chanceSecondaryWeapon && !(_secondaryWeapons isEqualTo [])) then
	{
		private _weap = selectRandom _secondaryWeapons;
		if (random 1 < _chanceSecondaryWeaponMuzzle) then {_unit addPrimaryWeaponItem (selectRandom _muzzles)};
		if (random 1 < _chanceSecondaryWeaponOptic) then {_unit addPrimaryWeaponItem (selectRandom _optics)};
		if (random 1 < _chanceSeconaryWeaponPointer) then {_unit addPrimaryWeaponItem (selectRandom _pointers)};		
		private _ammoChoices = getArray (configFile >> "CfgWeapons" >> _weap >> "magazines");
		_unit addMagazines [selectRandom _ammoChoices, 2];		
	};
	if (random(1) < _chanceHeadgear && !(_headgear isEqualTo [])) then 
	{
		_unit addHeadgear (selectRandom _headgear);
	};
	if (random(1) < _chanceUniform && !(_uniforms isEqualTo [])) then
	{
		_unit forceAddUniform (selectRandom (_uniforms));
	};
	if (random(1) < _chanceVest))  isEqualTo [] && !(_vests isEqualTo [])) then 
	{
		_unit addVest (selectRandom _vests);
	};	
	if (random(1) < _chanceBackpack && !(_backpacks isEqualTo [])) then 
	{
		_unit addBackpack selectRandom _backpacks;
	};
	if (random(1) < _chanceThroables && !(_throawables isEqualTo [])) then
	{
		_unit addItem selectRandom (_throawables);
	};
	if (random(1) < _chanceBinoculars && !(_binoculars isEqualTo [])) then
	{
		_unit addWeapon (selectRandom _binoculars);
	};
	if (random(1) < _chanceFood) then
	{
		for "_i" from 1 to 2 do{_unit addItem selectRandom _food;};
	}
	if (random(1) < _chanceLoot && !(_food isEqualTo [])) then
	{
		for "_i" from 1 to 2 do {_unit addItem (selectRandom (_medical + _loot))};
	};
	if (random(1) < _chanceLoot && !(_loot isEqualTo [])) then
	{
		for "_i" from 1 to (1+floor(random(5))) do 
		{
			_unit addItem (selectRandom (_gear select GMS_items));
		};
	};
	if !(_launchers isEqualTo []) then
	{
		if (_lanchersAdded < _launchersPerGroup) then
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
	};
	if !((_gear select GMS_nvg) isEqualTo [] && random(1) < _chanceNVG) then
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