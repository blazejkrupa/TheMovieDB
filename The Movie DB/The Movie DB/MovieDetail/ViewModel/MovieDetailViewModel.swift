//
//  MovieDetailViewModel.swift
//  The Movie DB
//
//  Created by Blazej Krupa on 3/4/21.
//

import Foundation

final class MovieDetailViewModel {
    typealias Callback = ((String) -> ())?
    
    private(set) var movie: MovieViewModel
    
    var setImageUrl: Callback = nil
    var setTitle: Callback = nil
    var setDate: Callback = nil
    var setRating: Callback = nil
    var setOverview: Callback = nil
    var setFavorite: ((Bool) -> ())? = nil
    
    init(movie: MovieViewModel) {
        self.movie = movie
        MovieAPI.fetchMovieDetail(id: movie.id) { [weak self] result in
            switch result {
            case .success(let detail):
                DispatchQueue.main.async {
                    self?.setOverview?(detail.overview)
                }
                
            case .failure(_):
                break
            }
        }
    }
    
    func build() {
        setImageUrl?(movie.imagePath)
        setTitle?(movie.title)
        setDate?(movie.releaseDate)
        setRating?("\(movie.rating)")
        setFavorite?(movie.isFavorite)
    }
    
    func favoriteDidTap() {
        movie.setFavorite()
        setFavorite?(movie.isFavorite)
    }
}
