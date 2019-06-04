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

/// `IBStringStyle` provides a method for describing string style options and their values. Paired with the
/// `NSMutableAttributedString` extension function for applying an array of `IBStringStyle` enumerations, `IBStringStyle`
/// allows concise application of string styles.
public enum IBStringStyle {
	// Character styles
	case font(UIFont)
	case color(UIColor)
	case backgroundColor(UIColor)
	case ligature(Bool)
	case kern(Float)
	case strikeThroughStyle(IBUnderlineWeight, IBUnderlinePattern, IBUnderlineBy, UIColor)
	case underlineStyle(IBUnderlineWeight, IBUnderlinePattern, IBUnderlineBy, UIColor)
	case strokeWidth(Float)
	case shadow(NSShadow)
	case textEffect(String)
	case link(URL)
	case baselineOffset(Float)
	
	/// Skew to be applied to glyphs. The default value is 0, indicating no skew.
	case obliqueness(Float)
	case expansion(Float)
	//    case strokeColor(UIColor) 	// This is the same as the foreground color, so we'll ignore it
	//    case writingDirection() 	// This is complicated. Needs more investigation.
	//    case verticalGlyphForm() 	// Currently ignored on iOS. Only horizontal glyphs are supported.
	
	/// Produces an `NSAttributedString` style dictionary from an array of `IBParagraphStyle` enums.
	/// - Parameter styles: An array of `IBStringStyle` enums that describe the styles to include in the style dictionary.
	/// - Returns: A dictionary of `NSAttributedString` style keys and values.
	static func attributesDict(for styles: [IBStringStyle]) -> [NSAttributedString.Key: AnyObject] {
		var attributes = [NSAttributedString.Key: AnyObject]()
		
		for style in styles {
			switch style {
			case .font(let font):
				attributes[NSAttributedString.Key.font] = font
				
			case .color(let color):
				attributes[NSAttributedString.Key.foregroundColor] = color
				
			case .backgroundColor(let color):
				attributes[NSAttributedString.Key.backgroundColor] = color
				
			case .ligature(let hasLigature):
				attributes[NSAttributedString.Key.ligature] = NSNumber(value: hasLigature)
				
			case .kern(let kern):
				attributes[NSAttributedString.Key.kern] = NSNumber(value: kern)
				
			case .strikeThroughStyle(let weight, let pattern, let by, let color):
				attributes[NSAttributedString.Key.strikethroughStyle] = NSNumber(value: weight.rawValue | pattern.rawValue | by.rawValue)
				attributes[NSAttributedString.Key.strikethroughColor] = color
				
			case .underlineStyle(let weight, let pattern, let by, let color):
				attributes[NSAttributedString.Key.underlineStyle] = NSNumber(value: weight.rawValue | pattern.rawValue | by.rawValue)
				attributes[NSAttributedString.Key.underlineColor] = color
				
			// case .strokeColor(UIColor) // This is the same as the foreground color, so we'll ignore it
				
			case .strokeWidth(let width):
				attributes[NSAttributedString.Key.strokeWidth] = NSNumber(value: width)
				
			case .shadow(let shadow):
				attributes[NSAttributedString.Key.shadow] = shadow
				
			case .textEffect(let effect):
				attributes[NSAttributedString.Key.textEffect] = effect as NSString
				
			case .link(let url):
				attributes[NSAttributedString.Key.link] = url as NSURL
				
			case .baselineOffset(let offset):
				attributes[NSAttributedString.Key.baselineOffset] = NSNumber(value: offset)
				
			case .obliqueness(let obliqueness):
				attributes[NSAttributedString.Key.obliqueness] = NSNumber(value: obliqueness)
				
			case .expansion(let expansion):
				attributes[NSAttributedString.Key.expansion] = NSNumber(value: expansion)
			}
		}
		
		return attributes
	}
}
