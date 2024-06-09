//
//  Extention.swift
//  Fishing Buddy
//
//  Created by Abhi's Computers on 18/02/24.
//

import Foundation
import UIKit




extension UIView {
    
    func setgradiantcolor (color: [UIColor], startpoint: CGPoint , endpoint: CGPoint , cornerradius: CGFloat) {
        
       let gradiantlayer = CAGradientLayer()
        gradiantlayer.frame = bounds
        gradiantlayer.cornerRadius = cornerradius
        gradiantlayer.colors = color.map {$0 .cgColor}
        gradiantlayer.startPoint = startpoint
        gradiantlayer.endPoint = endpoint
        
        layer.insertSublayer(gradiantlayer, at: 0)
        
    }
    
}

