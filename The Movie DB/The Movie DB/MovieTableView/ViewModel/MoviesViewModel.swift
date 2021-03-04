//
//  MoviesViewModel.swift
//  The Movie DB
//
//  Created by Blazej Krupa on 3/4/21.
//

import Foundation

class MoviesViewModel {
    
    private(set) var items: [MovieViewModel] = [] {
        didSet {
            reloadTableViewCallback?()
        }
    }
    
    private(set) var isFetching = false
    
    var reloadTableViewCallback: (() -> ())? = nil
    var didSelectItem: ((MovieViewModel) -> ())? = nil
    
    init() {
        fetchNowPlaying()
    }
    
    func fetchNowPlaying() {
        MovieAPI.fetchNowPlaying { result in
            switch result {
            case .success(let movies):
                self.items = movies.map({ MovieViewModel(item: $0) })
            case .failure(_):
                break
            }
        }
    }
    
    func didSelectItem(indexPath: IndexPath) {
        didSelectItem?(items[indexPath.row])
    }
}
