/* this sqf file is used to manipulate the deployable array to work more like a class than an array */

/* this gets the item that makes the deployable */
getDeployableKitClass = {
    (DZE_DEPLOYABLES select _this) select 0
};

/* this gets what type of item the kit is*/
getDeployableKitType = {
    (DZE_DEPLOYABLES select _this) select 1
};

/* this gets the distance of the deployable */
getDeployableDistance = {
    (DZE_DEPLOYABLES select _this) select 2
};

/* this gets the direction offset of the deployable (basically this direction)*/
getDeployableDirectionOffset = {
    (DZE_DEPLOYABLES select _this) select 3
};

/* this gets the distance a player must be to pack the deployable back up */
getDeployablePackDistance = {
    (DZE_DEPLOYABLES select _this) select 4
};

/* should players be allowed to pack deployables at all? */
getDeployablePackAny = {
    (DZE_DEPLOYABLES select _this) select 5    
};

/* should players be allowed to pack deployables placed by others? */
getDeployablePackOthers = {
    (DZE_DEPLOYABLES select _this) select 6    
};

/* should players be allowed to pack non-deployed items found in the world? */
getDeployablePackWorld = {
    (DZE_DEPLOYABLES select _this) select 7    
};

/* this gets the class of the deployable */
getDeployableClass = {
    (DZE_DEPLOYABLES select _this) select 8
};

/* this is a wrapper function for getting the value of the scroll action */
getActionId = {
  call compile format["
    if (isNil 'DZE_ACTION_DEPLOYABLE_PACK_%1') then {
        DZE_ACTION_DEPLOYABLE_PACK_%1 = -1;
    };
    DZE_ACTION_DEPLOYABLE_PACK_%1
  ",_this];  
};

/* this is a wrapper function for setting the value of the scroll action */
setActionId = {
  call compile format["DZE_ACTION_DEPLOYABLE_PACK_%1 = %2;",_this select 0,_this select 1];  
};

/* this gets the display name of the kit or falls back to class name if unsuccessful */
getDeployableKitDisplay = {
    private["_display"];
    //diag_log text format["BIKE: trying to get display of %1",_this call getDeployableKitClass];
    _display = getText (configFile >> (_this call getDeployableKitType) >> (_this call getDeployableKitClass) >> "displayName");
    //diag_log text format["BIKE: post config lookup: display = %1",_display];
    if((isNil "_display")||_display == "") then {
        _display = (_this call getDeployableKitClass);
    };
    //diag_log text format["BIKE: post patch check: display = %1",_display];
    _display
};

/* this gets the display name of the deployable or falls back to class name if unsuccessful */
getDeployableDisplay = {
    private["_display"];
    //diag_log text format["BIKE: trying to get display of %1",_this call getDeployableClass];
    _display = getText (configFile >> "CfgVehicles" >> (_this call getDeployableClass) >> "displayName");
    //diag_log text format["BIKE: post config lookup: display = %1",_display];
    if((isNil "_display")||_display == "") then {
        _display = (_this call getDeployableClass);
    };
    //diag_log text format["BIKE: post patch check: display = %1",_display];
    _display
};