//
//  UILabelExtension.swift
//  The Movie DB
//
//  Created by Blazej Krupa on 3/4/21.
//

import UIKit

extension UILabel {
    
    convenience init(text: String?, withFontType fontType: HelveticaNeue, size: CGFloat, textColor: UIColor) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.font = UIFont(descriptor: UIFontDescriptor(name: fontType.rawValue, size: size),size: size)
        self.textColor = textColor
    }
    
}
