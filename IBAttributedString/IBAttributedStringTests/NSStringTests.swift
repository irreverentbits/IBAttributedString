//
//  NSString+IBStringStyleTests.swift
//  IBAttributedStringTests
//
//  Created by Lee Calloway on 9/26/17.
//  Copyright © 2017 Irreverent Bits. All rights reserved.
//

import XCTest

class NSStringTests: IBAttributedStringTests {
	func testSimpleStringNSRange() {
		let nsRange = simpleNSString?.nsRange
		
		XCTAssertEqual(nsRange?.location, 0)
		XCTAssertEqual(nsRange?.length, 13)
		
		let string: NSString = "The weather on \u{0001F30D} is \u{0001F31E} today. \u{00E9}, e\u{0301}"
		let fullRange: NSRange = NSRange(location: 0, length: string.length)
		
		print("\(string)")
	
		var trueLength: Int = 0
		string.enumerateSubstrings(in: fullRange, options: NSString.EnumerationOptions.byComposedCharacterSequences) { (substring: String?, substringRange: NSRange, enclosingRange: NSRange, stop: UnsafeMutablePointer<ObjCBool>) in
			trueLength += 1
			print("\(substring ?? "") \(NSStringFromRange(substringRange))")
		}
		
		print("length: \(string.length), trueLength: \(trueLength), stringLength: \((string as String).count)")
	}
	
//	func testEmojiStringNSRange() {
//		let nsRange = emojiNSString?.nsRange
//		
//		XCTAssertEqual(nsRange?.location, 0)
//		XCTAssertEqual(nsRange?.length, 14)
//	}
}
