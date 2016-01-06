//
//  AppSettingsReader.swift
//  Cleanroom Project
//
//  Created by Evan Maloney on 12/29/14.
//  Copyright © 2014 Gilt Groupe. All rights reserved.
//

import Foundation

/**
Entities conforming to this protocol are capable of providing values for
*application settings*.

Application settings are global values available to the application at runtime.
Settings values should persist across application launches, and should be
available locally on the device running the application.

Storage for application settings is typically provided by the operating system
and may be transparently synchronized across multiple devices depending on the
underlying implementation.

This framework also extends `NSUserDefaults`, allowing it to be used as an
`AppSettingsReader`.
*/
public protocol AppSettingsReader
{
    /**
    Returns the names of the application settings for which values currently
    exist.

    :returns:   The application settings names.
    */
    var settingNames: [String] { get }

    /**
    Returns the value of the setting with the specified name.

    :param:     name The setting name

    :returns:   The value of the setting, or `nil` if no such setting exists.
    */
    func valueOfSetting(name: String)
        -> AnyObject?

    /**
    Returns the value of the setting with the specified name.

    :param:     name The setting name

    :param:     defaultValue A default value to use in case there is no existing
                value for the given setting.

    :returns:   The value of the setting, or `defaultValue` if there is
                currently no value for the specified setting.
    */
    func valueOfSetting(name: String, withDefault defaultValue: AnyObject)
        -> AnyObject

    /**
    Returns the value of the setting with the specified name, interpreted as a
    boolean value.

    :param:     name The setting name

    :returns:   The value of the setting. Will be `nil` if there is no value for
                the setting, or if the value couldn't be interpreted as a
                `Bool`.
    */
    func boolValueOfSetting(name: String)
        -> Bool?

    /**
    Returns the value of the setting with the specified name, interpreted as a
    boolean value.

    :param:     name The setting name

    :param:     defaultValue A default value to use in case there is no existing
                value of the correct type for the given setting.

    :returns:   The value of the setting, or `defaultValue` if there is
                currently no value for the specified setting that can be
                interpreted as a `Bool`.
    */
    func boolValueOfSetting(name: String, withDefault defaultValue: Bool)
        -> Bool

    /**
    Returns the value of the setting with the specified name, interpreted as a
    numeric value.

    :param:     name The setting name

    :returns:   The value of the setting. Will be `nil` if there is no value for
                the setting, or if the value couldn't be interpreted as an
                `NSNumber`.
    */
    func numericValueOfSetting(name: String)
        -> NSNumber?

    /**
    Returns the value of the setting with the specified name, interpreted as a
    numeric value.

    :param: name The setting name

    :param:     defaultValue A default value to use in case there is no existing
                value of the correct type for the given setting.

    :returns:   The value of the setting, or `defaultValue` if there is
                currently no value for the specified setting that can be
                interpreted as an `NSNumber`.
    */
    func numericValueOfSetting(name: String, withDefault defaultValue: NSNumber)
        -> NSNumber

    /**
    Returns the value of the setting with the specified name, interpreted as an
    integer value.

    :param:     name The setting name

    :returns:   The value of the setting. Will be `nil` if there is no value for
                the setting, or if the value couldn't be interpreted as an
                `Int`.
    */
    func intValueOfSetting(name: String)
        -> Int?

    /**
    Returns the value of the setting with the specified name, interpreted as an
    integer value.

    :param:     name The setting name

    :param:     defaultValue A default value to use in case there is no existing
                value of the correct type for the given setting.

    :returns:   The value of the setting, or `defaultValue` if there is
                currently no value for the specified setting that can be
                interpreted as an `Int`.
    */
    func intValueOfSetting(name: String, withDefault defaultValue: Int)
        -> Int

    /**
    Returns the value of the setting with the specified name, interpreted as a
    floating-point value.

    :param:     name The setting name

    :returns:   The value of the setting. Will be `nil` if there is no value for
                the setting, or if the value couldn't be interpreted as a
                `Double`.
    */
    func doubleValueOfSetting(name: String)
        -> Double?

    /**
    Returns the value of the setting with the specified name, interpreted as a
    floating-point value.

    :param:     name The setting name

    :param:     defaultValue A default value to use in case there is no existing
                value of the correct type for the given setting.

    :returns:   The value of the setting, or `defaultValue` if there is
                currently no value for the specified setting that can be
                interpreted as a `Double`.
    */
    func doubleValueOfSetting(name: String, withDefault defaultValue: Double)
        -> Double

    /**
    Returns the value of the setting with the specified name, interpreted as a
    string value.

    :param:     name The setting name

    :returns:   The value of the setting. Will be `nil` if there is no value for
                the setting, or if the value couldn't be interpreted as a
                `String`.
    */
    func stringValueOfSetting(name: String)
        -> String?

    /**
    Returns the value of the setting with the specified name, interpreted as a
    string value.

    :param:     name The setting name

    :param:     defaultValue A default value to use in case there is no existing
                value of the correct type for the given setting.

    :returns:   The value of the setting, or `defaultValue` if there is
                currently no value for the specified setting that can be
                interpreted as a `String`.
    */
    func stringValueOfSetting(name: String, withDefault defaultValue: String)
        -> String

    /**
    Returns the value of the setting with the specified name, interpreted as an
    array.

    :param:     name The setting name

    :returns:   The value of the setting. Will be `nil` if there is no value for
                the setting, or if the value couldn't be interpreted as an
                `NSArray`.
    */
    func arrayValueOfSetting(name: String)
        -> NSArray?

    /**
    Returns the value of the setting with the specified name, interpreted as an
    array.

    :param:     name The setting name

    :param:     defaultValue A default value to use in case there is no existing
                value of the correct type for the given setting.

    :returns:   The value of the setting, or `defaultValue` if there is
                currently no value for the specified setting that can be
                interpreted as an `NSArray`.
    */
    func arrayValueOfSetting(name: String, withDefault defaultValue: NSArray)
        -> NSArray

    /**
    Returns the value of the setting with the specified name, interpreted as a
    dictionary.

    :param:     name The setting name

    :returns:   The value of the setting. Will be `nil` if there is no value for
                the setting, or if the value couldn't be interpreted as an
                `NSDictionary`.
    */
    func dictionaryValueOfSetting(name: String)
        -> NSDictionary?

    /**
    Returns the value of the setting with the specified name, interpreted as
    a dictionary.

    :param:     name The setting name

    :param:     defaultValue A default value to use in case there is no existing
                value of the correct type for the given setting.

    :returns:   The value of the setting, or `defaultValue` if there is
                currently no value for the specified setting that can be
                interpreted as an `NSDictionary`.
    */
    func dictionaryValueOfSetting(name: String, withDefault defaultValue: NSDictionary)
        -> NSDictionary
}

extension AppSettingsReader
{
    /**
    Returns the value of the setting with the specified name.

    :param:     name The setting name

    :param:     defaultValue A default value to use in case there is no existing
                value for the given setting.

    :returns:   The value of the setting, or `defaultValue` if there is
                currently no value for the specified setting.
    */
    public func valueOfSetting(name: String, withDefault defaultValue: AnyObject)
        -> AnyObject
    {
        guard let obj = valueOfSetting(name) else {
            return defaultValue
        }

        return obj
    }

    /**
    Returns the value of the setting with the specified name, interpreted as a
    boolean value.

    :param:     name The setting name

    :returns:   The value of the setting. Will be `nil` if there is no value for
                the setting, or if the value couldn't be interpreted as a
                `Bool`.
    */
    public func boolValueOfSetting(name: String)
        -> Bool?
    {
        guard let int = intValueOfSetting(name) else {
            return nil
        }

        return int != 0
    }

    /**
    Returns the value of the setting with the specified name, interpreted as a
    boolean value.

    :param:     name The setting name

    :param:     defaultValue A default value to use in case there is no existing
                value of the correct type for the given setting.

    :returns:   The value of the setting, or `defaultValue` if there is
                currently no value for the specified setting that can be
                interpreted as a `Bool`.
    */
    public func boolValueOfSetting(name: String, withDefault defaultValue: Bool)
        -> Bool
    {
        guard let val = boolValueOfSetting(name) else {
            return defaultValue
        }

        return val
    }

    /**
    Returns the value of the setting with the specified name, interpreted as a
    numeric value.

    :param:     name The setting name

    :returns:   The value of the setting. Will be `nil` if there is no value for
                the setting, or if the value couldn't be interpreted as an
                `NSNumber`.
    */
    public func numericValueOfSetting(name: String)
        -> NSNumber?
    {
        guard let val = valueOfSetting(name) else {
            return nil
        }

        if let num = val as? NSNumber {
            return num
        }
        else if let str = val as? String {
            return NSDecimalNumber(string: str)
        }
        return nil
    }

    /**
    Returns the value of the setting with the specified name, interpreted as a
    numeric value.

    :param:     name The setting name

    :param:     defaultValue A default value to use in case there is no existing
                value of the correct type for the given setting.

    :returns:   The value of the setting, or `defaultValue` if there is
                currently no value for the specified setting that can be
                interpreted as an `NSNumber`.
    */
    public func numericValueOfSetting(name: String, withDefault defaultValue: NSNumber)
        -> NSNumber
    {
        guard let val = numericValueOfSetting(name) else {
            return defaultValue
        }

        return val
    }

    /**
    Returns the value of the setting with the specified name, interpreted as an
    integer value.

    :param:     name The setting name

    :returns:   The value of the setting. Will be `nil` if there is no value for
                the setting, or if the value couldn't be interpreted as an
                `Int`.
    */
    public func intValueOfSetting(name: String)
        -> Int?
    {
        guard let val = numericValueOfSetting(name) else {
            return nil
        }

        return val.integerValue
    }

    /**
    Returns the value of the setting with the specified name, interpreted as an
    integer value.

    :param:     name The setting name

    :param:     defaultValue A default value to use in case there is no existing
                value of the correct type for the given setting.

    :returns:   The value of the setting, or `defaultValue` if there is
                currently no value for the specified setting that can be
                interpreted as an `Int`.
    */
    public func intValueOfSetting(name: String, withDefault defaultValue: Int)
        -> Int
    {
        guard let val = intValueOfSetting(name) else {
            return defaultValue
        }

        return val
    }

    /**
    Returns the value of the setting with the specified name, interpreted as a
    floating-point value.

    :param:     name The setting name

    :returns:   The value of the setting. Will be `nil` if there is no value for
                the setting, or if the value couldn't be interpreted as a
                `Double`.
    */
    public func doubleValueOfSetting(name: String)
        -> Double?
    {
        guard let val = numericValueOfSetting(name) else {
            return nil
        }

        return val.doubleValue
    }

    /**
    Returns the value of the setting with the specified name, interpreted as a
    floating-point value.

    :param:     name The setting name

    :param:     defaultValue A default value to use in case there is no existing
                value of the correct type for the given setting.

    :returns:   The value of the setting, or `defaultValue` if there is
                currently no value for the specified setting that can be
                interpreted as a `Double`.
    */
    public func doubleValueOfSetting(name: String, withDefault defaultValue: Double)
        -> Double
    {
        guard let val = doubleValueOfSetting(name) else {
            return defaultValue
        }

        return val
    }

    /**
    Returns the value of the setting with the specified name, interpreted as a
    string value.

    :param:     name The setting name

    :returns:   The value of the setting. Will be `nil` if there is no value for
                the setting, or if the value couldn't be interpreted as a
                `String`.
    */
    public func stringValueOfSetting(name: String)
        -> String?
    {
        guard let val = valueOfSetting(name) else {
            return nil
        }

        if let str = val as? String {
            return str
        }
        else if let describe = val as? CustomStringConvertible {
            return describe.description
        }
        return nil
    }

    /**
    Returns the value of the setting with the specified name, interpreted as a
    string value.

    :param:     name The setting name

    :param:     defaultValue A default value to use in case there is no existing
                value of the correct type for the given setting.

    :returns:   The value of the setting, or `defaultValue` if there is
                currently no value for the specified setting that can be
                interpreted as a `String`.
    */
    public func stringValueOfSetting(name: String, withDefault defaultValue: String)
        -> String
    {
        guard let val = stringValueOfSetting(name) else {
            return defaultValue
        }

        return val
    }

    /**
    Returns the value of the setting with the specified name, interpreted as an
    array.

    :param:     name The setting name

    :returns:   The value of the setting. Will be `nil` if there is no value for
                the setting, or if the value couldn't be interpreted as an
                `NSArray`.
    */
    public func arrayValueOfSetting(name: String)
        -> NSArray?
    {
        guard let val = valueOfSetting(name) as? NSArray else {
            return nil
        }

        return val
    }

    /**
    Returns the value of the setting with the specified name, interpreted as an
    array.

    :param:     name The setting name

    :param:     defaultValue A default value to use in case there is no existing
                value of the correct type for the given setting.

    :returns:   The value of the setting, or `defaultValue` if there is
                currently no value for the specified setting that can be
                interpreted as an `NSArray`.
    */
    public func arrayValueOfSetting(name: String, withDefault defaultValue: NSArray)
        -> NSArray
    {
        guard let val = arrayValueOfSetting(name) else {
            return defaultValue
        }

        return val
    }

    /**
    Returns the value of the setting with the specified name, interpreted as a
    dictionary.

    :param:     name The setting name

    :returns:   The value of the setting. Will be `nil` if there is no value for
                the setting, or if the value couldn't be interpreted as an
                `NSDictionary`.
    */
    public func dictionaryValueOfSetting(name: String)
        -> NSDictionary?
    {
        guard let val = valueOfSetting(name) as? NSDictionary else {
            return nil
        }

        return val
    }

    /**
    Returns the value of the setting with the specified name, interpreted as
    a dictionary.

    :param:     name The setting name

    :param:     defaultValue A default value to use in case there is no existing
                value of the correct type for the given setting.

    :returns:   The value of the setting, or `defaultValue` if there is
                currently no value for the specified setting that can be
                interpreted as an `NSDictionary`.
    */
    public func dictionaryValueOfSetting(name: String, withDefault defaultValue: NSDictionary)
        -> NSDictionary
    {
        guard let val = dictionaryValueOfSetting(name) else {
            return defaultValue
        }

        return val
    }
}

