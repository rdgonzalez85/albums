//
//  GetAlbumPresenter.swift
//  albums
//
//  Created by Rodrigo Gonzalez on 22/02/2018.
//  Copyright © 2018 Rodrigo Gonzalez. All rights reserved.
//

import Foundation

protocol GetAlbumPresenter {
    var interactor: GetAlbumInteractor? {get}
    var delegate: GetAlbumPresenterDelegate? {get set}
    func loadAlbumInformation()
}

protocol GetAlbumPresenterDelegate: NSObjectProtocol {
    func showError(error:Error)
    func dataReady(albumInformation: [AlbumCellData])
}

class GetAlbumPresenterImp: GetAlbumPresenter {
    let interactor: GetAlbumInteractor?
    weak var delegate: GetAlbumPresenterDelegate?
    
    init(interactor: GetAlbumInteractor) {
        self.interactor = interactor
    }
    
    func loadAlbumInformation() {
        interactor?.loadAlbumInformation(completionHandler: { albums, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.delegate?.showError(error: error)
                }
            } else {
                let albums = self.getDisplayableInformation(albums: albums)
                DispatchQueue.main.async {
                    self.delegate?.dataReady(albumInformation: albums)
                }
            }
        })
    }
    
    private func getDisplayableInformation(albums: [Album]?) -> [AlbumCellData] {
        guard let albums = albums else {
            return []
        }
        var dataAlbums = [AlbumCellData]()
        
        for album in albums {
            dataAlbums.append(AlbumCellData(albumTitle: album.collectionName, albumArtist: album.artistName, albumImage: album.artworkUrl60))
        }
        return dataAlbums
    }
}
