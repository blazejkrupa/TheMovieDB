//
//  MovieAPI.swift
//  The Movie DB
//
//  Created by Blazej Krupa on 3/3/21.
//

import Foundation

class MovieAPI {
    
    private static let imageCache = NSCache<NSString, NSData>()
    
    static func fetchNowPlaying(completion: @escaping (Result<[Movie], Error>) -> Void) {
        RestManager.dataTask(type: MoviesNowPlaying.self, endpoint: .now_playing) { result in
            switch result {
            case .success( let nowPlaying):
                completion(.success(nowPlaying.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    static func fetchMovieDetail(id: Int, completion: @escaping (Result<MovieDetail, Error>) -> Void) {
        RestManager.dataTask(type: MovieDetail.self, endpoint: .movieId(id)) { result in
            switch result {
            case .success( let movie):
                completion(.success(movie))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    static func fetchImage(path: String, completion: @escaping (Data?) -> Void) {
        
        if let data = MovieAPI.imageCache.object(forKey: path as NSString) {
            completion(data as Data)
            return
        }
        
        RestManager.imageDataTask(path: path) { (data) in
            if let data = data {
                imageCache.setObject(data as NSData, forKey: path as NSString)
            }
            completion(data)
        }
    }
}
