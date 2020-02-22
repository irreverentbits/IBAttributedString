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

/// Underline weight style. Maps to Apple's `NSUnderlineStyle` enum for those values that describe the number or weight of underlines.
public enum IBUnderlineWeight: Int {
	case none = 0 			// NSUnderlineStyle.styleNone.rawValue
	case single = 1 		// NSUnderlineStyle.styleSingle.rawValue
	case double = 9 		// NSUnderlineStyle.styleDouble.rawValue
	case thick = 2 			// NSUnderlineStyle.styleThick.rawValue
}

/// Underline pattern style. Maps to Apple's `NSUnderlineStyle` enum for those values that describe an underline pattern.
public enum IBUnderlinePattern: Int {
	case solid = 0
	case dot = 256			// NSUnderlineStyle.styleDot.rawValue
	case dash = 512 		// NSUnderlineStyle.styleDash.rawValue
	case dashDot = 768 		// NSUnderlineStyle.styleDashDot.rawValue
	case dashDotDot = 1024	// NSUnderlineStyle.styleDashDotDot.rawValue
}

/// Underline grouping style. Maps to Apple's `NSUnderlineStyle` enum for either `complete` underlining or `byWord`.
public enum IBUnderlineBy: Int {
	case complete = 0
	case byWord = 32768		// NSUnderlineStyle.byWord.rawValue
}
