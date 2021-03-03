//
//  Movie.swift
//  The Movie DB
//
//  Created by Blazej Krupa on 3/3/21.
//

import Foundation

struct Movie: Decodable {
    var poster_path: String
    var title: String
    var vote_average: Double // rating
    var duration: String? // its missing in rest call
    // date format YYYY-mm-dd
    var release_date: String
    var id: Int
}
