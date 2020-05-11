class CfgPatches
{
	class dzn_Rifle_Tripod
	{
		units[] = {};
		weapons[] = {
			"dzn_tripod_rifle"
			,"dzn_tripod_rifle_tan"
			,"dzn_tripod_rifle_od"
		};
		requiredVersion = 0.1;
		requiredAddons[] = {"CBA_MAIN","asdg_jointrails"};
		author = "10Dozen";
		version = "1.1";
	};
};

class Extended_PreInit_EventHandlers
{
	class dzn_Rifle_Tripod
	{
		init = "call compile preprocessFileLineNumbers '\dzn_Rifle_Tripod\settings.sqf'; call compile preprocessFileLineNumbers '\dzn_Rifle_Tripod\functions.sqf';";
	};
};
class Extended_PostInit_EventHandlers
{
	class dzn_Rifle_Tripod
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
		
		dzn_tripod_rifle_deployed_PU = 1;
		dzn_tripod_rifle_deployed_CL = 1;
		dzn_tripod_rifle_deployed_CN = 1;
		dzn_tripod_rifle_deployed_CU = 1;
		dzn_tripod_rifle_deployed_SL = 1;
		dzn_tripod_rifle_deployed_SN = 1;
	};
};

class CowsSlot;
class CfgWeapons
{
	class ItemCore;
	class InventoryUnderItem_Base_F;
	class dzn_tripod_rifle_base: ItemCore
	{
		scope=1;
		author="10Dozen";
		displayName="Rifle Tripod (Deployed)";
		model="\dzn_Rifle_Tripod\tripod_rifle.p3d";
		picture = "\dzn_Rifle_Tripod\data\ui\tripod_rifle_ca.paa";
		class ItemInfo: InventoryUnderItem_Base_F
		{
			deployedPivot = "bipod";
			hasBipod = true;
			mass = 40;
			soundBipodDeploy[] = { "A3\Sounds_F_Mark\arsenal\sfx\bipods\Bipod_generic_deploy", 0.70794576, 1, 20 };
			soundBipodFold[] = { "A3\Sounds_F_Mark\arsenal\sfx\bipods\Bipod_generic_fold", 0.70794576, 1, 20 };
			soundBipodDown[] = { "A3\Sounds_F_Mark\arsenal\sfx\bipods\Bipod_generic_down", 0.70794576, 1, 20 };
			soundBipodUp[] = { "A3\Sounds_F_Mark\arsenal\sfx\bipods\Bipod_generic_up", 0.70794576, 1, 20 };
		};
		inertia = 1.25;
	};
	
	// Usable items
	class dzn_tripod_rifle: dzn_tripod_rifle_base
	{
		scope=2;
		author="10Dozen";
		displayName="Rifle Tripod";
		picture = "\dzn_Rifle_Tripod\data\ui\tripod_rifle_ca.paa";
		model="\dzn_Rifle_Tripod\tripod_rifle.p3d";
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
	
	// For screenshots
	class dzn_tripod_rifle_deployed_PU: dzn_tripod_rifle_base
	{
		model="\dzn_Rifle_Tripod\tripod_rifle_deployed_pu.p3d";
	};
	class dzn_tripod_rifle_deployed_CL: dzn_tripod_rifle_base
	{
		model="\dzn_Rifle_Tripod\tripod_rifle_deployed_cl.p3d";
	};
	class dzn_tripod_rifle_deployed_CN: dzn_tripod_rifle_base
	{
		model="\dzn_Rifle_Tripod\tripod_rifle_deployed_cn.p3d";
	};
	class dzn_tripod_rifle_deployed_CU: dzn_tripod_rifle_base
	{
		model="\dzn_Rifle_Tripod\tripod_rifle_deployed_cu.p3d";
	};
	class dzn_tripod_rifle_deployed_SL: dzn_tripod_rifle_base
	{
		model="\dzn_Rifle_Tripod\tripod_rifle_deployed_sl.p3d";
	};
	class dzn_tripod_rifle_deployed_SN: dzn_tripod_rifle_base
	{
		model="\dzn_Rifle_Tripod\tripod_rifle_deployed_sn.p3d";
	};
};
