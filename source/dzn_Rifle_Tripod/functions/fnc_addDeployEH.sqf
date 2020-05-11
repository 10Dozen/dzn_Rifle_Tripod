/* ----------------------------------------------------------------------------
Function: dzn_Rifle_Tripod_fnc_addDeployEH

Description:
	Adds deployed EH

Parameters:
	nothing

Returns:
	nothing

Examples:
    (begin example)
		[] call dzn_Rifle_Tripod_fnc_addDeployEH;
    (end)

Author:
	10Dozen
---------------------------------------------------------------------------- */

#include "..\macro.hpp"

private _id = player getVariable [SVAR(DeployedEH), -1];
if (_id < 0) then {
	player removeEventHandler ["WeaponDeployed", _id];
};

player setVariable [SVAR(DeployedEH),
	player addEventHandler [
		"WeaponDeployed"
		, {
			params ["_unit", "_isDeployed"];
			if !(GVAR(Enabled)) exitWith {
				// ["RifleTripod","[WeaponDeploy] Exit on mod disabled"] call Warnstr;
			};
			
			// ["RifleTripod","[WeaponDeploy] Handle deployed event"] call Logstr;
			[_isDeployed] call GVAR(fnc_handleDeployed);
		}
	]
];

// ["RifleTripod","[DeployedEH] added"] call Logstr;
