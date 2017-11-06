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

extension NSMutableAttributedString {
	/// Convenience function for applying paragraph styling to the paragraphs that fall
	/// in a given character range of the string.
	/// - Note: This function does not clear all previous styles before applying the provided styles.
	///		  New styles are added and styles pre-existing on the paragraph are only changed if a new
	///		  value for the style is provided.
	///
	/// - Parameters:
	///   - styles: An array of IBParagraphStyle enums that describe the styles to apply.
	///   - onRange: The character range within the paragraphs on which the styles should be applied.
	public func styleParagraphs(with styles: [IBParagraphStyle], onRange: NSRange? = nil) {
		let range = onRange ?? NSRange(location: 0, length: self.length)
		
		paragraphStyles(on: range).forEach { (arg) in
			let (style, range) = arg
			
			let newStyle = IBParagraphStyle.paragraphStyle(for: styles, overwriting: style)
			addAttribute(NSAttributedStringKey.paragraphStyle, value: newStyle, range: range)
		}
	}
	
	/// Convenience function for applying paragraph styling to the paragraph at the provided paragraph index in the string.
	/// - Note: This function does not clear all previous styles before applying the provided styles.
	///		  New styles are added and styles pre-existing on the paragraph are only changed if a new
	///		  value for the style is provided.
	///
	/// - Parameters:
	///   - styles: An array of IBParagraphStyle enums that describe the styles to apply to the single paragraph.
	///   - index: The paragraph index (zero based) of the paragraph to which the styling should be applied.
	public func styleParagraph(with styles: [IBParagraphStyle], at index: Int) {
		let ranges = paragraphRanges()
		
		guard ranges.count > 0, index >= 0, index < ranges.count else {
			return
		}
		
		styleParagraphs(with: styles, onRange: ranges[index])
	}
}
