//
//  Colors.swift
//  The Movie DB
//
//  Created by Blazej Krupa on 3/4/21.
//

import UIKit

enum Colors: String {
    case golden = "golden"
    
    var color: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: self.rawValue) ?? UIColor()
        } else {
            switch self {
            case .golden:
                return #colorLiteral(red: 0.9, green: 0.81, blue: 0, alpha: 1.0)
            }
        }
    }
}
