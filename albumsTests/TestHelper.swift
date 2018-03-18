//
//  TestHelper.swift
//  albumsTests
//
//  Created by Rodrigo Gonzalez on 26/02/2018.
//  Copyright © 2018 Rodrigo Gonzalez. All rights reserved.
//

import Foundation
@testable import albums

struct TestHelper {
    static let urlEndpoint = "https://itunes.apple.com/lookup?id=909253&entity=album"
    
    static var provider: GetAlbumProvider {
        get {
            return GetAlbumNetworkProvider(endpointURL: TestHelper.urlEndpoint)
        }
    }
    
    static var parser: GetAlbumParser {
        get {
            return GetAlbumParserImp()
        }
    }
    
    private static var mockProvider: GetAlbumProvider {
        get {
            return MockAlbumProvider()
        }
    }
    static var interactor: GetAlbumInteractor {
        get {
            let provider = TestHelper.mockProvider
            let parser = TestHelper.parser
            
            return GetAlbumInteractorImp(parser: parser, provider: provider)
        }
    }
    
    static var presenter: GetAlbumPresenter {
        get {
            let interactor = TestHelper.interactor
            
            return GetAlbumPresenterImp(interactor: interactor)
        }
    }

    static var mockPresenter: GetAlbumPresenter {
        get {
            return GetAlbumPresenterFailableMock()
        }
    }
    static let albumInformation: [String : Any] = [
        "resultCount": 1,
        "results": [[
            "wrapperType":"artist",
            "artistType":"Artist",
            "artistName":"Jack Johnson",
            "artistLinkUrl":"https://itunes.apple.com/us/artist/jack-johnson/909253?uo=4",
            "artistId":909253,
            "amgArtistId":468749,
            "primaryGenreName":"Rock",
            "primaryGenreId":21
        ]]
    ]
}

