/* ----------------------------------------------------------------------------
Function: dzn_Rifle_Tripod_fnc_handleDeployed

Description:
	Handles deployed EH.
	Exits if no bipod attached.
	Then applies anti-tilt and sway reduction according to current settings & weapon accessories.

Parameters:
	nothing

Returns:
	nothing

Examples:
    (begin example)
		[] call dzn_Rifle_Tripod_fnc_handleDeployed;
    (end)

Author:
	10Dozen
---------------------------------------------------------------------------- */

#include "..\macro.hpp"

params ["_isDeployed"];

if (_isDeployed) then {
	// ["RifleTripod","[HandleDeployd] Handle deployed"] call Logstr;
	player setVariable [SVAR(tiltForced), false];
	
	// --- Handle Deployed action
	([] call GVAR(fnc_hasBipod)) params ["_hasBipod","_bipodItem"];
	if (!_hasBipod) exitWith { 
		// ["RifleTripod","[HandleDeployd] No bipod, exit"] call Warnstr;
	};
	
	// ["RifleTripod","[HandleDeployd] hasBipod: %1, bipod item: %2", _hasBipod, _bipodItem] call Logstr;
	
	// --- Apply anti-tilt
	if (player getVariable [SVAR(AffectDeployedEH), -1] < 0) then {
		// ["RifleTripod","[HandleDeployd] Add PFH"] call Logstr;
		private _ehID = [{ [] call GVAR(fnc_affectDeployed) }] call CBA_fnc_addPerFrameHandler;
		player setVariable [SVAR(AffectDeployedEH), _ehID];
	};
	
	// --- Apply sway decrease for tripod
	["RifleTripod",
		"[HandleDeployd] Is aim coef enabled: %1, Is tripod?: %2"
		, GVAR(EnableAimCoef)
		,  GVAR(TripodClasses) findIf { _bipodItem == _x } > -1
	] call Logstr;
	
	if (GVAR(TripodClasses) findIf { _bipodItem == _x } > -1) then {
		player setVariable [SVAR(tiltForced), true];
		// ["RifleTripod","[HandleDeployd] Is tripod - applying auto-tilt"] call Logstr;
	
		if (GVAR(EnableAimCoef)) then {
			player setVariable [SVAR(aimCoef), getCustomAimCoef player];
			player setVariable [SVAR(deployTime), round(time)];
			// ["RifleTripod","[HandleDeployd] Aim Coefficient updated"] call Logstr;
		};
	};
	
	// ["RifleTripod","[HandleDeployd] Tilt forced is enabled?: %1", player getVariable [SVAR(tiltForced), false]] call Logstr;
} else {
	// ["RifleTripod","[HandleDeployd] Handle undeployed"] call Logstr;
	// --- Handle undeploy
	// (player getVariable [SVAR(AffectDeployedEH), -1]) call CBA_fnc_removePerFrameHandler;
	// player setVariable [SVAR(tiltForced), false];
	// // ["RifleTripod","[HandleDeployd] Remove PFH"] call Logstr;
	
	if (GVAR(EnableAimCoef) && !isNil { player getVariable SVAR(aimCoef) }) then {
		private _aimCoef = "";
		if ( (player getVariable [SVAR(deployTime),0]) - round(time) > 60 ) then {
			// if more than 60 seconds passed - restore coefficient as defaults (player got a rest)
			_aimCoef = GVAR(DefaultAimCoef);
			// ["RifleTripod","[HandleDeployd] Restore DEFAULT aim coefficient"] call Logstr;
		} else {
			// or restore saved sway/recoil coefficients
			_aimCoef = player getVariable SVAR(aimCoef);
			// ["RifleTripod","[HandleDeployd] Restore CUSTOM aim coefficient"] call Logstr;
		};

		// Affect sway if enabled in settings
		player setCustomAimCoef _aimCoef;
		// ["RifleTripod","[HandleDeployd] Aim Coefficient restored"] call Logstr;
	};
};
