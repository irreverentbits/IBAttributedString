//
//  String+IBStringStyleTests.swift
//  IBAttributedStringTests
//
//  Created by Lee Calloway on 9/26/17.
//  Copyright © 2017 Irreverent Bits. All rights reserved.
//

import XCTest

class StringTests: IBAttributedStringTests {
	func testSimpleStringNSRange() {
		let nsRange = simpleString.nsRange
		
		XCTAssertEqual(nsRange.location, 0)
		XCTAssertEqual(nsRange.length, 13)
	}
	
	func testEmojiStringNSRange() {
		let nsRange = emojiString.nsRange
		
		XCTAssertEqual(nsRange.location, 0)
		XCTAssertEqual(nsRange.length, 14)
	}
}
