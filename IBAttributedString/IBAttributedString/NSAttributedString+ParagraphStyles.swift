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
