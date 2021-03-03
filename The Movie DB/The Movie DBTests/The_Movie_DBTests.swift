//
//  The_Movie_DBTests.swift
//  The Movie DBTests
//
//  Created by Blazej Krupa on 3/3/21.
//

import XCTest
@testable import The_Movie_DB

class The_Movie_DBTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDownloadingNowPlaying() {
        MovieAPI.fetchNowPlaying { (result) in
            switch result {
            case .success( let movies ):
                XCTAssertTrue(!movies.isEmpty)
            case .failure(let error):
                XCTAssert(error.localizedDescription == MovieApiError.dataNotFound.localizedDescription)
            }
        }
    }
    
    func testDownloadingDetail() {
        let movieId = 217225
        let orgTitle = "Anthaka Mundu Aa Tarvatha"
        MovieAPI.fetchMovieDetail(id: movieId) { (result) in
            switch result {
            case .success(let movie):
                XCTAssertTrue(movie.title == orgTitle)
            case .failure(let error):
                XCTAssert(error.localizedDescription == MovieApiError.dataNotFound.localizedDescription)
            }
            
        }
    }
}
