//
//  String+IBStringStyle.swift
//  IBAttributedString
//
//  Created by Lee Calloway on 9/26/17.
//  Copyright © 2017 Irreverent Bits. All rights reserved.
//

import Foundation

extension String {
	/**
	An `NSRange` for the full length of the `String`.
	*/
	var nsRange: NSRange {
		get {
			return NSRange(location: 0, length: count)
		}
	}
		
	/**
	Provides the range of each paragraph in the string or in a subrange of the `NSString`.
	- parameter range: The subrange of the string over which paragraph ranges should be returned.
	Defaults to the full range of the `NSString`.
	- returns: An array of the paragraph ranges occurring within the provided subrange.
	*/
	public func paragraphRanges(on range: NSRange? = nil) -> [NSRange] {
		return (self as NSString).paragraphRanges(on: range)
	}
}
