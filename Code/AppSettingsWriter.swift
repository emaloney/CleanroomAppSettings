//
//  AppSettingsWriter.swift
//  Cleanroom Project
//
//  Created by Evan Maloney on 12/29/14.
//  Copyright (c) 2014 Gilt Groupe. All rights reserved.
//

import Foundation

/**
This protocol extends `AppSettingsReader` by adding the ability
to store and remove values.

This framework also extends `NSUserDefaults`, allowing it to be used as an
`AppSettingsWriter`.
*/
public protocol AppSettingsWriter: AppSettingsReader
{
    /**
    Changes the value of the given setting to the specified object.

    :param: value The new value for the setting

    :param: settingName The name of the setting whose value is to be changed
    */
    func setValue(value: AnyObject, forSetting settingName: String)

    /**
    Changes the value of the given setting to the specified boolean.

    :param: value The new value for the setting

    :param: settingName The name of the setting whose value is to be changed
    */
    func setBool(value: Bool, forSetting settingName: String)

    /**
    Changes the value of the given setting to the specified integer.

    :param: value The new value for the setting

    :param: settingName The name of the setting whose value is to be changed
    */
    func setInt(value: Int, forSetting settingName: String)

    /**
    Changes the value of the given setting to the specified `Double`.

    :param: value The new value for the setting

    :param: settingName The name of the setting whose value is to be changed
    */
    func setDouble(value: Double, forSetting settingName: String)

    /**
    Changes the value of the given setting to the specified string.

    :param: value The new value for the setting

    :param: settingName The name of the setting whose value is to be changed
    */
    func setString(value: String, forSetting settingName: String)

    /**
    Changes the value of the given setting to the specified array.

    :param: value The new value for the setting

    :param: settingName The name of the setting whose value is to be changed
    */
    func setArray(value: [AnyObject], forSetting settingName: String)

    /**
    Changes the value of the given setting to the specified dictionary.

    :param: value The new value for the setting
    
    :param: settingName The name of the setting whose value is to be changed
    */
    func setDictionary(value: [NSObject : AnyObject], forSetting settingName: String)

    /**
    Removes the existing value (if any) for the setting with the given name.

    :param:     name The name of the setting whose value is to be removed.
    */
    func removeSetting(name: String)
}

extension AppSettingsWriter
{
    /**
    Changes the value of the given setting to the specified boolean.

    :param: value The new value for the setting

    :param: settingName The name of the setting whose value is to be changed
    */
    public func setBool(value: Bool, forSetting settingName: String)
    {
        setValue(NSNumber(bool: value), forSetting: settingName)
    }

    /**
    Changes the value of the given setting to the specified integer.

    :param: value The new value for the setting

    :param: settingName The name of the setting whose value is to be changed
    */
    public func setInt(value: Int, forSetting settingName: String)
    {
        setValue(NSNumber(long: value), forSetting: settingName)
    }

    /**
    Changes the value of the given setting to the specified `Double`.

    :param: value The new value for the setting

    :param: settingName The name of the setting whose value is to be changed
    */
    public func setDouble(value: Double, forSetting settingName: String)
    {
        setValue(NSNumber(double: value), forSetting: settingName)
    }

    /**
    Changes the value of the given setting to the specified string.

    :param: value The new value for the setting

    :param: settingName The name of the setting whose value is to be changed
    */
    public func setString(value: String, forSetting settingName: String)
    {
        setValue(value as NSString, forSetting: settingName)
    }

    /**
    Changes the value of the given setting to the specified array.

    :param: value The new value for the setting

    :param: settingName The name of the setting whose value is to be changed
    */
    public func setArray(value: [AnyObject], forSetting settingName: String)
    {
        setValue(value as NSArray, forSetting: settingName)
    }

    /**
    Changes the value of the given setting to the specified dictionary.

    :param: value The new value for the setting

    :param: settingName The name of the setting whose value is to be changed
    */
    public func setDictionary(value: [NSObject : AnyObject], forSetting settingName: String)
    {
        setValue(value as NSDictionary, forSetting: settingName)
    }
}

