// Copyright © 2017 Irreverent Bits. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Foundation

/// `IBParagraphStyle` provides a method for describing paragraph style options and their values. Paired with the
/// `NSMutableAttributedString` extension function for applying an array of `IBParagraphStyle` enumerations, `IBParagraphStyle`
/// allows consice application of paragraph styles.
public enum IBParagraphStyle {
	case lineSpacing(CGFloat)
	case spacing(CGFloat)
	case alignment(NSTextAlignment)
	case firstLineHeadIndent(CGFloat)
	case headIndent(CGFloat)
	case tailIndent(CGFloat)
	case lineBreakMode(NSLineBreakMode)
	case minimumLineHeight(CGFloat)
	case maximumLineHeight(CGFloat)
	case baseWritingDirection(NSWritingDirection)
	case lineHeightMultiple(CGFloat)
	case spacingBefore(CGFloat)
	case hyphenationFactor(Float)
	case tabStops([NSTextTab])
	case defaultTabInterval(CGFloat)
	case allowsDefaultTighteningForTruncation(Bool)
	
	/// Produces an NSParagraphStyle object from an array of IBParagraphStyle enums. Optionally, the styles can be applied over an existing paragraph style.
	/// - Parameters:
	///   - styles: An array of IBParagraphStyle enums that describe the styles to include in the NSParagraphStyle.
	///   - existingStyle: An optional NSParagraphStyle that will be used as the starting point for the produced NSParagraphStyle.
	/// - Returns: An NSParagraphStyle object that contains the styles specified, overwriting the `existingStyle` NSParagraphStyle if provided.
	static func paragraphStyle(for styles: [IBParagraphStyle], overwriting existingStyle: NSParagraphStyle? = nil) -> NSParagraphStyle {
		let newStyle: NSMutableParagraphStyle = (existingStyle?.mutableCopy() as? NSMutableParagraphStyle) ?? NSMutableParagraphStyle()
		
		for style in styles {
			switch style {
			case .lineSpacing(let spacing):
				newStyle.lineSpacing = spacing

			case .spacing(let spacing):
				newStyle.paragraphSpacing = spacing
			
			case .alignment(let alignment):
				newStyle.alignment = alignment
			
			case .firstLineHeadIndent(let indent):
				newStyle.firstLineHeadIndent = indent
			
			case .headIndent(let indent):
				newStyle.headIndent = indent
			
			case .tailIndent(let indent):
				newStyle.tailIndent = indent
			
			case .lineBreakMode(let mode):
				newStyle.lineBreakMode = mode
			
			case .minimumLineHeight(let height):
				newStyle.minimumLineHeight = height
			
			case .maximumLineHeight(let height):
				newStyle.maximumLineHeight = height
			
			case .baseWritingDirection(let direction):
				newStyle.baseWritingDirection = direction
			
			case .lineHeightMultiple(let multiple):
				newStyle.lineHeightMultiple = multiple
			
			case .spacingBefore(let spacing):
				newStyle.paragraphSpacingBefore = spacing
			
			case .hyphenationFactor(let factor):
				newStyle.hyphenationFactor = factor
			
			case .tabStops(let tabs):
				newStyle.tabStops = tabs
			
			case .defaultTabInterval(let interval):
				newStyle.defaultTabInterval = interval
			
			case .allowsDefaultTighteningForTruncation(let allowed):
				newStyle.allowsDefaultTighteningForTruncation = allowed
			}
		}
		
		return newStyle
	}
}
