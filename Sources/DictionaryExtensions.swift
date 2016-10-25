//
//  DictionaryExtensions.swift
//  CleanroomAppSettings
//
//  Created by Evan Maloney on 6/23/15.
//  Copyright © 2015 Gilt Groupe. All rights reserved.
//

import Foundation

/**
 Extends `Dictionary` to make it usable as an `AppSettingsReader`.
 */
extension Dictionary: AppSettingsReader
{
    /**
     Returns the names of the `NSDictionary` keys for which values currently
     exist. Keys that are not strings are ignored.

     - returns: The application settings names.
     */
    public var settingNames: [String] {
        return keys.flatMap{ $0 as? String }
    }

    /**
     Returns the value associated with the given `NSDictionary` key.

     - parameter name: The name of the setting whose value is to be retrieved.

     - returns: The value of the setting, or `nil` if no such setting exists.
     */
    public func value(named name: String)
        -> Any?
    {
        guard let key = name as? Dictionary.Key else { return nil }

        return self[key]
    }
}

/**
 Extends `Dictionary` to make it usable as an `AppSettingsWriter`.
 */
extension Dictionary: AppSettingsWriter
{
    /**
     Changes the value of the given setting to the specified object.

     - parameter value: The new value for the setting.

     - parameter name: The name of the setting whose value is to be changed.
     */
    public mutating func set(value: Any, named name: String)
    {
        guard let key = name as? Dictionary.Key,
            let typedVal = value as? Dictionary.Value
        else {
            return
        }

        self[key] = typedVal
    }

    /**
     Removes the existing value (if any) for the setting with the given name.

     - parameter name: The name of the setting whose value is to be removed.
     */
    public mutating func removeValue(named name: String)
    {
        guard let key = name as? Dictionary.Key else { return }

        removeValue(forKey: key)
    }
}
