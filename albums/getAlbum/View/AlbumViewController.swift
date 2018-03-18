//
//  AlbumViewController.swift
//  albums
//
//  Created by Rodrigo Gonzalez on 22/02/2018.
//  Copyright © 2018 Rodrigo Gonzalez. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var presenter: GetAlbumPresenter?
    var albums = [AlbumCellData]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        loadIndicator.startAnimating()
        
        presenter?.loadAlbumInformation()
    }

}

extension AlbumViewController: GetAlbumPresenterDelegate {
    func showError(error: Error) {
        // TODO: display an error
        loadIndicator.stopAnimating()
    }
    
    func dataReady(albumInformation: [AlbumCellData]) {
        loadIndicator.stopAnimating()
        albums = albumInformation
    }
}

extension AlbumViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.identifier, for: indexPath) as? AlbumTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setData(albums[indexPath.row])
        
        return cell
    }
}

extension AlbumViewController: UITableViewDelegate {
    
}
