//
//  UserDefaultsExtension.swift
//  The Movie DB
//
//  Created by Blazej Krupa on 3/4/21.
//

import Foundation


extension UserDefaults {
    
    enum Keys:String {
        case favoriteIds
    }
    
    var favoriteIds: Set<Int> {
        set {
            setValue( newValue.map( { $0 }), forKey: Keys.favoriteIds.rawValue)
        } get {
            guard let ids = value(forKey: Keys.favoriteIds.rawValue) as? [Int] else {
                return Set<Int>()
            }
            return Set<Int>(ids)
        }
    }
}
