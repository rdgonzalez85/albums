//
//  GetAlbumParserImp.swift
//  albums
//
//  Created by Rodrigo Gonzalez on 25/02/2018.
//  Copyright © 2018 Rodrigo Gonzalez. All rights reserved.
//

import Foundation

protocol GetAlbumParser {
    func parseValues(values: [String:Any]) -> [Album]
}

struct GetAlbumParserImp: GetAlbumParser {
    
    private enum Keys: String {
        case wrapperType, artistId, artistName,collectionId, amgArtistId, collectionName, collectionCensoredName, artistViewUrl, primaryGenreId, collectionType, collectionViewUrl, artworkUrl60, artworkUrl100, collectionPrice, collectionExplicitness, trackCount, copyright, country, currency, releaseDate, primaryGenreName, artistLinkUrl, results, artistType
    }
    
    
    func parseValues(values: [String:Any]) -> [Album] {
        
        guard let albumValues = values[Keys.results.rawValue] as? [[String:Any]] else {
            return []
        }
        
        var values = [Album]()
        
        for album in albumValues {
            if let parsedAlbum = parseValue(value: album) {
                values.append(parsedAlbum)
            }
        }
        
        return values
    }
    
    private func parseValue(value: [String:Any]) -> Album? {
        guard let wrapperType = value[Keys.wrapperType.rawValue] as? String,
            let artistId = value[Keys.artistId.rawValue] as? Int,
            let artistName = value[Keys.artistName.rawValue] as? String,
            let amgArtistId = value[Keys.amgArtistId.rawValue] as? Int,
            let primaryGenreName = value[Keys.primaryGenreName.rawValue] as? String else {
                return nil
        }

        return Album(wrapperType: wrapperType,
                     artistId: artistId,
                     artistName: artistName,
                     amgArtistId: amgArtistId,
                     primaryGenreName: primaryGenreName,
                     artistType: value[Keys.artistType.rawValue] as? String,
                     collectionId: value[Keys.collectionId.rawValue] as? Int,
                     collectionName: value[Keys.collectionName.rawValue] as? String,
                     collectionCensoredName: value[Keys.collectionCensoredName.rawValue] as? String,
                     artistViewUrl: value[Keys.artistViewUrl.rawValue] as? String,
                     primaryGenreId: value[Keys.primaryGenreId.rawValue] as? Int,
                     collectionType: value[Keys.collectionType.rawValue] as? String,
                     collectionViewUrl: value[Keys.collectionViewUrl.rawValue] as? String,
                     artworkUrl60: value[Keys.artworkUrl60.rawValue] as? String,
                     artworkUrl100: value[Keys.artworkUrl100.rawValue] as? String,
                     collectionPrice: value[Keys.collectionPrice.rawValue] as? Float,
                     collectionExplicitness: value[Keys.collectionExplicitness.rawValue] as? String,
                     trackCount: value[Keys.trackCount.rawValue] as? Int,
                     copyright:  value[Keys.copyright.rawValue] as? String,
                     country: value[Keys.country.rawValue] as? String,
                     currency: value[Keys.currency.rawValue] as? String,
                     releaseDate: value[Keys.releaseDate.rawValue] as? String,
                     artistLinkUrl: value[Keys.artistLinkUrl.rawValue] as? String)
    }
}
