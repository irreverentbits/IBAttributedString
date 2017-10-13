//
//  NSAttributedString+IBStringStyle.swift
//  IBAttributedString
//
//  Created by Lee Calloway on 9/26/17.
//  Copyright © 2017 Irreverent Bits. All rights reserved.
//

import Foundation
import UIKit

typealias IBSS = IBStringStyle

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
	A `Range` for the full length of the `NSAttributedString`.
	*/
//	var range: Range<String.Index> {
//		get {
//			return string.range
//		}
//	}
	
	/**
	Provides the range of each paragraph in the string or in a subrange of the `NSString`.
	- parameter range: The subrange of the string over which paragraph ranges should be returned.
	Defaults to the full range of the `NSString`.
	- returns: An array of the paragraph ranges occurring within the provided subrange.
	*/
	func paragraphRanges(on range: NSRange? = nil) -> [NSRange] {
		return string.paragraphRanges(on: range)
	}
}

extension NSMutableAttributedString {
	/**
	Provides the paragraph styles associated with paragraphs in the `NSAttributedString` or in a subrange of the `NSAttributedString`.
	- parameter range: The subrange of the string over which paragraph styles should be returned.
	Defaults to the full range of the `NSAttributedString`.
	- returns: An array of tuples where each tuple includes the `NSParagraphStyle` in effect over a specific `NSRange`.
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

	open func style(with styles: [IBStringStyle], onRange: NSRange? = nil) {
		let range = onRange ?? NSRange(location: 0, length: self.length)
		
		// Apply text styles
		let attributesDict = IBStringStyle.attributesDict(for: styles)
		addAttributes(attributesDict, range: range)
		
		// Create a new paragraph style for each paragraph in the provided range
		// Keep existing paragraph styling in effect and overwrite only those paragraph attributes that have been specified
		// To pull this forEach loop out into a function, the paragraphRanges, the string itself (or the paragraph attributes derived from these),
		// and the style enum array would need to be passed as parameters.
		paragraphStyles(on: range).forEach { (arg) in
			let (paragraphStyle, range) = arg
			
			guard let newStyles = paragraphStyle.mutableCopy() as? NSMutableParagraphStyle else {
				return
			}
			
			for style in styles {
				switch style {
				case .paragraphLineSpacing(let spacing):
					newStyles.lineSpacing = spacing
					
				case .paragraphSpacing(let spacing):
					newStyles.paragraphSpacing = spacing
					
				case .paragraphAlignment(let alignment):
					newStyles.alignment = alignment
					
				case .paragraphFirstLineHeadIndent(let indent):
					newStyles.firstLineHeadIndent = indent
					
				case .paragraphHeadIndent(let indent):
					newStyles.headIndent = indent
					
				case .paragraphTailIndent(let indent):
					newStyles.tailIndent = indent
					
				case .paragraphLineBreakMode(let mode):
					newStyles.lineBreakMode = mode
					
				case .paragraphMinimumLineHeight(let height):
					newStyles.minimumLineHeight = height
					
				case .paragraphMaximumLineHeight(let height):
					newStyles.maximumLineHeight = height
					
				case .paragraphBaseWritingDirection(let direction):
					newStyles.baseWritingDirection = direction
					
				case .paragraphLineHeightMultiple(let multiple):
					newStyles.lineHeightMultiple = multiple
					
				case .paragraphSpacingBefore(let spacing):
					newStyles.paragraphSpacingBefore = spacing
					
				case .paragraphHyphenationFactor(let factor):
					newStyles.hyphenationFactor = factor
					
				case .paragraphTabStops(let tabs):
					newStyles.tabStops = tabs
					
				case .paragraphDefaultTabInterval(let interval):
					newStyles.defaultTabInterval = interval
					
				case .paragraphAllowsDefaultTighteningForTruncation(let allowed):
					newStyles.allowsDefaultTighteningForTruncation = allowed
					
				default: break
				}
			}
			
			addAttribute(NSAttributedStringKey.paragraphStyle, value: newStyles, range: range)
		}
	}
}
