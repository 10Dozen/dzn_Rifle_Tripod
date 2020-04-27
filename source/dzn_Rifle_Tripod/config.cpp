class CfgPatches
{
	class dzn_Rifle_Tripod
	{
		units[] = {};
		weapons[] = {"dzn_tripod_rifle","dzn_tripod_rifle_tan","dzn_tripod_rifle_od"};
		requiredVersion = 0.1;
		requiredAddons[] = {"CBA_MAIN","asdg_jointrails"};
		author = "10Dozen";
		version = "1";
	};
};

class Extended_PostInit_EventHandlers
{
	class dzn_rifle_Tripod
	{
		init = call compile preprocessFileLineNumbers "\dzn_Rifle_Tripod\Init.sqf";
	};
};

class asdg_SlotInfo;
class asdg_UnderSlot: asdg_SlotInfo
{
	class compatibleItems
	{
		dzn_tripod_rifle = 1;
		dzn_tripod_rifle_od = 1;
		dzn_tripod_rifle_tan = 1;
	};
};

class CowsSlot;

class CfgWeapons
{
	class ItemCore;
	class InventoryUnderItem_Base_F;
	class dzn_tripod_rifle: ItemCore
	{
		scope=2;
		author="10Dozen";
		displayName="Rifle Tripod";
		picture = "\dzn_Rifle_Tripod\data\ui\tripod_rifle_ca.paa";
		model="\dzn_Rifle_Tripod\tripod_rifle.p3d";
		class ItemInfo: InventoryUnderItem_Base_F
		{
			deployedPivot    = "bipod";       /// what point should be used to be on surface while unfolded
			hasBipod         = true;          /// bipod obviously has a bipod
			mass             = 40;            /// what is the mass of the object
			soundBipodDeploy[] = { "A3\Sounds_F_Mark\arsenal\sfx\bipods\Bipod_generic_deploy", 0.70794576, 1, 20 };
			soundBipodFold[] = { "A3\Sounds_F_Mark\arsenal\sfx\bipods\Bipod_generic_fold", 0.70794576, 1, 20 };
			soundBipodDown[] = { "A3\Sounds_F_Mark\arsenal\sfx\bipods\Bipod_generic_down", 0.70794576, 1, 20 };
			soundBipodUp[] = { "A3\Sounds_F_Mark\arsenal\sfx\bipods\Bipod_generic_up", 0.70794576, 1, 20 };
		};
		inertia = 1.25;
	};
	class dzn_tripod_rifle_tan: dzn_tripod_rifle
	{
		scope=2;
		author="10Dozen";
		displayName="Rifle Tripod (Sand)";
		picture = "\dzn_Rifle_Tripod\data\ui\tripod_rifle_tan_ca.paa";
		model="\dzn_Rifle_Tripod\tripod_rifle_tan.p3d";
	};
	class dzn_tripod_rifle_od: dzn_tripod_rifle
	{
		scope=2;
		author="10Dozen";
		displayName="Rifle Tripod (OD)";
		picture = "\dzn_Rifle_Tripod\data\ui\tripod_rifle_od_ca.paa";
		model="\dzn_Rifle_Tripod\tripod_rifle_od.p3d";
	};
};