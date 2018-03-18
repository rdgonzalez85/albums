//
//  GetAlbumRouter.swift
//  albums
//
//  Created by Rodrigo Gonzalez on 26/02/2018.
//  Copyright © 2018 Rodrigo Gonzalez. All rights reserved.
//

import UIKit

struct GetAlbumRouter {
    static let storyboardName = "Main"
    static let viewControllerIdentifier = "AlbumViewController"
    
    
    static func getAlbumViewController() -> UIViewController {
        if let viewController = UIStoryboard.storyboard(name: storyboardName, viewController: viewControllerIdentifier) as? AlbumViewController, let endpointURL = self.getURL() {
            
            let provider = GetAlbumNetworkProvider(endpointURL: endpointURL)
            
            let parser = GetAlbumParserImp()
            
            let interactor = GetAlbumInteractorImp(parser: parser, provider: provider)
            
            let presenter = GetAlbumPresenterImp(interactor: interactor)
            
            presenter.delegate = viewController
            viewController.presenter = presenter
            
            return viewController
        }
        return UIViewController()
    }
    
    // get the url from the Info.plist file
    static let fileName = "Info"
    static let fileExtension = "plist"
    static let endpointURLKey = "endpointURL"
    
    static func getURL() -> String? {
        if let fileUrl = Bundle.main.url(forResource: fileName, withExtension: fileExtension),
            let data = try? Data(contentsOf: fileUrl) {
            if let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any] {
                return result?[endpointURLKey] as? String
            }
        }
        return nil
    }
}

// extension to load UIViewControllers from UIStoryboard
extension UIStoryboard {
    class func storyboard(name: String, viewController: String) -> UIViewController {
        return UIStoryboard.init(name: name, bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
}
