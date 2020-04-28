/* ----------------------------------------------------------------------------
Function: dzn_Rifle_Tripod_fnc_hasBipod

Description:
	Checks current weapon to have bipod attach or in-built bipod that is in allowed list.

Parameters:
	nothing

Returns:
	_hasBipod -- flag that weapon has bipod and it is in the allowed list <BOOL>
	_bipodItem -- classname of the bipod item (or weapon for in-built bipod); "" if none <STRING>

Examples:
	(begin example)
		_bipodInfo = [] call dzn_Rifle_Tripod_fnc_hasBipod;
	(end)

Author:
	10Dozen
---------------------------------------------------------------------------- */

#include "..\macro.hpp"

private _wpn = toLower primaryWeapon player;
if (currentWeapon player != _wpn) exitWith { [false, ""] };

private _hasBipod = false;
private _bipodItem = toLower (primaryWeaponItems player # 3);
private _configPath = (configFile >> "CfgWeapons" >> _bipodItem >> "ItemInfo" >> "hasBipod");

if (_bipodItem == "") then {
	_bipodItem = _wpn;
	_configPath = (configFile >> "CfgWeapons" >> _bipodItem >> "hasBipod");
	// ["RifleTripod","[hasBipod] No attach item, using weapon's bipod"] call Warnstr;
};

private _cachedInfo = GVAR(Cache) getVariable _bipodItem;
if (isNil "_cachedInfo") then {
	_hasBipod = getNumber _configPath == 1;
	GVAR(Cache) setVariable [_bipodItem, _hasBipod];
	// ["RifleTripod","[hasBipod] Read from config and cache"] call Logstr;
} else {
	_hasBipod = _cachedInfo;
	// ["RifleTripod","[hasBipod] Get forom cache"] call Logstr;
};

if (!_hasBipod) exitWith {
	// ["RifleTripod","[hasBipod] No bipod, exits..."] call Warnstr;
	[false, ""]
};

if (!GVAR(AllowForAllBipods)) then {
	_hasBipod = GVAR(Classes) findIf { _bipodItem == _x } > -1;
};

// ["RifleTripod","[hasBipod] Output: %1, %2", _hasBipod, _bipodItem] call Logstr;

[_hasBipod, _bipodItem]
