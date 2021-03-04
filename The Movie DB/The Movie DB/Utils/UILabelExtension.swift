//
//  UILabelExtension.swift
//  The Movie DB
//
//  Created by Blazej Krupa on 3/4/21.
//

import UIKit

extension UILabel {
    
    convenience init(text: String? = nil,
                     withFontType fontType: HelveticaNeue,
                     size: CGFloat,
                     textColor: UIColor,
                     alignment: NSTextAlignment? = nil,
                     lineBreakMode: NSLineBreakMode? = nil,
                     numberOfLines: Int? = nil) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.font = UIFont(descriptor: UIFontDescriptor(name: fontType.rawValue, size: size),size: size)
        self.textColor = textColor
        if let alignment = alignment {
            self.textAlignment = alignment
        }
        if let numberOfLines = numberOfLines {
            self.numberOfLines = numberOfLines
        }
        if let lineBreakMode = lineBreakMode {
            self.lineBreakMode = lineBreakMode
        }
    }
    
}
