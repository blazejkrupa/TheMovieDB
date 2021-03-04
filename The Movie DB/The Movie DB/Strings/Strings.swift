//
//  Strings.swift
//  The Movie DB
//
//  Created by Blazej Krupa on 3/3/21.
//

import Foundation

protocol Localizable {
    var localized: String { get }
}

enum Strings: String {
    case movies_title = "Movies.Title"
    
}

extension Strings: Localizable {
    var localized: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
