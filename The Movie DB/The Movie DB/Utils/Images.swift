//
//  Images.swift
//  The Movie DB
//
//  Created by Blazej Krupa on 3/4/21.
//

import UIKit

enum Images: String {
    case star = "star"
    
    var image: UIImage {
        return UIImage(named: self.rawValue) ?? .init()
    }
}
