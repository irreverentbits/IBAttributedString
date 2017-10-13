//
//  IBStringStyle.swift
//  IBAttributedString
//
//  Created by Lee Calloway on 9/26/17.
//  Copyright © 2017 Irreverent Bits. All rights reserved.
//

import Foundation
import UIKit

/**
`IBStringStyle` provides a method for describing string style options and their values. Paired with the
`NSMutableAttributedString` extension function for applying an array of `IBStringStyle` options, `IBStringStyle`
allows concise application of styles.
*/
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
	
	// Paragraph styles
	case paragraphLineSpacing(CGFloat)
	case paragraphSpacing(CGFloat)
	case paragraphAlignment(NSTextAlignment)
	case paragraphFirstLineHeadIndent(CGFloat)
	case paragraphHeadIndent(CGFloat)
	case paragraphTailIndent(CGFloat)
	case paragraphLineBreakMode(NSLineBreakMode)
	case paragraphMinimumLineHeight(CGFloat)
	case paragraphMaximumLineHeight(CGFloat)
	case paragraphBaseWritingDirection(NSWritingDirection)
	case paragraphLineHeightMultiple(CGFloat)
	case paragraphSpacingBefore(CGFloat)
	case paragraphHyphenationFactor(Float)
	case paragraphTabStops([NSTextTab])
	case paragraphDefaultTabInterval(CGFloat)
	case paragraphAllowsDefaultTighteningForTruncation(Bool)
	
	static func attributesDict(for styles: [IBStringStyle]) -> [NSAttributedStringKey: AnyObject] {
		var attributes = [NSAttributedStringKey: AnyObject]()
		
		for style in styles {
			switch style {
			case .font(let font):
				attributes[NSAttributedStringKey.font] = font
				
			case .color(let color):
				attributes[NSAttributedStringKey.foregroundColor] = color
				
			case .backgroundColor(let color):
				attributes[NSAttributedStringKey.backgroundColor] = color
				
			case .ligature(let hasLigature):
				attributes[NSAttributedStringKey.ligature] = NSNumber(value: hasLigature)
				
			case .kern(let kern):
				attributes[NSAttributedStringKey.kern] = NSNumber(value: kern)
				
			case .strikeThroughStyle(let weight, let pattern, let by, let color):
				attributes[NSAttributedStringKey.strikethroughStyle] = NSNumber(value: weight.rawValue | pattern.rawValue | by.rawValue)
				attributes[NSAttributedStringKey.strikethroughColor] = color
				
			case .underlineStyle(let weight, let pattern, let by, let color):
				attributes[NSAttributedStringKey.underlineStyle] = NSNumber(value: weight.rawValue | pattern.rawValue | by.rawValue)
				attributes[NSAttributedStringKey.underlineColor] = color
				
			// case .strokeColor(UIColor) // This is the same as the foreground color, so we'll ignore it
				
			case .strokeWidth(let width):
				attributes[NSAttributedStringKey.strokeWidth] = NSNumber(value: width)
				
			case .shadow(let shadow):
				attributes[NSAttributedStringKey.shadow] = shadow
				
			case .textEffect(let effect):
				attributes[NSAttributedStringKey.textEffect] = effect as NSString
				
			case .link(let url):
				attributes[NSAttributedStringKey.link] = url as NSURL
				
			case .baselineOffset(let offset):
				attributes[NSAttributedStringKey.baselineOffset] = NSNumber(value: offset)
				
			case .obliqueness(let obliqueness):
				attributes[NSAttributedStringKey.obliqueness] = NSNumber(value: obliqueness)
				
			case .expansion(let expansion):
				attributes[NSAttributedStringKey.expansion] = NSNumber(value: expansion)
				
			default: break
			}
		}
		
		return attributes
	}
}
