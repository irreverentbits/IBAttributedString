//
//  NSString+IBStringStyle.swift
//  IBAttributedString
//
//  Created by Lee Calloway on 9/26/17.
//  Copyright © 2017 Irreverent Bits. All rights reserved.
//

import Foundation

extension NSString {
	/**
	An `NSRange` for the full length of the `NSString`.
	*/
	// TODO: `length` isn't really adequate for all unicode :(
	var nsRange: NSRange {
		get {
			return NSRange(location: 0, length: length)
		}
	}
	
	var trueLength: Int {
		get {
			return 0
//			self.enumerateSubstrings(in: fullRange, options: NSString.EnumerationOptions.byComposedCharacterSequences) { (substring: String?, substringRange: NSRange, enclosingRange: NSRange, stop: UnsafeMutablePointer<ObjCBool>) in
//				print("\(substring) \(NSStringFromRange(substringRange))")
//			}
		}
	}
	
	/**
	A `Range` for the full length of the `NSString`.
	*/
//	var range: Range<String.Index> {
//		get {
//			return Range(nsRange, in: self as String)!
//		}
//	}
	
	/**
	Provides the range of each paragraph in the string or in a subrange of the `NSString`.
	- parameter range: The subrange of the string over which paragraph ranges should be returned.
	Defaults to the full range of the `NSString`.
	- returns: An array of the paragraph ranges occurring within the provided subrange.
	*/
	func paragraphRanges(on range: NSRange? = nil) -> [NSRange] {
		let range = range ?? nsRange
		var ranges = [NSRange]()
		
		enumerateSubstrings(in: range, options: NSString.EnumerationOptions.byParagraphs, using: { (_, range, _, _) in
			ranges.append(range)
		})
		
		return ranges
	}
}
