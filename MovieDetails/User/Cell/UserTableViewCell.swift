//
//  UserTableViewCell.swift
//  MovieDetails
//
//  Created by Abouzar Moradian on 9/23/24.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    var viewModel: UserCellViewModel? {
        didSet { setupUI() }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupUI() {
        guard let user = viewModel?.user else { return }
        
        titleLabel.text = "Title: \(user.title)"
        idLabel.text = "ID: \(String(user.id))"
        userIdLabel.text =   "User ID: \(String(user.userId))"


        
    }

}
