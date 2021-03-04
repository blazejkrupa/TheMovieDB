//
//  UIStackViewExtension.swift
//  The Movie DB
//
//  Created by Blazej Krupa on 3/4/21.
//

import UIKit

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat? = nil) {
        self.init()
        arrangedSubviews.forEach({ addArrangedSubview($0) })
        translatesAutoresizingMaskIntoConstraints = false
        self.axis = axis
        if let spacing = spacing {
            self.spacing = spacing
        }
    }
}
