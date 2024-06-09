//
//  Home_story_Cell.swift
//  Fishing Buddy
//
//  Created by Abhi's Computers on 15/02/24.
//

import UIKit

class Home_story_Cell: UITableViewCell {

    @IBOutlet weak var profileimg: UIImageView!
    @IBOutlet weak var imageview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.profileimg.layer.cornerRadius = profileimg.frame.height / 2
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
