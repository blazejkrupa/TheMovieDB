//
//  Endpoint.swift
//  The Movie DB
//
//  Created by Blazej Krupa on 3/3/21.
//

import Foundation

enum Endpoint {
    case now_playing
    case movieId(Int)
    case searchMovie(String)
    
    var path: String {
        switch self {
        case .now_playing:
            return "/movie/now_playing"
        case .movieId(let id):
            return "/movie/\(id)"
        case .searchMovie(_):
            return "search/movie"
        }
    }
    
    var params: [String:String] {
        switch self {
        case .now_playing:
            return [ "language":"en-US",
                    "page":"undefined" ]
        case .movieId(_):
            return [:]
        case .searchMovie(let query):
            return [ "query":query]
        }
    }
    
    var httpMethod: String {
        switch self {
        case .now_playing,.movieId(_),.searchMovie(_):
            return "GET"
        }
    }
}
