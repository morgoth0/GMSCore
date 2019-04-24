/**
    addItemsFromArray
    Adds N items randomly selected from a weighted array to a container.
    Params: container, weighted array.
    Returns: container

    Array format: [count, [item1,weight, .. itemn,weight], count2, [item1,weight .. itemN,weight] ... ]
*/
params["_container","_loadout"];

{
	_x params["_count","_itemList"];
	for "_i" from 1 to _count do
	{
		[_container, selectRandomWeighted _itemList] call GMS_fnc_addItem;
	};
}forEach _loadout;
_container