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
import UIKit

extension NSMutableAttributedString {
	/// Convenience function for applying string styles to the provided character range of the string.
	///
	/// - Parameters:
	///   - styles: An array of IBStringStyle enums that describe the styles to apply.
	///   - onRange: The character range within the paragraphs on which the styles should be applied.
	public func style(with styles: [IBStringStyle], onRange: NSRange? = nil) {
		let range = onRange ?? NSRange(location: 0, length: self.length)
		
		// Apply text styles
		let attributesDict = IBStringStyle.attributesDict(for: styles)
		addAttributes(attributesDict, range: range)
	}
}
