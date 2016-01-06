//
//  NSDictionaryExtensions.swift
//  CleanroomAppSettings
//
//  Created by Evan Maloney on 6/23/15.
//  Copyright © 2015 Gilt Groupe. All rights reserved.
//

import Foundation

/**
Extends the `NSDictionary` class to make it usable as an `AppSettingsReader`.
*/
extension NSDictionary: AppSettingsReader
{
    /**
    Returns the names of the `NSDictionary` keys for which values currently
    exist. Keys that are not strings are ignored.

    :returns:   The application settings names.
    */
    public var settingNames: [String] {
        return allKeys.filter{ $0 is String }.map{ $0 as! String }
    }

    /**
    Returns the value associated with the given `NSDictionary` key.

    :param:     name The name of the setting, or key.

    :returns:   The value, or `nil` if no value exists.
    */
    public func valueOfSetting(name: String)
        -> AnyObject?
    {
        return objectForKey(name)
    }
}

/**
Extends the `NSMutableDictionary` class to make it usable as an
`AppSettingsWriter`.
*/
extension NSMutableDictionary: AppSettingsWriter
{
    /**
    Extends the `AppSettingsReader`'s subscripting accessor to provide the
    ability to set new values.

    :param:     settingName The name of the setting.

    :param:     newValue The new value for the setting with the given name.
    */
    public func setValue(value: AnyObject, forSetting settingName: String)
    {
        setObject(value, forKey: settingName)
    }

    /**
    Removes the existing value (if any) for the setting with the given name.

    :param:     name The name of the setting whose value is to be removed.
    */
    public func removeSetting(name: String)
    {
        removeObjectForKey(name)
    }
}
