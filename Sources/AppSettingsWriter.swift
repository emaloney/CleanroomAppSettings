//
//  AppSettingsWriter.swift
//  Cleanroom Project
//
//  Created by Evan Maloney on 12/29/14.
//  Copyright © 2014 Gilt Groupe. All rights reserved.
//

import Foundation

/**
 This protocol extends `AppSettingsReader` by adding the ability
 to store and remove values.

 This framework also extends `UserDefaults`, allowing it to be used as an
 `AppSettingsWriter`.
 */
public protocol AppSettingsWriter: AppSettingsReader
{
    /**
     Changes the value of the given setting to the specified object.

     - parameter value: The new value for the setting.

     - parameter name: The name of the setting whose value is to be changed.
     */
    func set(value: Any, named name: String)

    /**
     Changes the value of the given setting to the specified boolean.

     - parameter value: The new value for the setting.

     - parameter name: The name of the setting whose value is to be changed.
     */
    func set(bool value: Bool, named name: String)

    /**
     Changes the value of the given setting to the specified integer.

     - parameter value: The new value for the setting.

     - parameter name: The name of the setting whose value is to be changed.
     */
    func set(int value: Int, named name: String)

    /**
     Changes the value of the given setting to the specified `Double`.

     - parameter value: The new value for the setting.

     - parameter name: The name of the setting whose value is to be changed.
     */
    func set(double value: Double, named name: String)

    /**
     Changes the value of the given setting to the specified string.

     - parameter value: The new value for the setting.

     - parameter name: The name of the setting whose value is to be changed.
     */
    func set(string value: String, named name: String)

    /**
     Changes the value of the given setting to the specified array.

     - parameter value: The new value for the setting.

     - parameter name: The name of the setting whose value is to be changed.
     */
    func set(array value: [Any], named name: String)

    /**
     Changes the value of the given setting to the specified dictionary.

     - parameter value: The new value for the setting.

     - parameter name: The name of the setting whose value is to be changed.
     */
    func set(dictionary value: [String: Any], named name: String)

    /**
     Removes the existing value (if any) for the setting with the given name.

     - parameter name: The name of the setting whose value is to be removed.
     */
    func removeValue(named name: String)
}

extension AppSettingsWriter
{
    /**
     Changes the value of the given setting to the specified boolean.

     - parameter value: The new value for the setting.

     - parameter name: The name of the setting whose value is to be changed.
     */
    public func set(bool value: Bool, named name: String)
    {
        set(value: value, named: name)
    }

    /**
     Changes the value of the given setting to the specified integer.

     - parameter value: The new value for the setting.

     - parameter name: The name of the setting whose value is to be changed.
     */
    public func set(int value: Int, named name: String)
    {
        set(value: value, named: name)
    }

    /**
     Changes the value of the given setting to the specified `Double`.

     - parameter value: The new value for the setting.

     - parameter name: The name of the setting whose value is to be changed.
     */
    public func set(double value: Double, named name: String)
    {
        set(value: value, named: name)
    }

    /**
     Changes the value of the given setting to the specified string.

     - parameter value: The new value for the setting.

     - parameter name: The name of the setting whose value is to be changed.
     */
    public func set(string value: String, named name: String)
    {
        set(value: value, named: name)
    }

    /**
     Changes the value of the given setting to the specified array.

     - parameter value: The new value for the setting.

     - parameter name: The name of the setting whose value is to be changed.
     */
    public func set(array value: [Any], named name: String)
    {
        set(value: value, named: name)
    }

    /**
     Changes the value of the given setting to the specified dictionary.

     - parameter value: The new value for the setting.

     - parameter name: The name of the setting whose value is to be changed.
     */
    public func set(dictionary value: [String: Any], named name: String)
    {
        set(value: value, named: name)
    }
}

