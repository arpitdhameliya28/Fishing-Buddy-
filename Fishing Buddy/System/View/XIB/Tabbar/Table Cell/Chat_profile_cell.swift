//
//  Chat_profile_cell.swift
//  Fishing Buddy
//
//  Created by Abhi's Computers on 15/02/24.
//

import UIKit

class Chat_profile_cell: UITableViewCell {

    @IBOutlet weak var profileimage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var Chat_profile_view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileimage.layer.cornerRadius = profileimage.frame.height / 2
        Chat_profile_view.layer.cornerRadius = 8
        Chat_profile_view.layer.borderColor = UIColor.systemGray4.cgColor
        Chat_profile_view.layer.borderWidth = 1
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
