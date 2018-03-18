//
//  GetAlbumProviderTests.swift
//  albumsTests
//
//  Created by Rodrigo Gonzalez on 26/02/2018.
//  Copyright © 2018 Rodrigo Gonzalez. All rights reserved.
//

import XCTest
@testable import albums

class GetAlbumProviderTests: XCTestCase {
    
    func testGetValues() {
        let provider = TestHelper.provider
        
        let providerExpectation = expectation(description: "providerExpectation")
        
        provider.getValues { (data, error) in
            XCTAssertNil(error, "should not have an error")
            XCTAssertNotNil(data, "should have data")
            providerExpectation.fulfill()
        }
    
        waitForExpectations(timeout: 5) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
        
    }
}
