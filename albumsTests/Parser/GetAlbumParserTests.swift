//
//  GetAlbumParserTests.swift
//  albumsTests
//
//  Created by Rodrigo Gonzalez on 26/02/2018.
//  Copyright © 2018 Rodrigo Gonzalez. All rights reserved.
//

import XCTest
@testable import albums

class GetAlbumParserTests: XCTestCase {
    
    func testParse() {
        let parser = TestHelper.parser
        
        let data = TestHelper.albumInformation
        
        let albums = parser.parseValues(values: data)
        
        XCTAssertNotNil(albums, "should have albums")
        
        let album = albums.first
        
        XCTAssertNotNil(album?.wrapperType, "should have a wrapper type")
        XCTAssertNotNil(album?.artistType, "should have an artist type")
        XCTAssertNotNil(album?.artistName, "should have an artist name")
        XCTAssertNotNil(album?.artistLinkUrl, "should have an artist link url")
        XCTAssertNotNil(album?.artistId, "should have an artist id")
        XCTAssertNotNil(album?.primaryGenreName, "should have a primary genre name")
        XCTAssertNotNil(album?.primaryGenreId, "should have a primary genre id")
        
    }
}
