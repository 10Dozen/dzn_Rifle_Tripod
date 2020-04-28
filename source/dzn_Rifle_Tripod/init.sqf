#include "macro.hpp"

// Exit at dedicated or headless client
if (!hasInterface) exitWith {};

// For mission testing
// call compile preprocessFileLineNumbers "dzn_Rifle_Tripod\functions.sqf";
// call compile preprocessFileLineNumbers "dzn_Rifle_Tripod\settings.sqf";

GVAR(Cache) = call CBA_fnc_createNamespace;

// Init
[] spawn {
	waitUntil { time > 5 && local player && GVAR(Enabled) };

	GVAR(DefaultAimCoef) = [1, getCustomAimCoef player] select (getCustomAimCoef player <= 1);
	[] call GVAR(fnc_addDeployEH);

	// ["RifleTripod","Started"] call Logstr;
};


/*
TEST:

[ ] All Bipods Enabled: Can be untitled on button
[+] All Bipods Disabled and empty list: Can NOT be untitled on button
[+] All Bipods Disabled and bipod in list: Can be untitled on button
[+] All Bipods Disabled and not bipod in list: Can NOT be untitled on button
[+] All Bipods Disabled and empty list AND bipod in tripod: Auto-untitled and sway reduced
[+] Mod disabled: No sway reduc and no tilt on button or not
[+] Mod enabled, sway disabled AND bipod in tripod: No sway reduce and Auto-tilted on button or not





*/