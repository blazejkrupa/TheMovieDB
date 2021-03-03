//
//  RestManager.swift
//  The Movie DB
//
//  Created by Blazej Krupa on 3/3/21.
//

import Foundation

protocol Restable {
    static func dataTask<D: Decodable>(type: D.Type, endpoint: Endpoint, completion: @escaping (Result<D, Error>) -> Void)
    static func imageDataTask(path: String, completion: @escaping(Data?) -> Void )
}

enum MovieApiError: Error {
    
    case dataNotFound
    case noInternetConnection
    
    var description: String {
        switch self {
        case .dataNotFound:
            return "Data in request not found"
        case .noInternetConnection:
            return "No Internet Connection"
        }
    }
}

struct RestManager {
    private static let base = "https://api.themoviedb.org/3"
    private static let api_key = "55957fcf3ba81b137f8fc01ac5a31fb5"
    private static let imgBase = "https://image.tmdb.org/t/p/w500"
    
    private static func buildRequest(for endpoint: Endpoint) -> URLRequest? {
        
        guard let url = buildUrl(for: endpoint) else {
            return nil
        }
        let request = URLRequest(url: url)
        return request
    }
    
    private static func buildUrl(for endpoint: Endpoint) -> URL? {
        guard var components = URLComponents(string: base + endpoint.path) else {
            return nil
        }
        components.queryItems = endpoint.params.map({
            URLQueryItem(name: $0.0, value: $0.1)
        })
        components.queryItems?.append(URLQueryItem(name: "api_key", value: api_key))
        guard let url = components.url else {
            return nil
        }
        return url
    }
}

extension RestManager: Restable {
    static func dataTask<D: Decodable>(type: D.Type, endpoint: Endpoint, completion: @escaping (Result<D, Error>) -> Void) {
        
        guard let request = buildRequest(for: endpoint) else {
            completion(.failure(MovieApiError.dataNotFound))
            return
        }
        let dataTask = URLSession(configuration: .default).dataTask(with: request) { (data, response, error) in
            guard let unwrapedData = data else {
                completion(.failure(MovieApiError.dataNotFound))
                return
            }
            do {
                let decoded = try JSONDecoder().decode(D.self, from: unwrapedData)
                completion(.success(decoded))
            } catch let error {
                completion(.failure(error))
            }
            
        }
        dataTask.resume()
    }
    
    static func imageDataTask(path: String, completion: @escaping(Data?) -> Void ) {
        guard let url = URL(string: imgBase + path) else {
            completion(nil)
            return
        }
        let dataTask = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
            completion(data)
        }
        dataTask.resume()
    }
}
