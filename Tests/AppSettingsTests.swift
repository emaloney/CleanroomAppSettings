//
//  AppSettingsTests.swift
//  Cleanroom Project
//
//  Created by Evan Maloney on 12/29/14.
//  Copyright © 2014 Gilt Groupe. All rights reserved.
//

import Foundation
import XCTest
import CleanroomAppSettings

class AppSettingsTests: XCTestCase
{
    func setupWriter(_ writer: AppSettingsWriter)
    {
        // for general testing
        writer.set(object: "foo:bar", named: "foobar")
        writer.set(bool: true, named: "trueValue")
        writer.set(bool: false, named: "falseValue")
        writer.set(int: 0, named: "zeroInt")
        writer.set(int: 1972, named: "year")
        writer.set(double: 9.8, named: "acceleration")
        writer.set(double: 0, named: "zeroDouble")
        writer.set(string: "there are many like it but this one is mine", named: "this is my string")
        writer.set(array: [], named: "emptyArray")
        writer.set(array: [2, 4, 6, 8, 10], named: "evenArray")
        writer.set(dictionary: [:], named: "emptyDict")
        writer.set(dictionary: ["1": "one", "2": "two", "3": "three"], named: "threeOrdinals")

        // for testing of simple type conversion
        writer.set(string: "26.2", named: "marathon")
        writer.set(object: "27", named: "twentySeven")
        writer.set(string: "0", named: "boolFalse")
        writer.set(object: "1", named: "boolTrue")
    }

    func testRemoveValue(_ writer: AppSettingsWriter, usingReader reader: AppSettingsReader)
    {
        // test removing a value
        writer.set(bool: true, named: "notRemoved")
        XCTAssertNotNil(reader.object(named: "notRemoved"))
        writer.removeSetting(named: "notRemoved")
        XCTAssertNil(reader.object(named: "notRemoved"))
    }

    func testRemoveValue(_ writer: AppSettingsWriter)
    {
        // test reading directly from the writer
        testRemoveValue(writer, usingReader: writer)
    }

    func testReading(_ reader: AppSettingsReader)
    {
        // make sure values exist
        XCTAssertNotNil(reader.object(named: "foobar"))
        XCTAssertNotNil(reader.bool(named: "trueValue"))
        XCTAssertNotNil(reader.bool(named: "falseValue"))
        XCTAssertNotNil(reader.int(named: "zeroInt"))
        XCTAssertNotNil(reader.int(named: "year"))
        XCTAssertNotNil(reader.double(named: "acceleration"))
        XCTAssertNotNil(reader.double(named: "zeroDouble"))
        XCTAssertNotNil(reader.string(named: "this is my string"))
        XCTAssertNotNil(reader.array(named: "emptyArray"))
        XCTAssertNotNil(reader.array(named: "evenArray"))
        XCTAssertNotNil(reader.dictionary(named: "emptyDict"))
        XCTAssertNotNil(reader.dictionary(named: "threeOrdinals"))

        // test values
        XCTAssertEqual(reader.object(named: "foobar") as? String, "foo:bar")
        XCTAssertEqual(reader.bool(named: "trueValue")!, true)
        XCTAssertEqual(reader.bool(named: "falseValue")!, false)
        XCTAssertEqual(reader.int(named: "zeroInt")!, 0)
        XCTAssertEqual(reader.int(named: "year")!, 1972)
        XCTAssertEqual(reader.double(named: "acceleration")!, 9.8)
        XCTAssertEqual(reader.double(named: "zeroDouble")!, 0.0)
        XCTAssertEqual(reader.string(named: "this is my string")!, "there are many like it but this one is mine")
        XCTAssertEqual(reader.array(named: "emptyArray")!, [])
        XCTAssertEqual(reader.array(named: "evenArray")!, [2, 4, 6, 8, 10])
        XCTAssertEqual(reader.dictionary(named: "emptyDict")!, [:])
        XCTAssertEqual(reader.dictionary(named: "threeOrdinals")!, ["1": "one", "2": "two", "3": "three"])

        // test expected nil returns for nonexistent keys
        XCTAssertNil(reader.object(named: "nonexistent"))
        XCTAssertNil(reader.bool(named: "nonexistent"))
        XCTAssertNil(reader.int(named: "nonexistent"))
        XCTAssertNil(reader.double(named: "nonexistent"))
        XCTAssertNil(reader.string(named: "nonexistent"))
        XCTAssertNil(reader.array(named: "nonexistent"))
        XCTAssertNil(reader.dictionary(named: "nonexistent"))

        // test default values for nonexistent keys
        XCTAssertNotNil(reader.object(named: "nonexistent", withDefault: "foo"))
        XCTAssertEqual(reader.object(named: "nonexistent", withDefault: "foo") as? String, "foo")
        XCTAssertNotNil(reader.bool(named: "nonexistent", withDefault: true))
        XCTAssertEqual(reader.bool(named: "nonexistent", withDefault: true), true)
        XCTAssertNotNil(reader.int(named: "nonexistent", withDefault: 42))
        XCTAssertEqual(reader.int(named: "nonexistent", withDefault: 42), 42)
        XCTAssertNotNil(reader.double(named: "nonexistent", withDefault: 1027.1972))
        XCTAssertEqual(reader.double(named: "nonexistent", withDefault: 1027.1972), 1027.1972)
        XCTAssertNotNil(reader.string(named: "nonexistent", withDefault: "foo/bar"))
        XCTAssertEqual(reader.string(named: "nonexistent", withDefault: "foo/bar"), "foo/bar")
        XCTAssertNotNil(reader.array(named: "nonexistent", withDefault: [1, 3, 5, 7, 9]))
        XCTAssertEqual(reader.array(named: "nonexistent", withDefault: [1, 3, 5, 7, 9]), [1, 3, 5, 7, 9])

        XCTAssertNotNil(reader.dictionary(named: "nonexistent", withDefault: ["one": 2, "free": "four"]))
        XCTAssertEqual(reader.dictionary(named: "nonexistent", withDefault: ["one": 2, "free": "four"]), ["one": 2, "free": "four"])

        // test default values for existing keys
        XCTAssertNotEqual(reader.object(named: "foobar", withDefault: "boo:far") as? String, "boo:far")
        XCTAssertNotEqual(reader.bool(named: "trueValue", withDefault: false), false)
        XCTAssertNotEqual(reader.bool(named: "falseValue", withDefault: true), true)
        XCTAssertNotEqual(reader.int(named: "zeroInt", withDefault: 1), 1)
        XCTAssertNotEqual(reader.int(named: "year", withDefault: 2014), 2014)
        XCTAssertNotEqual(reader.double(named: "acceleration", withDefault: 10.0), 10.0)
        XCTAssertNotEqual(reader.double(named: "zeroDouble", withDefault: 22.6), 22.6)
        XCTAssertNotEqual(reader.string(named: "this is my string", withDefault: "nothing"), "nothing")
        XCTAssertNotEqual(reader.array(named: "emptyArray", withDefault: [1]), [1])
        XCTAssertNotEqual(reader.array(named: "evenArray", withDefault: [2, 4, 6, 8]), [2, 4, 6, 8])
        XCTAssertNotEqual(reader.dictionary(named: "emptyDict", withDefault: ["a": "b"]), ["a": "b"])
        XCTAssertNotEqual(reader.dictionary(named: "threeOrdinals", withDefault: [4: "four"]), [4: "four"])

        // test simple type conversion
        XCTAssertEqual(reader.double(named: "marathon")!, 26.2)
        XCTAssertEqual(reader.int(named: "marathon")!, 26)
        XCTAssertEqual(reader.double(named: "twentySeven")!, 27.0)
        XCTAssertEqual(reader.int(named: "twentySeven")!, 27)
        XCTAssertEqual(reader.bool(named: "boolFalse")!, false)
        XCTAssertEqual(reader.bool(named: "boolTrue")!, true)
    }

    func testAppSettingsAPI()
    {
        // write some values
        let writer = NSMutableDictionary()
        setupWriter(writer)

        // test reading back values
        testReading(writer)

        // test removing a value
        testRemoveValue(writer)

        // test removing a value (alternate verification)
        writer.set(bool: true, named: "notRemoved2")
        XCTAssertNotNil(writer.object(forKey: "notRemoved2"))
        dump(writer.object(forKey: "notRemoved2"))
        writer.removeSetting(named: "notRemoved2")
        dump(writer.object(forKey: "notRemoved2"))
        XCTAssert(writer.object(forKey: "notRemoved2") == nil)
    }

    func testNSUserDefaultsImplementation()
    {
        // write some values
        let writer = NSMutableDictionary()
        setupWriter(writer)

        // test reading back values
        testReading(writer)

        // test removing a value
        testRemoveValue(writer)
    }
}
