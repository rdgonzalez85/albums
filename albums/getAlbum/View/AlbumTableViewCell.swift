//
//  AlbumTableViewCell.swift
//  albums
//
//  Created by Rodrigo Gonzalez on 24/02/2018.
//  Copyright © 2018 Rodrigo Gonzalez. All rights reserved.
//

import UIKit
import SDWebImage

struct AlbumCellData {
    let albumTitle: String?
    let albumArtist: String
    let albumImage: String?
}

class AlbumTableViewCell: UITableViewCell {

    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var albumImage: UIImageView!
    
    static let identifier = "AlbumTableViewCell"
    
    func setData(_ data: AlbumCellData) {
        artistLabel.text = data.albumArtist
        albumTitleLabel.text = data.albumTitle
        if let imgURL = data.albumImage {
            albumImage.sd_setImage(with: URL(string: imgURL), placeholderImage: UIImage(named: "placeholder"))

        }
    }
}
