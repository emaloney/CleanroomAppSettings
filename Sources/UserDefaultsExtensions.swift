//
//  UserDefaultsExtensions.swift
//  CleanroomAppSettings
//
//  Created by Evan Maloney on 6/23/15.
//  Copyright © 2015 Gilt Groupe. All rights reserved.
//

import Foundation

/**
 Extends the `UserDefaults` class to make it usable as an `AppSettingsReader`.
 */
extension UserDefaults: AppSettingsReader
{
    /**
     Returns the names of the `UserDefaults` keys for which values currently
     exist. Keys that are not strings are ignored.

     - returns: The application settings names.
     */
    public var settingNames: [String] {
        return Array(dictionaryRepresentation().keys)
    }

    /**
     Returns the value associated with the given `UserDefaults` key.

     - parameter name: The name of the setting whose value is to be retrieved.

     - returns: The value of the setting, or `nil` if no such setting exists.
     */
    public func value(named name: String)
        -> Any?
    {
        return value(forKey: name)
    }
}

/**
 Extends the `UserDefaults` class to make it usable as an `AppSettingsWriter`.
 */
extension UserDefaults: AppSettingsWriter
{
    /**
     Changes the value of the given setting to the specified object.

     - parameter value: The new value for the setting.

     - parameter name: The name of the setting whose value is to be changed.
     */
    public func set(value: Any, named name: String)
    {
        set(value, forKey: name)
    }

    /**
     Removes the existing value (if any) for the setting with the given name.

     - parameter name: The name of the setting whose value is to be removed.
     */
    public func removeValue(named name: String)
    {
        removeObject(forKey: name)
    }
}
