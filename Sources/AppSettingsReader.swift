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

 This framework also extends `UserDefaults`, allowing it to be used as an
 `AppSettingsReader`.
 */
public protocol AppSettingsReader
{
    /**
     Returns the names of the application settings for which values currently
     exist.

     - returns: The application settings names.
     */
    var settingNames: [String] { get }

    /**
     Returns the value of the setting with the specified name.

     - parameter name: The name of the setting whose value is to be retrieved.

     - returns: The value of the setting, or `nil` if no such setting exists.
     */
    func value(named name: String) -> Any?

    /**
     Returns the value of the setting with the specified name.

     - parameter name: The name of the setting whose value is to be retrieved.

     - parameter defaultValue: A default value to use in case there is no
     existing value for the given setting.

     - returns: The value of the setting, or `defaultValue` if there is
     currently no value for the specified setting.
     */
    func value(named name: String, default defaultValue: Any) -> Any

    /**
     Returns the value of the setting with the specified name, interpreted as a
     boolean value.

     - parameter name: The name of the setting whose value is to be retrieved.

     - returns: The value of the setting. Will be `nil` if there is no value
     for the setting, or if the value couldn't be interpreted as a `Bool`.
     */
    func bool(named name: String) -> Bool?

    /**
     Returns the value of the setting with the specified name, interpreted as a
     boolean value.

     - parameter name: The name of the setting whose value is to be retrieved.

     - parameter defaultValue: A default value to use in case there is no
     existing value of the correct type for the given setting.

     - returns: The value of the setting, or `defaultValue` if there is
     currently no value for the specified setting that can be interpreted as
     a `Bool`.
     */
    func bool(named name: String, default defaultValue: Bool) -> Bool

    /**
     Returns the value of the setting with the specified name, interpreted as a
     numeric value.

     - parameter name: The name of the setting whose value is to be retrieved.

     - returns: The value of the setting. Will be `nil` if there is no value
     for the setting, or if the value couldn't be interpreted as an `NSNumber`.
     */
    func number(named name: String) -> NSNumber?

    /**
     Returns the value of the setting with the specified name, interpreted as a
     numeric value.

     - parameter name: The name of the setting whose value is to be retrieved.

     - parameter defaultValue: A default value to use in case there is no
     existing value of the correct type for the given setting.

     - returns: The value of the setting, or `defaultValue` if there is
     currently no value for the specified setting that can be interpreted as
     an `NSNumber`.
     */
    func number(named name: String, default defaultValue: NSNumber) -> NSNumber

    /**
     Returns the value of the setting with the specified name, interpreted as
     an integer value.

     - parameter name: The name of the setting whose value is to be retrieved.

     - returns: The value of the setting. Will be `nil` if there is no value
     for the setting, or if the value couldn't be interpreted as an `Int`.
     */
    func int(named name: String) -> Int?

    /**
     Returns the value of the setting with the specified name, interpreted as
     an integer value.

     - parameter name: The name of the setting whose value is to be retrieved.

     - parameter defaultValue: A default value to use in case there is no
     existing value of the correct type for the given setting.

     - returns: The value of the setting, or `defaultValue` if there is
     currently no value for the specified setting that can be interpreted as
     an `Int`.
     */
    func int(named name: String, default defaultValue: Int) -> Int

    /**
     Returns the value of the setting with the specified name, interpreted as a
     floating-point value.

     - parameter name: The name of the setting whose value is to be retrieved.

     - returns: The value of the setting. Will be `nil` if there is no value
     for the setting, or if the value couldn't be interpreted as a `Double`.
     */
    func double(named name: String) -> Double?

    /**
     Returns the value of the setting with the specified name, interpreted as a
     floating-point value.

     - parameter name: The name of the setting whose value is to be retrieved.

     - parameter defaultValue: A default value to use in case there is no
     existing value of the correct type for the given setting.

     - returns: The value of the setting, or `defaultValue` if there is
     currently no value for the specified setting that can be interpreted as
     a `Double`.
     */
    func double(named name: String, default defaultValue: Double) -> Double

    /**
     Returns the value of the setting with the specified name, interpreted as a
     string value.

     - parameter name: The name of the setting whose value is to be retrieved.

     - returns: The value of the setting. Will be `nil` if there is no value
     for the setting, or if the value couldn't be interpreted as a `String`.
     */
    func string(named name: String) -> String?

    /**
     Returns the value of the setting with the specified name, interpreted as a
     string value.

     - parameter name: The name of the setting whose value is to be retrieved.

     - parameter defaultValue: A default value to use in case there is no
     existing value of the correct type for the given setting.

     - returns: The value of the setting, or `defaultValue` if there is
     currently no value for the specified setting that can be interpreted as
     a `String`.
     */
    func string(named name: String, default defaultValue: String) -> String

    /**
     Returns the value of the setting with the specified name, interpreted as an
     array.

     - parameter name: The name of the setting whose value is to be retrieved.

     - returns: The value of the setting. Will be `nil` if there is no value
     for the setting, or if the value couldn't be interpreted as an `NSArray`.
     */
    func array(named name: String) -> NSArray?

    /**
     Returns the value of the setting with the specified name, interpreted as
     an array.

     - parameter name: The name of the setting whose value is to be retrieved.

     - parameter defaultValue: A default value to use in case there is no
     existing value of the correct type for the given setting.

     - returns: The value of the setting, or `defaultValue` if there is
     currently no value for the specified setting that can be interpreted as
     an `NSArray`.
     */
    func array(named name: String, default defaultValue: NSArray) -> NSArray

    /**
     Returns the value of the setting with the specified name, interpreted as a
     dictionary.

     - parameter name: The name of the setting whose value is to be retrieved.

     - returns: The value of the setting. Will be `nil` if there is no value
     for the setting, or if the value couldn't be interpreted as an
     `NSDictionary`.
     */
    func dictionary(named name: String) -> NSDictionary?

    /**
     Returns the value of the setting with the specified name, interpreted as
     a dictionary.

     - parameter name: The name of the setting whose value is to be retrieved.

     - parameter defaultValue: A default value to use in case there is no
     existing value of the correct type for the given setting.

     - returns: The value of the setting, or `defaultValue` if there is
     currently no value for the specified setting that can be interpreted as
     an `NSDictionary`.
     */
    func dictionary(named name: String, default defaultValue: NSDictionary) -> NSDictionary
}

public extension AppSettingsReader
{
    /**
     Returns the value of the setting with the specified name.

     - parameter name: The name of the setting whose value is to be retrieved.

     - parameter defaultValue: A default value to use in case there is no
     existing value for the given setting.

     - returns: The value of the setting, or `defaultValue` if there is
     currently no value for the specified setting.
     */
    public func value(named name: String, default defaultValue: Any)
        -> Any
    {
        return value(named: name) ?? defaultValue
    }

    /**
     Returns the value of the setting with the specified name, interpreted as a
     boolean value.

     - parameter name: The name of the setting whose value is to be retrieved.

     - returns: The value of the setting. Will be `nil` if there is no value
     for the setting, or if the value couldn't be interpreted as a `Bool`.
     */
    public func bool(named name: String)
        -> Bool?
    {
        guard let int = int(named: name) else {
            return nil
        }

        return int != 0
    }

    /**
     Returns the value of the setting with the specified name, interpreted as a
     boolean value.

     - parameter name: The name of the setting whose value is to be retrieved.

     - parameter defaultValue: A default value to use in case there is no
     existing value of the correct type for the given setting.

     - returns: The value of the setting, or `defaultValue` if there is
     currently no value for the specified setting that can be interpreted as
     a `Bool`.
     */
    public func bool(named name: String, default defaultValue: Bool)
        -> Bool
    {
        return bool(named: name) ?? defaultValue
    }

    /**
     Returns the value of the setting with the specified name, interpreted as a
     numeric value.

     - parameter name: The name of the setting whose value is to be retrieved.

     - returns: The value of the setting. Will be `nil` if there is no value
     for the setting, or if the value couldn't be interpreted as an `NSNumber`.
     */
    public func number(named name: String)
        -> NSNumber?
    {
        guard let val = value(named: name) else {
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

     - parameter name: The name of the setting whose value is to be retrieved.

     - parameter defaultValue: A default value to use in case there is no
     existing value of the correct type for the given setting.

     - returns: The value of the setting, or `defaultValue` if there is
     currently no value for the specified setting that can be interpreted as
     an `NSNumber`.
     */
    public func number(named name: String, default defaultValue: NSNumber)
        -> NSNumber
    {
        return number(named: name) ?? defaultValue
    }

    /**
     Returns the value of the setting with the specified name, interpreted as
     an integer value.

     - parameter name: The name of the setting whose value is to be retrieved.

     - returns: The value of the setting. Will be `nil` if there is no value
     for the setting, or if the value couldn't be interpreted as an `Int`.
     */
    public func int(named name: String)
        -> Int?
    {
        return number(named: name)?.intValue
    }

    /**
     Returns the value of the setting with the specified name, interpreted as
     an integer value.

     - parameter name: The name of the setting whose value is to be retrieved.

     - parameter defaultValue: A default value to use in case there is no
     existing value of the correct type for the given setting.

     - returns: The value of the setting, or `defaultValue` if there is
     currently no value for the specified setting that can be interpreted as
     an `Int`.
     */
    public func int(named name: String, default defaultValue: Int)
        -> Int
    {
        return int(named: name) ?? defaultValue
    }

    /**
     Returns the value of the setting with the specified name, interpreted as a
     floating-point value.

     - parameter name: The name of the setting whose value is to be retrieved.

     - returns: The value of the setting. Will be `nil` if there is no value
     for the setting, or if the value couldn't be interpreted as a `Double`.
     */
    public func double(named name: String)
        -> Double?
    {
        return number(named: name)?.doubleValue
    }

    /**
     Returns the value of the setting with the specified name, interpreted as a
     floating-point value.

     - parameter name: The name of the setting whose value is to be retrieved.

     - parameter defaultValue: A default value to use in case there is no
     existing value of the correct type for the given setting.

     - returns: The value of the setting, or `defaultValue` if there is
     currently no value for the specified setting that can be interpreted as 
     a `Double`.
     */
    public func double(named name: String, default defaultValue: Double)
        -> Double
    {
        return double(named: name) ?? defaultValue
    }

    /**
     Returns the value of the setting with the specified name, interpreted as a
     string value.

     - parameter name: The name of the setting whose value is to be retrieved.

     - returns: The value of the setting. Will be `nil` if there is no value
     for the setting, or if the value couldn't be interpreted as a `String`.
     */
    public func string(named name: String)
        -> String?
    {
        guard let val = value(named: name) else {
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

     - parameter name: The name of the setting whose value is to be retrieved.

     - parameter defaultValue: A default value to use in case there is no
     existing value of the correct type for the given setting.

     - returns: The value of the setting, or `defaultValue` if there is
     currently no value for the specified setting that can be interpreted as
     a `String`.
     */
    public func string(named name: String, default defaultValue: String)
        -> String
    {
        return string(named: name) ?? defaultValue
    }

    /**
     Returns the value of the setting with the specified name, interpreted as
     an array.

     - parameter name: The name of the setting whose value is to be retrieved.

     - returns: The value of the setting. Will be `nil` if there is no value
     for the setting, or if the value couldn't be interpreted as an `NSArray`.
     */
    public func array(named name: String)
        -> NSArray?
    {
        return value(named: name) as? NSArray
    }

    /**
     Returns the value of the setting with the specified name, interpreted as
     an array.

     - parameter name: The name of the setting whose value is to be retrieved.

     - parameter defaultValue: A default value to use in case there is no
     existing value of the correct type for the given setting.

     - returns: The value of the setting, or `defaultValue` if there is
     currently no value for the specified setting that can be interpreted as
     an `NSArray`.
     */
    public func array(named name: String, default defaultValue: NSArray)
        -> NSArray
    {
        return array(named: name) ?? defaultValue
    }

    /**
     Returns the value of the setting with the specified name, interpreted as a
     dictionary.

     - parameter name: The name of the setting whose value is to be retrieved.

     - returns: The value of the setting. Will be `nil` if there is no value
     for the setting, or if the value couldn't be interpreted as an
     `NSDictionary`.
     */
    public func dictionary(named name: String)
        -> NSDictionary?
    {
        return value(named: name) as? NSDictionary
    }

    /**
     Returns the value of the setting with the specified name, interpreted as
     a dictionary.

     - parameter name: The name of the setting whose value is to be retrieved.

     - parameter defaultValue: A default value to use in case there is no
     existing value of the correct type for the given setting.

     - returns: The value of the setting, or `defaultValue` if there is
     currently no value for the specified setting that can be interpreted as
     an `NSDictionary`.
     */
    public func dictionary(named name: String, default defaultValue: NSDictionary)
        -> NSDictionary
    {
        return dictionary(named: name) ?? defaultValue
    }
}

