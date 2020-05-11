/* ----------------------------------------------------------------------------
Function: dzn_Rifle_Tripod_fnc_affectDeployed

Description:
	Handle player anti-tilt on deployed

Parameters:
	nothing

Returns:
	nothing

Examples:
    (begin example)
		[] call dzn_Rifle_Tripod_fnc_affectDeployed;
    (end)

Author:
	10Dozen
---------------------------------------------------------------------------- */

#include "..\macro.hpp"

if (player getVariable [SVAR(tiltForced), false] && { stance player == "PRONE" }) then {
	player setVectorDirAndUp [vectorDir player, [0,0,1]];
};