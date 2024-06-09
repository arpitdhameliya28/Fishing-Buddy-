//
//  ChatView_cell.swift
//  Fishing Buddy
//
//  Created by Abhi's Computers on 15/02/24.
//

import UIKit

class ChatView_cell: UITableViewCell {

    @IBOutlet weak var meslblView: UIView!
    @IBOutlet weak var messageLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.meslblView.layer.cornerRadius = 8
        self.meslblView.layer.borderWidth = 0.5
        self.meslblView.layer.borderColor = UIColor.systemGray3.cgColor
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
