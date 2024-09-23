//
//  AlbumTableViewCell.swift
//  MovieDetails
//
//  Created by Abouzar Moradian on 9/23/24.
//

import UIKit
import Kingfisher

class AlbumTableViewCell: UITableViewCell {

    var viewModel: AlbumCellViewModel?
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupUI(){
        guard let album = viewModel?.album else { return }
        
        thumbnailImageView.kf.setImage(with: URL(string: album.thumbnailUrl))
    }

}
