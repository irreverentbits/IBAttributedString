//
//  NSAttributedString+ParagraphStyles.swift
//  IBAttributedString
//
//  Created by Lee Calloway on 10/18/17.
//  Copyright © 2017 Irreverent Bits. All rights reserved.
//

import Foundation

extension NSMutableAttributedString {
	/**
	Provides the paragraph styles associated with paragraphs in the `NSAttributedString` or in a subrange of the `NSAttributedString`.
	- Parameter range: The subrange of the string over which paragraph styles should be returned.
	Defaults to the full range of the `NSAttributedString`.
	- Returns: An array of tuples where each tuple includes the `NSParagraphStyle` in effect over a specific `NSRange`.
	*/
	func paragraphStyles(on range: NSRange? = nil) -> [(NSParagraphStyle, NSRange)] {
		let range = range ?? nsRange
		var styles = [(NSParagraphStyle, NSRange)]()
		
		paragraphRanges(on: range).forEach {
			var style: NSParagraphStyle
			
			if let existingStyle = attribute(NSAttributedStringKey.paragraphStyle, at: $0.location, effectiveRange: nil) as? NSParagraphStyle {
				style = existingStyle
			} else {
				style = NSMutableParagraphStyle()
			}
			
			styles.append((style, $0))
		}
		
		return styles
	}
}
