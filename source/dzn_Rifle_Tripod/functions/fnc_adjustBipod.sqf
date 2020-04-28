/* ----------------------------------------------------------------------------
Function: dzn_Rifle_Tripod_fnc_adjustBipod

Description:
	Toggles anti-tilt

Parameters:
	nothing

Returns:
	nothing

Examples:
    (begin example)
		[] call dzn_Rifle_Tripod_fnc_adjustBipod;
    (end)

Author:
	10Dozen
---------------------------------------------------------------------------- */

#include "..\macro.hpp"

// ["RifleTripod","[adjustBipod] Called"] call Logstr;

if (player getVariable [SVAR(tiltForced), true]) exitWith {
	player setVariable [SVAR(tiltForced), false];
	// ["RifleTripod","[adjustBipod] Switch to Tilt"] call Logstr;
};

// ["RifleTripod","[adjustBipod] Auto-level?: %1", isWeaponDeployed player] call Logstr;
player setVariable [SVAR(tiltForced), isWeaponDeployed player];
