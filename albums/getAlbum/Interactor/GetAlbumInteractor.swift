//
//  GetAlbumInteractor.swift
//  albums
//
//  Created by Rodrigo Gonzalez on 25/02/2018.
//  Copyright © 2018 Rodrigo Gonzalez. All rights reserved.
//

import Foundation

typealias GetAlbumInteractorResponse = ([Album]?, Error?) -> Void

protocol GetAlbumInteractor {
    var provider: GetAlbumProvider? {get}
    var parser: GetAlbumParser? {get}
    func loadAlbumInformation(completionHandler: @escaping GetAlbumInteractorResponse)
}


class GetAlbumInteractorImp: GetAlbumInteractor {
    let parser: GetAlbumParser?
    let provider: GetAlbumProvider?
    
    init(parser: GetAlbumParser, provider: GetAlbumProvider) {
        self.parser = parser
        self.provider = provider
    }
    
    private var albums = [Album]()
    
    func loadAlbumInformation(completionHandler: @escaping GetAlbumInteractorResponse) {
        provider?.getValues(completionHandler: { data, error in
            if let error = error {
                completionHandler(nil, error)
            } else {
                if let data = data, let values = self.parser?.parseValues(values: data) {
                    self.albums = values
                    completionHandler(values, nil)
                }
            }
        })
    }
    
}

