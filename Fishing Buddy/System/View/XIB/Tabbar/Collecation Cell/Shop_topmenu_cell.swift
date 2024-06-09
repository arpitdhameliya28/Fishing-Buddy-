//
//  Shop_topmenu_cell.swift
//  Fishing Buddy
//
//  Created by Abhi's Computers on 16/02/24.
//

import UIKit

class Shop_topmenu_cell: UICollectionViewCell {

    @IBOutlet weak var section_view: UIView!
    @IBOutlet weak var section_name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        section_view.layer.borderWidth = 0.6
        section_view.layer.borderColor = UIColor.systemGray2.cgColor
        section_view.layer.cornerRadius = 5
        
    }

}
