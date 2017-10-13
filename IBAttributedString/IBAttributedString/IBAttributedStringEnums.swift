//
//  IBAttributedStringEnums.swift
//  IBAttributedString
//
//  Created by Lee Calloway on 9/26/17.
//  Copyright © 2017 Irreverent Bits. All rights reserved.
//

import Foundation

/**
Underline weight style. Maps to Apple's `NSUnderlineStyle` enum for those values that describe the number or weight of underlines.
*/
public enum IBUnderlineWeight: Int {
	case none = 0 			// NSUnderlineStyle.styleNone.rawValue
	case single = 1 		// NSUnderlineStyle.styleSingle.rawValue
	case double = 9 		// NSUnderlineStyle.styleDouble.rawValue
	case thick = 2 			// NSUnderlineStyle.styleThick.rawValue
}

/**
Underline pattern style. Maps to Apple's `NSUnderlineStyle` enum for those values that describe an underline pattern.
*/
public enum IBUnderlinePattern: Int {
	case solid = 0
	case dot = 256			// NSUnderlineStyle.styleDot.rawValue
	case dash = 512 		// NSUnderlineStyle.styleDash.rawValue
	case dashDot = 768 		// NSUnderlineStyle.styleDashDot.rawValue
	case dashDotDot = 1024	// NSUnderlineStyle.styleDashDotDot.rawValue
}

/**
Underline grouping style. Maps to Apple's `NSUnderlineStyle` enum for either `complete` underlining or `byWord`.
*/
public enum IBUnderlineBy: Int {
	case complete = 0
	case byWord = 32768		// NSUnderlineStyle.byWord.rawValue
}
