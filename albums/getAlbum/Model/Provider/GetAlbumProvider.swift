//
//  getAlbumProvider.swift
//  albums
//
//  Created by Rodrigo Gonzalez on 22/02/2018.
//  Copyright © 2018 Rodrigo Gonzalez. All rights reserved.
//

import Foundation

typealias GetAlbumProviderResponse = (Dictionary<String,Any>?, Error?) -> Void

protocol GetAlbumProvider {
    func getValues(completionHandler: @escaping GetAlbumProviderResponse)
}

enum GetAlbumProviderError: Error {
    case missingURL
    case connectionError(error:Error)
    case incorrectFormat
}

struct GetAlbumNetworkProvider: GetAlbumProvider {
    var endpointURL: String?
    
    func getValues(completionHandler: @escaping GetAlbumProviderResponse) {
        
        guard let endpointURL = endpointURL, let url = URL(string: endpointURL) else {
            completionHandler(nil, GetAlbumProviderError.missingURL)
            return
        }
        
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { (data, response, error) in

            if let error = error {
               completionHandler(nil, GetAlbumProviderError.connectionError(error: error))
            } else {
                if let data = data {
                    do {
                        let jsonData = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any]
                        completionHandler(jsonData, nil)
                    } catch {
                        completionHandler(nil, GetAlbumProviderError.incorrectFormat)
                    }
                }
            }
            }.resume()
    }
}
