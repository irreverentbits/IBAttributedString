//
//  NSAttributedString+IBParagraphStyle.swift
//  IBAttributedString
//
//  Created by Lee Calloway on 10/18/17.
//  Copyright © 2017 Irreverent Bits. All rights reserved.
//

import Foundation

extension NSMutableAttributedString {
	public func styleParagraphs(with styles: [IBParagraphStyle], onRange: NSRange? = nil) {
		let range = onRange ?? NSRange(location: 0, length: self.length)
		
		paragraphStyles(on: range).forEach { (arg) in
			let (style, range) = arg
			
			let newStyle = IBParagraphStyle.paragraphStyle(for: styles, overwriting: style)
			addAttribute(NSAttributedStringKey.paragraphStyle, value: newStyle, range: range)
		}
	}
	
	public func styleParagraph(with styles: [IBParagraphStyle], at index: Int) {
		let ranges = paragraphRanges()
		
		guard ranges.count > 0, index >= 0, index < ranges.count else {
			return
		}
		
		styleParagraphs(with: styles, onRange: ranges[index])
	}
}
