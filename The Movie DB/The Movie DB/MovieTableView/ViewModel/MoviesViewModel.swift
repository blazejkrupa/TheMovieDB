//
//  MoviesViewModel.swift
//  The Movie DB
//
//  Created by Blazej Krupa on 3/4/21.
//

import Foundation

class MoviesViewModel:NSObject {
    
    private(set) var items: [MovieViewModel] = [] {
        didSet { reloadTableViewCallback?() }
    }
    private var model: MoviesModel = .init()
    
    var reloadTableViewCallback: (() -> ())? = nil
    var didSelectItem: ((MovieViewModel) -> ())? = nil
    
    override init() {
        super.init()
        fetchNowPlaying()
    }
    
    func fetchNowPlaying() {
        MovieAPI.fetchNowPlaying { result in
            switch result {
            case .success(let movies):
                self.model.nowPlayingMovies = movies
                self.items = movies.map({ MovieViewModel(item: $0) })
            case .failure(_):
                break
            }
        }
    }
    
    func didSelectItem(indexPath: IndexPath) {
        didSelectItem?(items[indexPath.row])
    }
    
    func clear() {
        items = model.nowPlayingMovies.map({ MovieViewModel(item: $0) })
        model.searchMovie = []
    }
    
    func search(text:String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(query(for:)), object: text)
        perform(#selector(query(for:)), with: text, afterDelay: 0.45)
    }
    
    @objc private func query(for text: String) {
        MovieAPI.fetchQuery(text: text) { result in
            switch result {
            case .success(let movies):
                self.model.searchMovie = movies
                self.items = movies.map({ MovieViewModel(item: $0) })
            case .failure(_):
                self.items = []
            }
        }
    }
}
