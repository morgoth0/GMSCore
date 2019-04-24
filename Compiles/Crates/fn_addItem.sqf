/*
    Add Item to Container
    Params: container, Item, ammo to add (weapons only)
		Item can be either: "classname" or ["classname",count] or ["Classname",min count, max count]
    Returns True/false
*/

	params["_itemInfo","_crate",["_addAmmo",0]];
	
	private _isWeapon = false;
	private _isMagazine = false;
	private _isBackpack = false;
	private _quant = 0;
	//diag_log format["_fn_addItemToCrate:: -- >> itemInfor = %1",_itemInfo];
	if (typeName _itemInfo isEqualTo "STRING") then {_item = _itemInfo; _quant = 1};  // case where only the item descriptor was provided
	if (typeName _itemInfo isEqualTo "ARRAY") then {
		
		if (count _itemInfo isEqualTo 2) then {_item = _itemInfo select 0; _quant = _itemInfo select 1;}; // case where item descriptor and quantity were provided
		if (count _itemInfo isEqualto 3) then {
			_item = _itemInfo select 0; 
			_quant = (_itemInfo select 1) + round(random((_itemInfo select 2) - (_itemInfo select 1)));
		}; // case where item descriptor, min number and max number were provided.
	};
	if (((typeName _item) isEqualTo "STRING") && (_item != "")) then
	{
		if (isClass(configFile >> "CfgWeapons" >> _item)) then {
			_crate addWeaponCargoGlobal [_item,_quant]; 
			//_isWeapon = true;
			_count = 0;
			if (typeName _addAmmo isEqualTo "SCALAR") then
			{
				_count = _addAmmo;
			};
			if (typeName _addAmmo isEqualto "ARRAY") then
			{
				_count = (_addAmmo select 0) + (round(random((_addAmmo select 1) - (_addAmmo select 0))));
			};
			_ammo = getArray (configFile >> "CfgWeapons" >> _item >> "magazines");			
			for "_i" from 1 to _count do
			{
					_crate addMagazineCargoGlobal [selectRandom _ammo,1];
			};
		} else {
			if (_item isKindOf ["Bag_Base", configFile >> "CfgVehicles"]) then 
			{
				_crate addBackpackCargoGlobal [_item,_quant]; 
				//_isBackpack = true;
			} else {
				if (isClass(configFile >> "CfgMagazines" >> _item)) then 
				{
					_crate addMagazineCargoGlobal [_item,_quant]; 
					//_isMagazine = true;
				} else {
					//if (!_isWeapon && !_isMagazine && _isBackpack && isClass(configFile >> "CfgVehicles" >> _item)) then {
					_crate addItemCargoGlobal [_item,_quant];
				};
			};
		};
	};

