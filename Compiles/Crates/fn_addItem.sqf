/*
    Add Item to Container
    Params: container, Item, ammo to add (weapons only)
		Item can be either: "classname" or ["classname",count] or ["Classname",min count, max count]
    Returns True/false
*/

	params["_container",  // object into which items should be loaded
				"_itemInfo",    // an item to be loaded formated as "classnName", ["className", count], or ["className",min count, max count]
				["_addAmmo",0]  // # of magazines to add for a weapon
			];
	
	private _quant = 0;
	private _itemClassName = "";
	//diag_log format["_fn_addItem:: -- >> itemInfo = %1 | typeName itemInfo %2",_itemInfo,typeName _itemInfo];
	if (typeName _itemInfo isEqualTo "STRING") then {_itemClassName = _itemInfo; _quant = 1};  // case where only the item descriptor was provided
	if (typeName _itemInfo isEqualTo "ARRAY") then {
		
		if (count _itemInfo isEqualTo 2) then {_itemClassName = _itemInfo select 0; _quant = _itemInfo select 1;}; // case where item descriptor and quantity were provided
		if (count _itemInfo isEqualto 3) then {
			_itemClassName = _itemInfo select 0; 
			_quant = (_itemInfo select 1) + round(random((_itemInfo select 2) - (_itemInfo select 1)));
		}; // case where item descriptor, min number and max number were provided.
	};
	//diag_log format["_itemClassName %1 | _quant %2",_itemClassName,_quant];
	if (((typeName _itemClassName) isEqualTo "STRING") && (_itemClassName != "")) then
	{
		if (isClass(configFile >> "CfgWeapons" >> _itemClassName)) then {
			//diag_log format["_addItem: adding item %1 to container %2",_itemClassName,_container];
			_container addWeaponCargoGlobal [_itemClassName,_quant]; 
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
			_ammo = getArray (configFile >> "CfgWeapons" >> _itemClassName >> "magazines");			
			for "_i" from 1 to _count do
			{
					//diag_log format["addItem: adding ammo to container %1",_container];
					_container addMagazineCargoGlobal [selectRandom _ammo,1];
			};
		} else {
			if (_itemClassName isKindOf ["Bag_Base", configFile >> "CfgVehicles"]) then 
			{
				_container addBackpackCargoGlobal [_itemClassName,_quant]; 
				//_isBackpack = true;
			} else {
				if (isClass(configFile >> "CfgMagazines" >> _itemClassName)) then 
				{
					_container addMagazineCargoGlobal [_itemClassName,_quant]; 
					//_isMagazine = true;
				} else {
					//if (!_isWeapon && !_isMagazine && _isBackpack && isClass(configFile >> "CfgVehicles" >> _itemClassName)) then {
					_container addItemCargoGlobal [_itemClassName,_quant];
				};
			};
		};
	};

