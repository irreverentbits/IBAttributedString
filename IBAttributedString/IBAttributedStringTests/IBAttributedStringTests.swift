//
//  IBAttributedStringTests.swift
//  IBAttributedStringTests
//
//  Created by Lee Calloway on 9/24/17.
//  Copyright © 2017 Irreverent Bits. All rights reserved.
//

import XCTest
@testable import IBAttributedString

class IBAttributedStringTests: XCTestCase {
	let simpleString = "Simple string"
	let emojiString = "Tears of joy 😂"
	private(set) var simpleNSString: NSString? = nil
	private(set) var emojiNSString: NSString? = nil
	
    override func setUp() {
        super.setUp()

		simpleNSString = NSString(string: simpleString)
		emojiNSString = NSString(string: emojiString)
	}
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
