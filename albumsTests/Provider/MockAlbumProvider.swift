//
//  MockAlbumProvider.swift
//  albumsTests
//
//  Created by Rodrigo Gonzalez on 26/02/2018.
//  Copyright © 2018 Rodrigo Gonzalez. All rights reserved.
//

import Foundation
@testable import albums

struct MockAlbumProvider: GetAlbumProvider {
    
    func getValues(completionHandler: @escaping GetAlbumProviderResponse) {
        completionHandler(TestHelper.albumInformation, nil)
    }
}
