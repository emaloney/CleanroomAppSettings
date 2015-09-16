//
//  NSUserDefaultsExtensions.swift
//  CleanroomAppSettings
//
//  Created by Evan Maloney on 6/23/15.
//  Copyright © 2015 Gilt Groupe. All rights reserved.
//

import Foundation

/**
Extends the `NSUserDefaults` class to make it usable as an `AppSettingsReader`.
*/
extension NSUserDefaults: AppSettingsReader
{
    /**
    Returns the names of the `NSUserDefaults` keys for which values currently
    exist.

    :returns:   The application settings names.
    */
    public var settingNames: [String] {
        return Array(dictionaryRepresentation().keys)
    }

    /**
    Returns the value associated with the given `NSUserDefaults` key.

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
Extends the `NSUserDefaults` class to make it usable as an `AppSettingsWriter`.
*/
extension NSUserDefaults: AppSettingsWriter
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
