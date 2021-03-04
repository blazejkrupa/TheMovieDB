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
    case movie_detail_caption = "Movie.Detail.Caption"
    case movie_detail_rating = "Movie.Detail.Rating"
    case movie_detail_rating_na = "Movie.Detail.Rating.NA"
    
}

extension Strings: Localizable {
    var localized: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
