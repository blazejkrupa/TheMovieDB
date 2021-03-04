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
    
    init(item: Movie) {
        self.title = item.title
        self.duration = item.duration ?? " "
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        if let date = dateFormatter.date(from: item.release_date) {
            dateFormatter.dateFormat = "MMMM dd, YYYY"
            self.releaseDate = dateFormatter.string(from: date)
        } else {
            self.releaseDate = item.release_date
        }
        self.imagePath = item.poster_path
        self.id = item.id
    }
    
    func setFavorite() {
        isFavorite = !isFavorite
    }
}
