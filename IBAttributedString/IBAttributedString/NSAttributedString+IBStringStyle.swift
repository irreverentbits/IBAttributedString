//
//  NSAttributedString+IBStringStyle.swift
//  IBAttributedString
//
//  Created by Lee Calloway on 9/26/17.
//  Copyright © 2017 Irreverent Bits. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
	public func style(with styles: [IBStringStyle], onRange: NSRange? = nil) {
		let range = onRange ?? NSRange(location: 0, length: self.length)
		
		// Apply text styles
		let attributesDict = IBStringStyle.attributesDict(for: styles)
		addAttributes(attributesDict, range: range)
	}
}
