//
//  GetAlbumPresenterTests.swift
//  albumsTests
//
//  Created by Rodrigo Gonzalez on 26/02/2018.
//  Copyright © 2018 Rodrigo Gonzalez. All rights reserved.
//

import XCTest
@testable import albums

class GetAlbumPresenterTests: XCTestCase {
    
    var showErrorCalled = false
    var dataReadyCalled = false
  
    var expectation: XCTestExpectation?
    
    func testLoadAlbumInformation() {
        var presenter = TestHelper.presenter
        presenter.delegate = self
        
        expectation = expectation(description: "presenterExpectation")
        
        presenter.loadAlbumInformation()
        
        waitForExpectations(timeout: 5) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testLoadAlbumFailInformation() {
        var presenter = TestHelper.mockPresenter
        
        presenter.delegate = self
        
        expectation = expectation(description: "presenterExpectation")
        
        presenter.loadAlbumInformation()
        
        waitForExpectations(timeout: 5) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testNumberOfItems() {
        var presenter = TestHelper.mockPresenter
        
        presenter.delegate = self
        
        let numberOfItems = presenter.numberOfItems()
        
        XCTAssert(numberOfItems > 0, "should have items")
    }
    
    func testItemForRow() {
        var presenter = TestHelper.mockPresenter
        
        presenter.delegate = self
        
        let indexPath = IndexPath(item: 0, section: 0)
        let item = presenter.itemFor(indexPath: indexPath)
        
        XCTAssertNotNil(item.albumArtist, "should have an artist")
        XCTAssertNotNil(item.albumImage, "should have an image")
        XCTAssertNotNil(item.albumTitle, "should have a title")
    }
}

extension GetAlbumPresenterTests: GetAlbumPresenterDelegate {
    
    func showError(error: Error) {
        showErrorCalled = true
        expectation?.fulfill()
    }
    
    func dataReady() {
        dataReadyCalled = true
        expectation?.fulfill()
    }
}
