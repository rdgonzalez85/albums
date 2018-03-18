//
//  GetAlbumPresenterFailableMock.swift
//  albumsTests
//
//  Created by Rodrigo Gonzalez on 26/02/2018.
//  Copyright © 2018 Rodrigo Gonzalez. All rights reserved.
//

import Foundation
@testable import albums

class GetAlbumPresenterFailableMock: NSObject, GetAlbumPresenter {
    
    enum TestError: Error {
        case error
    }
    
    var interactor: GetAlbumInteractor?
    
    var delegate: GetAlbumPresenterDelegate?
    
    func loadAlbumInformation() {
        delegate?.showError(error: TestError.error)
    }
    
    func numberOfItems() -> Int {
        return 1
    }
    
    func itemFor(indexPath: IndexPath) -> AlbumCellData {
        return AlbumCellData(albumTitle: "", albumArtist: "", albumImage: "")
    }

}
