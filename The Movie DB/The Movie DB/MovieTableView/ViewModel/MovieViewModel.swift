//
//  MovieViewModel.swift
//  The Movie DB
//
//  Created by Blazej Krupa on 3/4/21.
//

import Foundation

final class MovieViewModel {
    private(set) var title: String
    private(set) var releaseDate: String
    private(set) var duration: String
    private(set) var imagePath: String
    private(set) var id: Int
    private(set) var isFavorite: Bool = false
    
    init(item: Movie, favoriteIds: Set<Int>) {
        self.title = item.title
        self.duration = item.duration ?? " "
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        if let releaseDate = item.release_date, let date = dateFormatter.date(from: releaseDate) {
            dateFormatter.dateFormat = "MMMM dd, YYYY"
            self.releaseDate = dateFormatter.string(from: date)
        } else {
            self.releaseDate = item.release_date ?? ""
        }
        if let path = item.poster_path {
            self.imagePath = path
        } else {
            self.imagePath = ""
        }
        isFavorite = favoriteIds.contains(item.id)
        self.id = item.id
    }
    
    func setFavorite() {
        isFavorite = !isFavorite
        if isFavorite {
            UserDefaults.standard.favoriteIds.insert(id)
        } else {
            UserDefaults.standard.favoriteIds.remove(id)
        }
        
    }
}
