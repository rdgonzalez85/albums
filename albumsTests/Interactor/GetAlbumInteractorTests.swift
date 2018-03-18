//
//  GetAlbumInteractorTests.swift
//  albumsTests
//
//  Created by Rodrigo Gonzalez on 26/02/2018.
//  Copyright © 2018 Rodrigo Gonzalez. All rights reserved.
//

import XCTest
@testable import albums

class GetAlbumInteractorTests: XCTestCase {
    func testLoadAlbumInformation() {
        let interactor = TestHelper.interactor
        
        let interactorExpectation = expectation(description: "interactorExpectation")
        
        interactor.loadAlbumInformation { albums, error in
            
            XCTAssertNil(error, "should not have an error")
            
            XCTAssertNotNil(albums, "should have albums information")
            let album = albums?.first
            
            XCTAssertNotNil(album?.wrapperType, "should have a wrapper type")
            XCTAssertNotNil(album?.artistType, "should have an artist type")
            XCTAssertNotNil(album?.artistName, "should have an artist name")
            XCTAssertNotNil(album?.artistLinkUrl, "should have an artist link url")
            XCTAssertNotNil(album?.artistId, "should have an artist id")
            XCTAssertNotNil(album?.primaryGenreName, "should have a primary genre name")
            XCTAssertNotNil(album?.primaryGenreId, "should have a primary genre id")
            
            interactorExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
