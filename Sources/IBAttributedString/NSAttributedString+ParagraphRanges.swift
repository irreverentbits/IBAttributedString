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
	/// An `NSRange` for the full length of the `NSAttributedString`.
	var nsRange: NSRange {
		get {
			return string.nsRange
		}
	}
	
	/// Provides the range of each paragraph in the string or in a subrange of the `NSAttributedString`.
	///
	/// - Parameter range: The subrange of the string over which paragraph ranges should be returned.
	/// 				   Defaults to the full range of the `NSAttributedString`.
	/// - Returns: An array of the paragraph ranges occurring within the provided subrange.
	public func paragraphRanges(on range: NSRange? = nil) -> [NSRange] {
		return string.paragraphRanges(on: range)
	}
}
