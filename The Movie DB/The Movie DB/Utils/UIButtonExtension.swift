//
//  UIButtonExtension.swift
//  The Movie DB
//
//  Created by Blazej Krupa on 3/4/21.
//

import UIKit

extension UIButton {
    convenience init(target: Any?, selector: Selector, image: UIImage, tint: UIColor) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(target, action: selector, for: .touchUpInside)
        setImage(image, for: .normal)
        tintColor = tint
    }
}
