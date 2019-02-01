params["_group","_skillLevel","_money"];
if (GMS_modType isEqualTo "Epoch") then
{
	{_x setVariable["Crypto", (2 + (2*_skillLevel) + floor(random(_money select _skillLevel)))]} count (units _group);
};
if (GMS_modType isEqualTo "Exile") then
{
	{_x setVariable["ExileMoney", (2 + (2*_skillLevel) + floor(random(_money select _skillLevel)))]} count (units _group);
};
