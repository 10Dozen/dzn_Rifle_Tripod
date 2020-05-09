#include "macro.hpp"

// Exit at dedicated or headless client
if (!hasInterface) exitWith {};

// For mission testing
// call compile preprocessFileLineNumbers "dzn_Rifle_Tripod\functions.sqf";
// call compile preprocessFileLineNumbers "dzn_Rifle_Tripod\settings.sqf";

GVAR(Cache) = call CBA_fnc_createNamespace;

// Init
[
	{ local player && GVAR(Enabled) },
	{
		GVAR(DefaultAimCoef) = [1, getCustomAimCoef player] select (getCustomAimCoef player <= 1);
		[] call GVAR(fnc_addDeployEH);
		// ["RifleTripod","Started"] call Logstr;
	}
] call CBA_fnc_waitUntilAndExecute;
