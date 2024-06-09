//
//  Shopitem_cell.swift
//  Fishing Buddy
//
//  Created by Abhi's Computers on 17/02/24.
//

import UIKit

class Shopitem_cell: UICollectionViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        self.itemImageView.layer.cornerRadius = 5
        
        
    }

}
