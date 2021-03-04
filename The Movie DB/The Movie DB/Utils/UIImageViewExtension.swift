//
//  UIImageViewExtension.swift
//  The Movie DB
//
//  Created by Blazej Krupa on 3/4/21.
//

import UIKit

extension UIImageView {
    func loadImageFromURL(path: String) {
        MovieAPI.fetchImage(path: path) { (data) in
            if let data = data {
                DispatchQueue.main.async { [weak self] in
                    self?.image = UIImage(data: data)
                }
            }
        }
    }
    
    convenience init(borderWidth: CGFloat, contentMode: UIView.ContentMode) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderWidth = borderWidth
        self.contentMode = contentMode
    }
    
}
