//
//  MovieDetail.swift
//  The Movie DB
//
//  Created by Blazej Krupa on 3/3/21.
//

import Foundation

struct MovieDetail: Decodable {
    var duration: String? // missing
    var title: String
    var overview: String
    var poster_path: String
    /// date format "YYYY-MM-dd"
    var release_date: String
    var genres: [Genre]
    
}
