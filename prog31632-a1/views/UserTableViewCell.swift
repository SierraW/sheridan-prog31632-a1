//
//  UserTableViewCell.swift
//  prog31632-a1
//
//  Created by Yiyao Zhang on 2021-03-28.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var user: User? {
        didSet {
            guard let user = user else { return }
            if let avatarImage = avatarImage {
                avatarImage.image = UIImage(named: user.avatar)
            }
            if let nameLabel = nameLabel {
                nameLabel.text = user.name
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("here")
    }

}
