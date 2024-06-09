//
//  home_image_Cell.swift
//  Fishing Buddy
//
//  Created by Abhi's Computers on 14/02/24.
//

import UIKit

class home_image_Cell: UICollectionViewCell {

    @IBOutlet weak var imageview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageview.layer.cornerRadius = 10
    }

}
