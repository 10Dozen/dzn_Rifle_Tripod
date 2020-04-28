#include "macro.hpp"

// Constant list
GVAR(TripodClasses) = [
	"dzn_tripod_rifle"
	,"dzn_tripod_rifle_tan"
	,"dzn_tripod_rifle_od"
];

// Addon Settings
private _add = {
	params ["_var","_type","_val",["_exp", "No Expression"],["_subcat", ""]];	
	 
	private _arr = [
		format["dzn_%1_%2",ADDON,_var]
		, _type
		, [localize format["STR_%1_%2",ADDON,_var], localize format ["STR_%1_%2_desc",ADDON,_var]]
		, if (_subcat == "") then { TITLE } else { [TITLE, _subcat] }
		, _val
		, false
	];
	
	if !(typename _exp == "STRING" && { _exp == "No Expression" }) then { _arr pushBack _exp; };
	_arr call CBA_Settings_fnc_init;
};


// Settings 
[
	"Enabled"
	, "CHECKBOX"
	, true
] call _add;

[
	"EnableAimCoef"
	, "CHECKBOX"
	, true
] call _add;

[
	"DeployedAimCoef"
	, "SLIDER"
	, [0,1,0.1,2]
] call _add;

[
	"AllowForAllBipods"
	, "CHECKBOX"
	, false
] call _add;

[
	"AllowedBipods"
	, "EDITBOX"
	, ""
	, { GVAR(Classes) = GVAR(TripodClasses) + (call compile ("[" + toLower(_this) + "]")); }
] call _add;


// Keybinding
private _addKey = {
	params["_var","_str","_downCode",["_defaultKey", nil],["_upCode", { false }]];

	private _settings = [
		TITLE
		, FORMAT_VAR(_var)
		, LOCALIZE_FORMAT_STR(_str)
		, _downCode
		, _upCode
	];

	if (!isNil "_defaultKey") then { _settings pushBack _defaultKey; };
	_settings call CBA_fnc_addKeybind;
};

[
	"AdjustBipod"
	, "AdjustBipod"
	, { call GVAR(fnc_adjustBipod); (vehicle player == player) }
] call _addKey;
