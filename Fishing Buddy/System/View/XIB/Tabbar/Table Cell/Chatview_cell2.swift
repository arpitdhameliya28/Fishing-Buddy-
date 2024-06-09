//
//  Chatview_cell2.swift
//  Fishing Buddy
//
//  Created by Abhi's Computers on 21/02/24.
//

import UIKit

class Chatview_cell2: UITableViewCell {

    @IBOutlet weak var messTextView: UIView!
    @IBOutlet weak var mes_text: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code  self.meslblView.layer.cornerRadius = 8
        self.messTextView.layer.borderWidth = 0.5
        self.messTextView.layer.borderColor = UIColor.systemGray3.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
