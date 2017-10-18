//
//  NSAttributedString+ParagraphRanges.swift
//  IBAttributedString
//
//  Created by Lee Calloway on 10/18/17.
//  Copyright © 2017 Irreverent Bits. All rights reserved.
//

import Foundation

extension NSMutableAttributedString {
	/**
	An `NSRange` for the full length of the `NSAttributedString`.
	*/
	var nsRange: NSRange {
		get {
			return string.nsRange
		}
	}
	
	/**
	Provides the range of each paragraph in the string or in a subrange of the `NSAttributedString`.
	- Parameter range: The subrange of the string over which paragraph ranges should be returned.
	Defaults to the full range of the `NSAttributedString`.
	- Returns: An array of the paragraph ranges occurring within the provided subrange.
	*/
	public func paragraphRanges(on range: NSRange? = nil) -> [NSRange] {
		return string.paragraphRanges(on: range)
	}
}
