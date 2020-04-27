#include "macro.hpp"
call compile preprocessFileLineNumbers format ["%1\settings.sqf", PATH];

// Exit at dedicated or headless client
if (!hasInterface) exitWith {};

GVAR(TripodClasses) = [
	"dzn_tripod_rifle"
	,"dzn_tripod_rifle_tan"
	,"dzn_tripod_rifle_od"
];

// Functions
GVAR(fnc_isTripodInstalled) = {
	private _items = primaryWeaponItems player;
	private _isAttached = (true) in (_items apply { _x in GVAR(TripodClasses) });

	if !(_isAttached) exitWith { false };

	true
};

GVAR(fnc_affectDeployed) = {
	player setVectorDirAndUp [vectorDir player, [0,0,1]];
};

GVAR(fnc_handleDeployed) = {
	params ["_isDeployed"];

	private _aimCoef = GVAR(DeployedAimCoef);

	if (_isDeployed) then {
		private _ehID = addMissionEventHandler ["EachFrame", { [] call GVAR(fnc_affectDeployed) }];
		player setVariable [SVAR(AffectDeployedEH), _ehID];

		player setVariable [SVAR(aimCoef), getCustomAimCoef player];
		player setVariable [SVAR(deployTime), round(time)];

		hint "Tripod deployed";
	} else {
		removeMissionEventHandler ["EachFrame", player getVariable [SVAR(AffectDeployedEH), -1]];

		// Undeployed:
		if ( (player getVariable [SVAR(deployTime),0]) - round(time) > 60 ) then {
			// if more than 60 seconds passed - restore coefficient as defaults (player got a rest)
			_aimCoef = GVAR(DefaultAimCoef);
		} else {
			// or restore saved sway/recoil coefficients
			_aimCoef = player getVariable SVAR(recoilCoef);
		};

		// Affect sway if enabled in settings
		if (GVAR(EnableAimCoef)) then { player setCustomAimCoef _aimCoef; };

		hint "Tripod undeployed";
	};
};

GVAR(fnc_addDeployEH) = {
	if !(isNil { player getVariable SVAR(DeployedEH) }) then {
		player removeEventHandler ["WeaponDeployed", player getVariable SVAR(DeployedEH)];
	};

	player setVariable [SVAR(DeployedEH),
		player addEventHandler [
			"WeaponDeployed"
			, {
				params ["_unit", "_isDeployed"];

				if !(GVAR(Enabled)) exitWith {};
				if !(call GVAR(fnc_isTripodInstalled)) exitWith {};

				[_isDeployed] call GVAR(fnc_handleDeployed);
			}
		]
	];
};


// Init
[] spawn {
	waitUntil { time > 5 && local player && GVAR(Enabled) };
	GVAR(DefaultAimCoef) = if (getCustomAimCoef player <= 1) then { getCustomAimCoef player } else { 1 };
	[] call GVAR(fnc_addDeployEH);
};
