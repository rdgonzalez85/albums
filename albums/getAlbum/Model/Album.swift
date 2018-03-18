//
//  Album.swift
//  albums
//
//  Created by Rodrigo Gonzalez on 22/02/2018.
//  Copyright © 2018 Rodrigo Gonzalez. All rights reserved.
//

import Foundation

struct Album {
    let wrapperType: String
    let artistId: Int
    let artistName: String
    let amgArtistId: Int
    let primaryGenreName: String
    
    let artistType: String?
    let collectionId: Int?
    let collectionName: String?
    let collectionCensoredName: String?
    let artistViewUrl: String?
    let primaryGenreId: Int?
    let collectionType:String?
    let collectionViewUrl: String?
    let artworkUrl60: String?
    let artworkUrl100: String?
    let collectionPrice: Float?
    let collectionExplicitness: String?
    let trackCount: Int?
    let copyright: String?
    let country: String?
    let currency:String?
    let releaseDate: String?
    let artistLinkUrl: String?
}
